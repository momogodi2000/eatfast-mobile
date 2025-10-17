import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:eatfast_mobile/shared/themes/design_tokens.dart';
import 'package:eatfast_mobile/shared/widgets/buttons/app_button.dart';
import 'package:eatfast_mobile/shared/services/ratings/providers/rating_provider.dart';
import '../../domain/models/rating.dart';

class RatingsScreen extends ConsumerStatefulWidget {
  final String entityId;
  final RatingType ratingType;
  final String entityName;
  final String? imageUrl;

  const RatingsScreen({
    super.key,
    required this.entityId,
    required this.ratingType,
    required this.entityName,
    this.imageUrl,
  });

  @override
  ConsumerState<RatingsScreen> createState() => _RatingsScreenState();
}

class _RatingsScreenState extends ConsumerState<RatingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _sortBy = 'recent'; // recent, highest, lowest

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    
    // Load ratings when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(ratingProvider.notifier).loadRatings(
        entityId: widget.entityId,
        type: widget.ratingType,
      );
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ratingState = ref.watch(ratingProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Avis et notes'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.sort),
            onSelected: (value) {
              setState(() => _sortBy = value);
              _sortRatings(ratingState.ratings);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'recent',
                child: Text('Plus r�cents'),
              ),
              const PopupMenuItem(
                value: 'highest',
                child: Text('Notes les plus �lev�es'),
              ),
              const PopupMenuItem(
                value: 'lowest',
                child: Text('Notes les plus basses'),
              ),
            ],
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'R�sum�'),
            Tab(text: 'Tous les avis'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildSummaryTab(ratingState),
          _buildAllRatingsTab(ratingState),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'ratings_fab',
        onPressed: () => _navigateToSubmitRating(),
        icon: const Icon(Icons.rate_review),
        label: const Text('Donner votre avis'),
        backgroundColor: DesignTokens.primaryColor,
        foregroundColor: Colors.white,
      ),
    );
  }

  Widget _buildSummaryTab(RatingState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red[300],
            ),
            const SizedBox(height: 16),
            Text(
              state.error!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            AppButton(
              onPressed: () => ref.read(ratingProvider.notifier).loadRatings(
                entityId: widget.entityId,
                type: widget.ratingType,
              ),
              text: 'R�essayer',
              size: AppButtonSize.small,
            ),
          ],
        ),
      );
    }

    final summary = state.summary;
    if (summary == null) {
      return const Center(
        child: Text('Aucune donn�e de r�sum� disponible'),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Entity info
          _buildEntityHeader(),
          
          const SizedBox(height: 24),

          // Overall rating
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          summary.formattedRating,
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        _buildStarRating(summary.averageRating),
                        const SizedBox(height: 4),
                        Text(
                          '${summary.totalRatings} avis',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: Column(
                        children: List.generate(5, (index) {
                          final star = 5 - index;
                          final count = summary.getStarCount(star);
                          final percentage = summary.getStarPercentage(star);
                          
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: Row(
                              children: [
                                Text('$star', style: const TextStyle(fontSize: 12)),
                                const SizedBox(width: 4),
                                const Icon(Icons.star, size: 12, color: Colors.amber),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: LinearProgressIndicator(
                                    value: percentage,
                                    backgroundColor: Colors.grey[200],
                                    valueColor: const AlwaysStoppedAnimation<Color>(
                                      DesignTokens.primaryColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                SizedBox(
                                  width: 24,
                                  child: Text(
                                    '$count',
                                    style: const TextStyle(fontSize: 12),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Recent reviews
          if (summary.recentRatings.isNotEmpty) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Avis r�cents',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () => _tabController.animateTo(1),
                  child: const Text('Voir tout'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...summary.recentRatings.take(3).map((rating) => 
                _buildRatingCard(rating)),
          ],
        ],
      ),
    );
  }

  Widget _buildAllRatingsTab(RatingState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red[300],
            ),
            const SizedBox(height: 16),
            Text(
              state.error!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            AppButton(
              onPressed: () => ref.read(ratingProvider.notifier).loadRatings(
                entityId: widget.entityId,
                type: widget.ratingType,
              ),
              text: 'R�essayer',
              size: AppButtonSize.small,
            ),
          ],
        ),
      );
    }

    if (state.ratings.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.rate_review_outlined,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'Aucun avis pour le moment',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Soyez le premier � donner votre avis!',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
            const SizedBox(height: 24),
            AppButton(
              onPressed: _navigateToSubmitRating,
              text: 'Donner votre avis',
              size: AppButtonSize.small,
            ),
          ],
        ),
      );
    }

    final sortedRatings = _sortRatings(List.from(state.ratings));

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: sortedRatings.length,
      itemBuilder: (context, index) {
        return _buildRatingCard(sortedRatings[index]);
      },
    );
  }

  Widget _buildEntityHeader() {
    return Container(
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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Avis ${widget.ratingType.displayName.toLowerCase()}',
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
    );
  }

  Widget _buildRatingCard(Rating rating) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User info and rating
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(rating.userAvatar),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            rating.userName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          if (rating.isVerifiedPurchase) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'Achat v�rifi�',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          _buildStarRating(rating.score, size: 16),
                          const SizedBox(width: 8),
                          Text(
                            rating.formattedDate,
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Comment
            if (rating.hasComment) ...[
              const SizedBox(height: 12),
              Text(
                rating.comment!,
                style: const TextStyle(fontSize: 14),
              ),
            ],

            // Photos
            if (rating.hasPhotos) ...[
              const SizedBox(height: 12),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: rating.photos.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 80,
                      height: 80,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(rating.photos[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStarRating(double rating, {double size = 20}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final starValue = index + 1.0;
        return Icon(
          rating >= starValue 
              ? Icons.star 
              : rating >= starValue - 0.5 
                  ? Icons.star_half 
                  : Icons.star_border,
          color: Colors.amber,
          size: size,
        );
      }),
    );
  }

  List<Rating> _sortRatings(List<Rating> ratings) {
    switch (_sortBy) {
      case 'highest':
        ratings.sort((a, b) => b.score.compareTo(a.score));
        break;
      case 'lowest':
        ratings.sort((a, b) => a.score.compareTo(b.score));
        break;
      case 'recent':
      default:
        ratings.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
    }
    return ratings;
  }

  void _navigateToSubmitRating() {
    context.push(
      '/ratings/submit',
      extra: {
        'entityId': widget.entityId,
        'ratingType': widget.ratingType,
        'entityName': widget.entityName,
        'imageUrl': widget.imageUrl,
      },
    );
  }
}
