import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:crypto/crypto.dart';
import 'package:path_provider/path_provider.dart';
import 'package:logging/logging.dart';

/// Service for image optimization and processing
class ImageOptimizationService {
  static ImageOptimizationService? _instance;
  static ImageOptimizationService get instance => _instance ??= ImageOptimizationService._();
  
  ImageOptimizationService._();

  final Logger _logger = Logger('ImageOptimizationService');
  final Map<String, String> _optimizedImageCache = {};

  /// Optimize image by resizing and compressing
  Future<File?> optimizeImage(
    File imageFile, {
    int maxWidth = 800,
    int maxHeight = 600,
    int quality = 85,
  }) async {
    try {
      _logger.info('Optimizing image: ${imageFile.path}');
      
      // Read image bytes
      final imageBytes = await imageFile.readAsBytes();
      
      // Decode image
      final image = img.decodeImage(imageBytes);
      if (image == null) {
        _logger.warning('Failed to decode image');
        return null;
      }

      // Calculate new dimensions maintaining aspect ratio
      int newWidth = image.width;
      int newHeight = image.height;
      
      if (image.width > maxWidth || image.height > maxHeight) {
        final aspectRatio = image.width / image.height;
        
        if (aspectRatio > 1) {
          // Landscape
          newWidth = maxWidth;
          newHeight = (maxWidth / aspectRatio).round();
        } else {
          // Portrait
          newHeight = maxHeight;
          newWidth = (maxHeight * aspectRatio).round();
        }
      }

      // Resize image
      final resizedImage = img.copyResize(
        image,
        width: newWidth,
        height: newHeight,
        interpolation: img.Interpolation.linear,
      );

      // Compress image
      final compressedBytes = img.encodeJpg(resizedImage, quality: quality);

      // Save optimized image
      final directory = await getTemporaryDirectory();
      final fileName = _generateFileName(imageFile.path, maxWidth, maxHeight, quality);
      final optimizedFile = File('${directory.path}/optimized_images/$fileName');
      
      await optimizedFile.parent.create(recursive: true);
      await optimizedFile.writeAsBytes(compressedBytes);

      final originalSize = imageBytes.length / 1024; // KB
      final optimizedSize = compressedBytes.length / 1024; // KB
      final compressionRatio = ((originalSize - optimizedSize) / originalSize * 100);
      
      _logger.info(
        'Image optimized: ${originalSize.toStringAsFixed(1)}KB → ${optimizedSize.toStringAsFixed(1)}KB '
        '(${compressionRatio.toStringAsFixed(1)}% compression)',
      );

      return optimizedFile;
    } catch (e, stackTrace) {
      _logger.severe('Failed to optimize image', e, stackTrace);
      return null;
    }
  }

  /// Generate thumbnail from image
  Future<File?> generateThumbnail(
    File imageFile, {
    int size = 150,
    int quality = 70,
  }) async {
    try {
      _logger.info('Generating thumbnail for: ${imageFile.path}');
      
      final imageBytes = await imageFile.readAsBytes();
      final image = img.decodeImage(imageBytes);
      if (image == null) return null;

      // Create square thumbnail
      final thumbnail = img.copyResizeCropSquare(image, size: size);
      final thumbnailBytes = img.encodeJpg(thumbnail, quality: quality);

      // Save thumbnail
      final directory = await getTemporaryDirectory();
      final fileName = 'thumb_${_generateFileName(imageFile.path, size, size, quality)}';
      final thumbnailFile = File('${directory.path}/thumbnails/$fileName');
      
      await thumbnailFile.parent.create(recursive: true);
      await thumbnailFile.writeAsBytes(thumbnailBytes);

      return thumbnailFile;
    } catch (e, stackTrace) {
      _logger.severe('Failed to generate thumbnail', e, stackTrace);
      return null;
    }
  }

  /// Generate blur hash for progressive image loading
  Future<String?> generateBlurHash(File imageFile) async {
    try {
      _logger.info('Generating blur hash for: ${imageFile.path}');
      
      final imageBytes = await imageFile.readAsBytes();
      final image = img.decodeImage(imageBytes);
      if (image == null) return null;

      // Resize to very small dimensions for blur hash
      final smallImage = img.copyResize(image, width: 32, height: 32);
      
      // Convert to simple hash (simplified implementation)
      final hash = md5.convert(img.encodePng(smallImage)).toString();
      return hash.substring(0, 16); // Use first 16 chars as blur hash
    } catch (e, stackTrace) {
      _logger.severe('Failed to generate blur hash', e, stackTrace);
      return null;
    }
  }

