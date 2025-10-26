/// Social Sharing and Referral Service for EatFast
/// Comprehensive system for sharing content and managing referrals
library;

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:eatfast_mobile/shared/constants/api_constants.dart';
import 'package:eatfast_mobile/shared/services/api/api_client.dart';

enum SocialPlatform {
  whatsapp,
  facebook,
  twitter,
  instagram,
  linkedin,
  telegram,
  sms,
  email,
  generic,
}

enum ShareContentType {
  restaurant,
  menuItem,
  order,
  promotion,
  loyaltyAchievement,
  referralCode,
  appDownload,
}

class SocialSharingService {
  static final SocialSharingService _instance =
      SocialSharingService._internal();
  factory SocialSharingService() => _instance;

  final ApiClient _apiClient = ApiClient();
  // ignore: unused_field
  ScreenshotController? _screenshotController;

  SocialSharingService._internal();

  /// Initialize with screenshot controller for image sharing
  void initialize(ScreenshotController screenshotController) {
    _screenshotController = screenshotController;
  }

  /// Share restaurant with friends
  Future<ShareResult> shareRestaurant({
    required String restaurantId,
    required String restaurantName,
    required SocialPlatform platform,
    String? customMessage,
    bool includeReferralCode = true,
  }) async {
    try {
      // Get referral code if needed
      String? referralCode;
      if (includeReferralCode) {
        referralCode = await _getReferralCode();
      }

      // Create share content
      final shareData = ShareContent(
        type: ShareContentType.restaurant,
        title: 'Découvrez $restaurantName sur EatFast!',
        message:
            customMessage ??
            'Je viens de découvrir ce super restaurant sur EatFast: $restaurantName. '
                'Commandez maintenant et profitez de la livraison rapide!',
        url: _buildDeepLink('restaurant', restaurantId, referralCode),
        referralCode: referralCode,
        metadata: {
          'restaurantId': restaurantId,
          'restaurantName': restaurantName,
        },
      );

      return await _executeShare(shareData, platform);
    } catch (e) {
      if (kDebugMode) print('Error sharing restaurant: $e');
      rethrow;
    }
  }

  /// Share menu item
  Future<ShareResult> shareMenuItem({
    required String menuItemId,
    required String itemName,
    required String restaurantName,
    required SocialPlatform platform,
    String? customMessage,
    Uint8List? itemImage,
  }) async {
    try {
      final shareData = ShareContent(
        type: ShareContentType.menuItem,
        title: '$itemName de $restaurantName',
        message:
            customMessage ??
            'Regardez ce délicieux plat que j\'ai trouvé sur EatFast: $itemName de $restaurantName! 🍽️',
        url: _buildDeepLink('menu-item', menuItemId),
        imageData: itemImage,
        metadata: {
          'menuItemId': menuItemId,
          'itemName': itemName,
          'restaurantName': restaurantName,
        },
      );

      return await _executeShare(shareData, platform);
    } catch (e) {
      if (kDebugMode) print('Error sharing menu item: $e');
      rethrow;
    }
  }

  /// Share order completion
  Future<ShareResult> shareOrderCompletion({
    required String orderId,
    required String restaurantName,
    required SocialPlatform platform,
    Uint8List? orderScreenshot,
    String? customMessage,
  }) async {
    try {
      final shareData = ShareContent(
        type: ShareContentType.order,
        title: 'Commande livrée avec succès!',
        message:
            customMessage ??
            'Je viens de recevoir ma commande de $restaurantName via EatFast! '
                'Service rapide et efficace. Je recommande! 👍',
        url: _buildDeepLink('order', orderId),
        imageData: orderScreenshot,
        metadata: {'orderId': orderId, 'restaurantName': restaurantName},
      );

      return await _executeShare(shareData, platform);
    } catch (e) {
      if (kDebugMode) print('Error sharing order: $e');
      rethrow;
    }
  }

  /// Share promotion
  Future<ShareResult> sharePromotion({
    required String promotionId,
    required String promoTitle,
    required String promoCode,
    required SocialPlatform platform,
    String? customMessage,
    Uint8List? promoImage,
  }) async {
    try {
      final shareData = ShareContent(
        type: ShareContentType.promotion,
        title: 'Offre spéciale EatFast: $promoTitle',
        message:
            customMessage ??
            'Super offre sur EatFast! $promoTitle\n'
                'Code promo: $promoCode\n'
                'Profitez-en avant qu\'il ne soit trop tard! 🎉',
        url: _buildDeepLink('promotion', promotionId),
        imageData: promoImage,
        metadata: {
          'promotionId': promotionId,
          'promoTitle': promoTitle,
          'promoCode': promoCode,
        },
      );

      return await _executeShare(shareData, platform);
    } catch (e) {
      if (kDebugMode) print('Error sharing promotion: $e');
      rethrow;
    }
  }

