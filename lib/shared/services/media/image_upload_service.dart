/// Image Upload Service for EatFast
/// Handles image selection, compression, and upload to Express.js backend
library;

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:eatfast_mobile/shared/services/api/api_client.dart';
import 'package:eatfast_mobile/shared/constants/api_constants.dart';

class ImageUploadService {
  static final ImageUploadService _instance = ImageUploadService._internal();
  factory ImageUploadService() => _instance;

  final ApiClient _apiClient = ApiClient();
  final ImagePicker _picker = ImagePicker();

  ImageUploadService._internal();

  /// Pick image from gallery
  Future<File?> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        return File(image.path);
      }
      return null;
    } catch (e) {
      if (kDebugMode) print('Error picking image from gallery: $e');
      return null;
    }
  }

  /// Pick image from camera
  Future<File?> pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        return File(image.path);
      }
      return null;
    } catch (e) {
      if (kDebugMode) print('Error picking image from camera: $e');
      return null;
    }
  }

  /// Show image source selector (Camera or Gallery)
  Future<File?> pickImage({ImageSource? preferredSource}) async {
    if (preferredSource != null) {
      return preferredSource == ImageSource.camera
          ? pickImageFromCamera()
          : pickImageFromGallery();
    }

    // Default to gallery
    return pickImageFromGallery();
  }

  /// Compress image file
  Future<File?> compressImage(File imageFile, {int quality = 85}) async {
    try {
      // Read image
      final bytes = await imageFile.readAsBytes();
      final image = img.decodeImage(bytes);

      if (image == null) return null;

      // Resize if image is too large
      img.Image resized = image;
      if (image.width > 1920 || image.height > 1080) {
        resized = img.copyResize(
          image,
          width: image.width > image.height ? 1920 : null,
          height: image.height > image.width ? 1080 : null,
        );
      }

      // Compress
      final compressedBytes = img.encodeJpg(resized, quality: quality);

      // Save to temporary file
      final tempDir = await getTemporaryDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final compressedFile = File('${tempDir.path}/compressed_$timestamp.jpg');
      await compressedFile.writeAsBytes(compressedBytes);

      return compressedFile;
    } catch (e) {
      if (kDebugMode) print('Error compressing image: $e');
      return imageFile; // Return original if compression fails
    }
  }

  /// Upload image to backend
  Future<ImageUploadResponse> uploadImage(
    File imageFile, {
    String? category,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      // Compress image first
      final compressedImage = await compressImage(imageFile);
      if (compressedImage == null) {
        throw Exception('Image compression failed');
      }

      // Prepare multipart form data
      final fileName = compressedImage.path.split('/').last;
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          compressedImage.path,
          filename: fileName,
        ),
        if (category != null) 'category': category,
        if (metadata != null) 'metadata': metadata,
      });

      // Upload to backend
      final response = await _apiClient.post(
        ApiConstants.uploadFile,
        data: formData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ImageUploadResponse.fromJson(response.data);
      } else {
        throw Exception('Upload failed: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Upload error: $e');
    }
  }

  /// Upload profile picture
  Future<String> uploadProfilePicture(File imageFile) async {
    final response = await uploadImage(
      imageFile,
      category: 'profile',
      metadata: {'type': 'avatar'},
    );
    return response.url;
  }

  /// Upload multiple images
  Future<List<ImageUploadResponse>> uploadMultipleImages(
    List<File> imageFiles, {
    String? category,
    void Function(int current, int total)? onProgress,
  }) async {
    final results = <ImageUploadResponse>[];

    for (int i = 0; i < imageFiles.length; i++) {
      try {
        final response = await uploadImage(imageFiles[i], category: category);
        results.add(response);
        onProgress?.call(i + 1, imageFiles.length);
      } catch (e) {
        if (kDebugMode) print('Error uploading image ${i + 1}: $e');
      }
    }

    return results;
  }

  /// Delete uploaded image
  Future<bool> deleteImage(String imageUrl) async {
    try {
      final response = await _apiClient.delete(
        '/shared/upload/delete',
        data: {'url': imageUrl},
      );
      return response.statusCode == 200;
    } catch (e) {
      if (kDebugMode) print('Error deleting image: $e');
      return false;
    }
  }
}

/// Image Upload Response Model
class ImageUploadResponse {
  final String url;
  final String filename;
  final int size;
  final String mimeType;

  const ImageUploadResponse({
    required this.url,
    required this.filename,
    required this.size,
    required this.mimeType,
  });

  factory ImageUploadResponse.fromJson(Map<String, dynamic> json) {
    return ImageUploadResponse(
      url: json['url'] ?? json['imageUrl'] ?? '',
      filename: json['filename'] ?? json['fileName'] ?? '',
      size: json['size'] ?? 0,
      mimeType: json['mimeType'] ?? json['contentType'] ?? 'image/jpeg',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'filename': filename,
      'size': size,
      'mimeType': mimeType,
    };
  }
}