  /// Compress image for upload
  Future<Uint8List?> compressForUpload(
    File imageFile, {
    int maxSize = 1024 * 1024, // 1MB
    int quality = 80,
  }) async {
    try {
      _logger.info('Compressing image for upload: ${imageFile.path}');
      
      final imageBytes = await imageFile.readAsBytes();
      
      // If already under max size, return as is
      if (imageBytes.length <= maxSize) {
        return imageBytes;
      }

      final image = img.decodeImage(imageBytes);
      if (image == null) return null;

      // Progressive compression
      int currentQuality = quality;
      Uint8List? compressedBytes;
      
      while (currentQuality > 10) {
        // Calculate size reduction factor
        final targetReduction = maxSize / imageBytes.length;
        final sizeFactor = targetReduction < 1 ? targetReduction : 1.0;
        
        // Resize if needed
        final newWidth = (image.width * sizeFactor).round();
        final newHeight = (image.height * sizeFactor).round();
        
        final resized = img.copyResize(image, width: newWidth, height: newHeight);
        compressedBytes = Uint8List.fromList(img.encodeJpg(resized, quality: currentQuality));
        
        if (compressedBytes.length <= maxSize) {
          break;
        }
        
        currentQuality -= 10;
      }

      _logger.info(
        'Image compressed: ${(imageBytes.length / 1024).toStringAsFixed(1)}KB → '
        '${(compressedBytes?.length ?? 0 / 1024).toStringAsFixed(1)}KB',
      );

      return compressedBytes;
    } catch (e, stackTrace) {
      _logger.severe('Failed to compress image for upload', e, stackTrace);
      return null;
    }
  }

  /// Get optimized image URL with parameters
  String getOptimizedImageUrl(
    String baseUrl, {
    int? width,
    int? height,
    int? quality,
    String format = 'webp',
  }) {
    final uri = Uri.parse(baseUrl);
    final queryParams = Map<String, String>.from(uri.queryParameters);
    
    if (width != null) queryParams['w'] = width.toString();
    if (height != null) queryParams['h'] = height.toString();
    if (quality != null) queryParams['q'] = quality.toString();
    queryParams['f'] = format;
    
    return uri.replace(queryParameters: queryParams).toString();
  }

  /// Get responsive image URL for different screen densities
  String getResponsiveImageUrl(
    String baseUrl,
    double pixelRatio, {
    int baseWidth = 400,
    int baseHeight = 300,
  }) {
    final targetWidth = (baseWidth * pixelRatio).round();
    final targetHeight = (baseHeight * pixelRatio).round();
    
    return getOptimizedImageUrl(
      baseUrl,
      width: targetWidth,
      height: targetHeight,
      quality: pixelRatio > 2 ? 80 : 85, // Lower quality for very high DPI
    );
  }

  /// Preload and cache critical images
  Future<void> preloadCriticalImages(List<String> imageUrls) async {
    _logger.info('Preloading ${imageUrls.length} critical images');
    
    final futures = imageUrls.map((url) async {
      try {
        // This would typically involve downloading and caching the image
        final cacheKey = _getCacheKey(url);
        _optimizedImageCache[cacheKey] = url;
      } catch (e) {
        _logger.warning('Failed to preload image: $url', e);
      }
    });
    
    await Future.wait(futures);
  }

  /// Clear image cache
  Future<void> clearImageCache() async {
    try {
      final directory = await getTemporaryDirectory();
      
      // Clear optimized images
      final optimizedDir = Directory('${directory.path}/optimized_images');
      if (await optimizedDir.exists()) {
        await optimizedDir.delete(recursive: true);
      }
      
      // Clear thumbnails
      final thumbDir = Directory('${directory.path}/thumbnails');
      if (await thumbDir.exists()) {
        await thumbDir.delete(recursive: true);
      }
      
      // Clear in-memory cache
      _optimizedImageCache.clear();
      
      _logger.info('Image cache cleared');
    } catch (e, stackTrace) {
      _logger.severe('Failed to clear image cache', e, stackTrace);
    }
  }

