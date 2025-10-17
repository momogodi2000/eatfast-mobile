import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';
import 'package:eatfast_mobile/shared/widgets/buttons/app_button.dart';
import 'package:eatfast_mobile/shared/services/ratings/providers/rating_provider.dart';
import 'package:eatfast_mobile/shared/services/ratings/domain/models/rating.dart';

class SubmitRatingScreen extends ConsumerStatefulWidget {
  final String entityId;
  final RatingType ratingType;
  final String entityName;
  final String? orderId;
  final String? imageUrl;

  const SubmitRatingScreen({
    super.key,
    required this.entityId,
    required this.ratingType,
    required this.entityName,
    this.orderId,
    this.imageUrl,
  });

  @override
  ConsumerState<SubmitRatingScreen> createState() => _SubmitRatingScreenState();
}

class _SubmitRatingScreenState extends ConsumerState<SubmitRatingScreen> {
  final _commentController = TextEditingController();
  final _imagePicker = ImagePicker();
  
  double _rating = 0.0;
  final List<File> _selectedImages = [];

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ratingState = ref.watch(ratingProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Donner votre avis'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Entity info
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  if (widget.imageUrl != null)
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(widget.imageUrl!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  else
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        widget.ratingType == RatingType.restaurant
                            ? Icons.restaurant
                            : widget.ratingType == RatingType.item
                                ? Icons.fastfood
                                : Icons.delivery_dining,
                        size: 30,
                        color: Colors.grey[600],
                      ),
                    ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.entityName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Évaluation ${widget.ratingType.displayName.toLowerCase()}',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Rating stars
            const Text(
              'Comment évaluez-vous cette expérience ?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(5, (index) {
                  final starValue = index + 1.0;
                  return GestureDetector(
                    onTap: () => setState(() => _rating = starValue),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        _rating >= starValue ? Icons.star : Icons.star_border,
                        size: 40,
                        color: _rating >= starValue 
                            ? Colors.amber 
                            : Colors.grey[400],
                      ),
                    ),
                  );
                }),
              ),
            ),

            if (_rating > 0) ...[
              const SizedBox(height: 8),
              Center(
                child: Text(
                  _getRatingText(_rating),
                  style: const TextStyle(
                    fontSize: 16,
                    color: DesignTokens.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],

            const SizedBox(height: 32),

            // Comment section
            const Text(
              'Partagez votre expérience (optionnel)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            
            TextField(
              controller: _commentController,
              maxLines: 4,
              maxLength: 500,
              decoration: InputDecoration(
                hintText: _getCommentHint(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
            ),

            const SizedBox(height: 32),

            // Photo section
            const Text(
              'Ajouter des photos (optionnel)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            
            if (_selectedImages.isNotEmpty) ...[
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _selectedImages.length + 1,
                  itemBuilder: (context, index) {
                    if (index == _selectedImages.length) {
                      return _buildAddPhotoButton();
                    }
                    return _buildSelectedImage(index);
                  },
                ),
              ),
            ] else
              _buildAddPhotoButton(),

            const SizedBox(height: 40),

            // Submit button
            SizedBox(
              width: double.infinity,
              child: AppButton(
                onPressed: _rating > 0 && !ratingState.isSubmitting
                    ? _submitRating
                    : null,
                text: 'Publier l\'avis',
                isLoading: ratingState.isSubmitting,
              ),
            ),

            if (ratingState.error != null) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red[200]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.error_outline, color: Colors.red[600]),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        ratingState.error!,
                        style: TextStyle(color: Colors.red[600]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAddPhotoButton() {
    return GestureDetector(
      onTap: _selectedImages.length < 5 ? _pickImages : null,
      child: Container(
        width: 120,
        height: 120,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey[300]!,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_a_photo,
              size: 32,
              color: Colors.grey[600],
            ),
            const SizedBox(height: 8),
            Text(
              'Ajouter\nphoto',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedImage(int index) {
    return Container(
      width: 120,
      height: 120,
      margin: const EdgeInsets.only(right: 12),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: FileImage(_selectedImages[index]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () => _removeImage(index),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getRatingText(double rating) {
    if (rating >= 5) return 'Excellent !';
    if (rating >= 4) return 'Très bon';
    if (rating >= 3) return 'Bon';
    if (rating >= 2) return 'Correct';
    return 'Décevant';
  }

  String _getCommentHint() {
    switch (widget.ratingType) {
      case RatingType.restaurant:
        return 'Parlez-nous de votre expérience : qualité des plats, service, propreté...';
      case RatingType.item:
        return 'Comment avez-vous trouvé ce plat ? Goût, présentation, portion...';
      case RatingType.delivery:
        return 'Comment s\'est passée la livraison ? Rapidité, état des plats...';
    }
  }

  Future<void> _pickImages() async {
    final List<XFile> images = await _imagePicker.pickMultiImage(
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 85,
    );

    if (images.isNotEmpty) {
      setState(() {
        for (final image in images) {
          if (_selectedImages.length < 5) {
            _selectedImages.add(File(image.path));
          }
        }
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  Future<void> _submitRating() async {
    if (_rating <= 0) return;

    // Convert images to paths (in real app, upload to server first)
    final imagePaths = _selectedImages.map((file) => file.path).toList();

    final request = CreateRatingRequest(
      entityId: widget.entityId,
      type: widget.ratingType,
      score: _rating,
      comment: _commentController.text.trim().isEmpty 
          ? null 
          : _commentController.text.trim(),
      photos: imagePaths,
      orderId: widget.orderId,
    );

    final success = await ref.read(ratingProvider.notifier).submitRating(request);

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Merci pour votre avis !'),
          backgroundColor: Colors.green,
        ),
      );
      context.pop(true); // Return true to indicate success
    }
  }
}