  /// Share loyalty achievement
  Future<ShareResult> shareLoyaltyAchievement({
    required String achievementId,
    required String achievementTitle,
    required int pointsEarned,
    required SocialPlatform platform,
    Uint8List? achievementImage,
    String? customMessage,
  }) async {
    try {
      final shareData = ShareContent(
        type: ShareContentType.loyaltyAchievement,
        title: 'Nouveau succès débloqué sur EatFast!',
        message:
            customMessage ??
            'Je viens de débloquer "$achievementTitle" sur EatFast et j\'ai gagné $pointsEarned points! 🏆\n'
                'Rejoignez-moi et profitez du programme de fidélité!',
        url: _buildDeepLink('achievement', achievementId),
        imageData: achievementImage,
        metadata: {
          'achievementId': achievementId,
          'achievementTitle': achievementTitle,
          'pointsEarned': pointsEarned,
        },
      );

      return await _executeShare(shareData, platform);
    } catch (e) {
      if (kDebugMode) print('Error sharing achievement: $e');
      rethrow;
    }
  }

  /// Share referral code
  Future<ShareResult> shareReferralCode({
    required SocialPlatform platform,
    String? customMessage,
  }) async {
    try {
      final referralCode = await _getReferralCode();
      final referralData = await _getReferralData();

      final shareData = ShareContent(
        type: ShareContentType.referralCode,
        title: 'Rejoignez EatFast avec mon code de parrainage!',
        message:
            customMessage ??
            'Salut! Je t\'invite à essayer EatFast, la meilleure app de livraison de nourriture! 🍕\n\n'
                'Utilise mon code de parrainage: $referralCode\n'
                'Tu recevras ${referralData['bonusPoints']} points de fidélité gratuits!\n\n'
                'Télécharge l\'app maintenant:',
        url: _buildDeepLink('referral', referralCode),
        referralCode: referralCode,
        metadata: {
          'referralCode': referralCode,
          'bonusPoints': referralData['bonusPoints'],
          'bonusAmount': referralData['bonusAmount'],
        },
      );

      return await _executeShare(shareData, platform);
    } catch (e) {
      if (kDebugMode) print('Error sharing referral code: $e');
      rethrow;
    }
  }

  /// Share app download link
  Future<ShareResult> shareAppDownload({
    required SocialPlatform platform,
    String? customMessage,
  }) async {
    try {
      final shareData = ShareContent(
        type: ShareContentType.appDownload,
        title: 'Téléchargez EatFast - Livraison rapide!',
        message:
            customMessage ??
            'Découvrez EatFast, l\'app de livraison la plus rapide au Cameroun! 🚀🍔\n\n'
                '✓ Livraison en 30 minutes\n'
                '✓ Plus de 500 restaurants\n'
                '✓ Paiement mobile money\n'
                '✓ Programme de fidélité\n\n'
                'Téléchargez maintenant:',
        url: _buildAppDownloadUrl(),
        metadata: {'source': 'user_share', 'platform': platform.toString()},
      );

      return await _executeShare(shareData, platform);
    } catch (e) {
      if (kDebugMode) print('Error sharing app download: $e');
      rethrow;
    }
  }

  /// Execute the actual sharing based on platform
  Future<ShareResult> _executeShare(
    ShareContent content,
    SocialPlatform platform,
  ) async {
    try {
      // Track share event with backend
      final shareId = await _trackShareEvent(content, platform);

      switch (platform) {
        case SocialPlatform.whatsapp:
          await _shareToWhatsApp(content);
          break;
        case SocialPlatform.facebook:
          await _shareToFacebook(content);
          break;
        case SocialPlatform.twitter:
          await _shareToTwitter(content);
          break;
        case SocialPlatform.instagram:
          await _shareToInstagram(content);
          break;
        case SocialPlatform.linkedin:
          await _shareToLinkedIn(content);
          break;
        case SocialPlatform.telegram:
          await _shareToTelegram(content);
          break;
        case SocialPlatform.sms:
          await _shareViaSMS(content);
          break;
        case SocialPlatform.email:
          await _shareViaEmail(content);
          break;
        case SocialPlatform.generic:
          // default case removed as unreachable
          await _shareGeneric(content);
          break;
      }

      return ShareResult(
        shareId: shareId,
        platform: platform,
        contentType: content.type,
        success: true,
        timestamp: DateTime.now(),
      );
    } catch (e) {
      if (kDebugMode) print('Error executing share: $e');
      return ShareResult(
        shareId: '',
        platform: platform,
        contentType: content.type,
        success: false,
        error: e.toString(),
        timestamp: DateTime.now(),
      );
    }
  }