  /// Get cache size for images
  Future<double> getImageCacheSize() async {
    try {
      final directory = await getTemporaryDirectory();
      double totalSize = 0;
      
      // Calculate optimized images size
      final optimizedDir = Directory('${directory.path}/optimized_images');
      if (await optimizedDir.exists()) {
        await for (final entity in optimizedDir.list(recursive: true)) {
          if (entity is File) {
            totalSize += await entity.length();
          }
        }
      }
      
      // Calculate thumbnails size
      final thumbDir = Directory('${directory.path}/thumbnails');
      if (await thumbDir.exists()) {
        await for (final entity in thumbDir.list(recursive: true)) {
          if (entity is File) {
            totalSize += await entity.length();
          }
        }
      }
      
      return totalSize / (1024 * 1024); // Return size in MB
    } catch (e) {
      _logger.warning('Failed to calculate image cache size', e);
      return 0.0;
    }
  }

  /// Generate unique filename for optimized image
  String _generateFileName(String originalPath, int width, int height, int quality) {
    final originalName = originalPath.split('/').last.split('.').first;
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return '${originalName}_${width}x${height}_q${quality}_$timestamp.jpg';
  }

  /// Generate cache key for image URL
  String _getCacheKey(String url) {
    return md5.convert(url.codeUnits).toString();
  }

  /// Convert image to different format
  Future<File?> convertImageFormat(
    File imageFile,
    String targetFormat, {
    int quality = 85,
  }) async {
    try {
      final imageBytes = await imageFile.readAsBytes();
      final image = img.decodeImage(imageBytes);
      if (image == null) return null;

      Uint8List convertedBytes;
      String extension;
      
      switch (targetFormat.toLowerCase()) {
        case 'png':
          convertedBytes = Uint8List.fromList(img.encodePng(image));
          extension = 'png';
          break;
        case 'webp':
          // Use JPG for now until WebP support is fixed
          convertedBytes = Uint8List.fromList(img.encodeJpg(image, quality: quality));
          extension = 'jpg';
          break;
        case 'jpg':
        case 'jpeg':
        default:
          convertedBytes = Uint8List.fromList(img.encodeJpg(image, quality: quality));
          extension = 'jpg';
          break;
      }

      // Save converted image
      final directory = await getTemporaryDirectory();
      final originalName = imageFile.path.split('/').last.split('.').first;
      final convertedFile = File('${directory.path}/converted/${originalName}_converted.$extension');
      
      await convertedFile.parent.create(recursive: true);
      await convertedFile.writeAsBytes(convertedBytes);

      return convertedFile;
    } catch (e, stackTrace) {
      _logger.severe('Failed to convert image format', e, stackTrace);
      return null;
    }
  }
}

/// Image processing utilities
class ImageUtils {
  /// Calculate aspect ratio
  static double calculateAspectRatio(int width, int height) {
    return width / height;
  }

  /// Calculate dimensions maintaining aspect ratio
  static Map<String, int> calculateDimensions({
    required int originalWidth,
    required int originalHeight,
    int? maxWidth,
    int? maxHeight,
  }) {
    if (maxWidth == null && maxHeight == null) {
      return {'width': originalWidth, 'height': originalHeight};
    }

    final aspectRatio = calculateAspectRatio(originalWidth, originalHeight);
    
    int newWidth = originalWidth;
    int newHeight = originalHeight;

    if (maxWidth != null && maxHeight != null) {
      if (aspectRatio > 1) {
        // Landscape
        newWidth = maxWidth;
        newHeight = (maxWidth / aspectRatio).round();
        if (newHeight > maxHeight) {
          newHeight = maxHeight;
          newWidth = (maxHeight * aspectRatio).round();
        }
      } else {
        // Portrait or square
        newHeight = maxHeight;
        newWidth = (maxHeight * aspectRatio).round();
        if (newWidth > maxWidth) {
          newWidth = maxWidth;
          newHeight = (maxWidth / aspectRatio).round();
        }
      }
    } else if (maxWidth != null) {
      newWidth = maxWidth;
      newHeight = (maxWidth / aspectRatio).round();
    } else if (maxHeight != null) {
      newHeight = maxHeight;
      newWidth = (maxHeight * aspectRatio).round();
    }

    return {'width': newWidth, 'height': newHeight};
  }

  /// Get optimal quality based on file size
  static int getOptimalQuality(int fileSizeBytes) {
    if (fileSizeBytes < 500 * 1024) return 90; // < 500KB
    if (fileSizeBytes < 1024 * 1024) return 85; // < 1MB
    if (fileSizeBytes < 2 * 1024 * 1024) return 80; // < 2MB
    return 75; // >= 2MB
  }

  /// Check if image format is supported
  static bool isSupportedFormat(String fileName) {
    final extension = fileName.toLowerCase().split('.').last;
    return ['jpg', 'jpeg', 'png', 'webp', 'gif', 'bmp'].contains(extension);
  }
}