import 'dart:math' as math;

/// Form validation utilities
class Validators {
  Validators._();

  /// Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'L\'email est requis';
    }
    
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    
    if (!emailRegex.hasMatch(value)) {
      return 'Veuillez entrer un email valide';
    }
    
    return null;
  }

  /// Password validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le mot de passe est requis';
    }
    
    if (value.length < 6) {
      return 'Le mot de passe doit contenir au moins 6 caractères';
    }
    
    return null;
  }

  /// Name validation
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le nom est requis';
    }
    
    if (value.length < 2) {
      return 'Le nom doit contenir au moins 2 caractères';
    }
    
    if (value.length > 50) {
      return 'Le nom ne peut pas dépasser 50 caractères';
    }
    
    return null;
  }

  /// Phone number validation (Cameroon format)
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le numéro de téléphone est requis';
    }
    
    // Remove spaces and special characters
    final cleanPhone = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');
    
    // Cameroon phone number patterns
    final phoneRegex = RegExp(r'^(\+237|237)?[267][0-9]{8}$');
    
    if (!phoneRegex.hasMatch(cleanPhone)) {
      return 'Veuillez entrer un numéro de téléphone valide';
    }
    
    return null;
  }

  /// Confirm password validation
  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'La confirmation du mot de passe est requise';
    }
    
    if (value != password) {
      return 'Les mots de passe ne correspondent pas';
    }
    
    return null;
  }

  /// Required field validation
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName est requis';
    }
    
    return null;
  }

  /// Minimum length validation
  static String? validateMinLength(String? value, int minLength, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName est requis';
    }
    
    if (value.length < minLength) {
      return '$fieldName doit contenir au moins $minLength caractères';
    }
    
    return null;
  }

  /// Maximum length validation
  static String? validateMaxLength(String? value, int maxLength, String fieldName) {
    if (value != null && value.length > maxLength) {
      return '$fieldName ne peut pas dépasser $maxLength caractères';
    }
    
    return null;
  }

  /// Numeric validation
  static String? validateNumeric(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName est requis';
    }
    
    if (double.tryParse(value) == null) {
      return '$fieldName doit être un nombre valide';
    }
    
    return null;
  }

  /// URL validation
  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return null; // URL is optional
    }
    
    final urlRegex = RegExp(
      r'^https?:\/\/[^\s/$.?#].[^\s]*$',
      caseSensitive: false,
    );
    
    if (!urlRegex.hasMatch(value)) {
      return 'Veuillez entrer une URL valide';
    }
    
    return null;
  }
}

/// Utility functions for common operations
class Utils {
  Utils._();

  /// Format currency (FCFA)
  static String formatCurrency(double amount) {
    return '${amount.toStringAsFixed(0)} FCFA';
  }

  /// Format phone number for display
  static String formatPhoneNumber(String phone) {
    // Remove all non-digit characters
    final digits = phone.replaceAll(RegExp(r'[^\d]'), '');
    
    // Add Cameroon country code if not present
    String formattedPhone = digits;
    if (!digits.startsWith('237') && digits.length == 9) {
      formattedPhone = '237$digits';
    }
    
    // Format as +237 6XX XXX XXX
    if (formattedPhone.length == 12 && formattedPhone.startsWith('237')) {
      return '+237 ${formattedPhone.substring(3, 4)}${formattedPhone.substring(4, 6)} ${formattedPhone.substring(6, 9)} ${formattedPhone.substring(9)}';
    }
    
    return phone; // Return original if formatting fails
  }

  /// Capitalize first letter of each word
  static String capitalizeWords(String text) {
    return text.split(' ')
        .map((word) => word.isNotEmpty 
            ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
            : word)
        .join(' ');
  }

  /// Get initials from name
  static String getInitials(String name) {
    final words = name.trim().split(' ');
    if (words.isEmpty) return '';
    
    if (words.length == 1) {
      return words[0].substring(0, 1).toUpperCase();
    }
    
    return '${words[0].substring(0, 1).toUpperCase()}${words[1].substring(0, 1).toUpperCase()}';
  }

  /// Calculate distance between two points (approximation)
  static double calculateDistance(
    double lat1, double lon1,
    double lat2, double lon2,
  ) {
    // Simple distance calculation (not accurate for long distances)
    const double earthRadius = 6371; // km
    
    final dLat = _degreesToRadians(lat2 - lat1);
    final dLon = _degreesToRadians(lon2 - lon1);
    
    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_degreesToRadians(lat1)) *
            math.cos(_degreesToRadians(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    
    return earthRadius * c;
  }

  static double _degreesToRadians(double degrees) {
    return degrees * (math.pi / 180);
  }

  /// Format duration (minutes to readable format)
  static String formatDuration(int minutes) {
    if (minutes < 60) {
      return '${minutes}min';
    }
    
    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;
    
    if (remainingMinutes == 0) {
      return '${hours}h';
    }
    
    return '${hours}h ${remainingMinutes}min';
  }

  /// Generate a simple ID
  static String generateId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}