  /// Share to WhatsApp
  Future<void> _shareToWhatsApp(ShareContent content) async {
    final text = '${content.title}\n\n${content.message}\n\n${content.url}';

    if (content.imageData != null) {
      // Save image temporarily and share with it
      final tempFile = await _saveImageToTemp(
        content.imageData!,
        'whatsapp_share.png',
      );
      // ignore: deprecated_member_use
      // ignore: deprecated_member_use
      await Share.shareXFiles(
        [XFile(tempFile.path)],
        text: text,
        subject: content.title,
      );
    } else {
      // Text only
      final whatsappUrl = 'whatsapp://send?text=${Uri.encodeComponent(text)}';
      if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
        await launchUrl(Uri.parse(whatsappUrl));
      } else {
        await _shareGeneric(content);
      }
    }
  }

  /// Share to Facebook
  Future<void> _shareToFacebook(ShareContent content) async {
    // Facebook doesn't allow pre-filled text, so we use generic share
    await _shareGeneric(content);
  }

  /// Share to Twitter
  Future<void> _shareToTwitter(ShareContent content) async {
    final text = '${content.message}\n\n${content.url}';
    final twitterUrl =
        'https://twitter.com/intent/tweet?text=${Uri.encodeComponent(text)}';

    if (await canLaunchUrl(Uri.parse(twitterUrl))) {
      await launchUrl(Uri.parse(twitterUrl));
    } else {
      await _shareGeneric(content);
    }
  }

  /// Share to Instagram (stories)
  Future<void> _shareToInstagram(ShareContent content) async {
    if (content.imageData != null) {
      final tempFile = await _saveImageToTemp(
        content.imageData!,
        'instagram_share.png',
      );
      // ignore: deprecated_member_use
      await Share.shareXFiles([XFile(tempFile.path)]);
    } else {
      await _shareGeneric(content);
    }
  }

  /// Share to LinkedIn
  Future<void> _shareToLinkedIn(ShareContent content) async {
    final linkedinUrl =
        'https://www.linkedin.com/sharing/share-offsite/?url=${Uri.encodeComponent(content.url)}';

    if (await canLaunchUrl(Uri.parse(linkedinUrl))) {
      await launchUrl(Uri.parse(linkedinUrl));
    } else {
      await _shareGeneric(content);
    }
  }

  /// Share to Telegram
  Future<void> _shareToTelegram(ShareContent content) async {
    final text = '${content.title}\n\n${content.message}\n\n${content.url}';
    final telegramUrl =
        'https://t.me/share/url?url=${Uri.encodeComponent(content.url)}&text=${Uri.encodeComponent(text)}';

    if (await canLaunchUrl(Uri.parse(telegramUrl))) {
      await launchUrl(Uri.parse(telegramUrl));
    } else {
      await _shareGeneric(content);
    }
  }

  /// Share via SMS
  Future<void> _shareViaSMS(ShareContent content) async {
    final text = '${content.title}\n\n${content.message}\n\n${content.url}';
    final smsUrl = 'sms:?body=${Uri.encodeComponent(text)}';

    if (await canLaunchUrl(Uri.parse(smsUrl))) {
      await launchUrl(Uri.parse(smsUrl));
    } else {
      await _shareGeneric(content);
    }
  }

  /// Share via Email
  Future<void> _shareViaEmail(ShareContent content) async {
    final emailUrl =
        'mailto:?subject=${Uri.encodeComponent(content.title)}&body=${Uri.encodeComponent('${content.message}\n\n${content.url}')}';

    if (await canLaunchUrl(Uri.parse(emailUrl))) {
      await launchUrl(Uri.parse(emailUrl));
    } else {
      await _shareGeneric(content);
    }
  }

  /// Generic share using system share sheet
  Future<void> _shareGeneric(ShareContent content) async {
    final text = '${content.title}\n\n${content.message}\n\n${content.url}';

    if (content.imageData != null) {
      final tempFile = await _saveImageToTemp(
        content.imageData!,
        'share_image.png',
      );
      // ignore: deprecated_member_use
      await Share.shareXFiles(
        [XFile(tempFile.path)],
        text: text,
        subject: content.title,
      );
    } else {
      // ignore: deprecated_member_use
      await Share.share(text, subject: content.title);
    }
  }

  /// Save image data to temporary file
  Future<File> _saveImageToTemp(Uint8List imageData, String fileName) async {
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/$fileName');
    await file.writeAsBytes(imageData);
    return file;
  }

  /// Build deep link URL
  String _buildDeepLink(String type, String id, [String? referralCode]) {
    final baseUrl = 'https://eatfast.app';
    final params = <String, String>{
      'type': type,
      'id': id,
      if (referralCode != null) 'ref': referralCode,
    };

    final queryString = params.entries
        .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
        .join('&');

    return '$baseUrl/share?$queryString';
  }

  /// Build app download URL
  String _buildAppDownloadUrl() {
    return 'https://eatfast.app/download';
  }

  /// Get user's referral code
  Future<String> _getReferralCode() async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.socialReferralCreate}/my-code',
      );
      return response.data['referralCode'] ?? '';
    } catch (e) {
      if (kDebugMode) print('Error getting referral code: $e');
      return '';
    }
  }

  /// Get referral program data
  Future<Map<String, dynamic>> _getReferralData() async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.socialReferralCreate}/program-info',
      );
      return response.data ?? {};
    } catch (e) {
      if (kDebugMode) print('Error getting referral data: $e');
      return {'bonusPoints': 100, 'bonusAmount': 500};
    }
  }

  /// Track share event with backend
  Future<String> _trackShareEvent(
    ShareContent content,
    SocialPlatform platform,
  ) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.socialShareCreate,
        data: {
          'contentType': content.type.toString().split('.').last,
          'platform': platform.toString().split('.').last,
          'title': content.title,
          'url': content.url,
          'metadata': content.metadata,
        },
      );
      return response.data['shareId'] ?? '';
    } catch (e) {
      if (kDebugMode) print('Error tracking share event: $e');
      return DateTime.now().millisecondsSinceEpoch.toString();
    }
  }

  /// Get available social platforms
  List<SocialPlatform> getAvailablePlatforms() {
    return [
      SocialPlatform.whatsapp,
      SocialPlatform.facebook,
      SocialPlatform.twitter,
      SocialPlatform.instagram,
      SocialPlatform.telegram,
      SocialPlatform.sms,
      SocialPlatform.email,
      SocialPlatform.generic,
    ];
  }

  /// Get platform display info
  PlatformInfo getPlatformInfo(SocialPlatform platform) {
    switch (platform) {
      case SocialPlatform.whatsapp:
        return PlatformInfo('WhatsApp', 'whatsapp.png', '#25D366');
      case SocialPlatform.facebook:
        return PlatformInfo('Facebook', 'facebook.png', '#1877F2');
      case SocialPlatform.twitter:
        return PlatformInfo('Twitter', 'twitter.png', '#1DA1F2');
      case SocialPlatform.instagram:
        return PlatformInfo('Instagram', 'instagram.png', '#E4405F');
      case SocialPlatform.linkedin:
        return PlatformInfo('LinkedIn', 'linkedin.png', '#0A66C2');
      case SocialPlatform.telegram:
        return PlatformInfo('Telegram', 'telegram.png', '#0088CC');
      case SocialPlatform.sms:
        return PlatformInfo('SMS', 'sms.png', '#34C759');
      case SocialPlatform.email:
        return PlatformInfo('Email', 'email.png', '#007AFF');
      case SocialPlatform.generic:
        return PlatformInfo('Plus', 'more.png', '#666666');
    }
  }
}

/// Share content model
class ShareContent {
  final ShareContentType type;
  final String title;
  final String message;
  final String url;
  final Uint8List? imageData;
  final String? referralCode;
  final Map<String, dynamic>? metadata;

  ShareContent({
    required this.type,
    required this.title,
    required this.message,
    required this.url,
    this.imageData,
    this.referralCode,
    this.metadata,
  });
}

/// Share result model
class ShareResult {
  final String shareId;
  final SocialPlatform platform;
  final ShareContentType contentType;
  final bool success;
  final String? error;
  final DateTime timestamp;

  ShareResult({
    required this.shareId,
    required this.platform,
    required this.contentType,
    required this.success,
    this.error,
    required this.timestamp,
  });
}

/// Platform info model
class PlatformInfo {
  final String name;
  final String icon;
  final String color;

  PlatformInfo(this.name, this.icon, this.color);
}
