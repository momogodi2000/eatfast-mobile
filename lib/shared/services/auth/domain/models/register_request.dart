/// Register request model matching backend API schema
class RegisterRequest {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phone;
  final String role;
  final String city;
  final Map<String, dynamic>? deviceInfo;
  final bool acceptTerms;
  final bool acceptPrivacy;

  const RegisterRequest({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phone,
    this.role = 'customer',
    required this.city,
    this.deviceInfo,
    this.acceptTerms = true,
    this.acceptPrivacy = true,
  });

  /// Convert to JSON for API (matching backend validation schema)
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'role': role,
      'city': city,
      'acceptTerms': acceptTerms,
      'acceptPrivacy': acceptPrivacy,
      if (deviceInfo != null) 'deviceInfo': deviceInfo,
    };
  }

  /// Create from JSON
  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phone: json['phone'] as String,
      role: json['role'] as String? ?? 'customer',
      city: json['city'] as String,
      deviceInfo: json['deviceInfo'] as Map<String, dynamic>?,
      acceptTerms: json['acceptTerms'] as bool? ?? true,
      acceptPrivacy: json['acceptPrivacy'] as bool? ?? true,
    );
  }

  /// Get full name
  String get fullName => '$firstName $lastName';

  /// Validate phone number format (Cameroon format +237XXXXXXXX)
  bool get isValidPhone {
    final phoneRegex = RegExp(r'^\+237[67]\d{8}$');
    return phoneRegex.hasMatch(phone);
  }

  /// Validate password strength
  bool get isValidPassword {
    return password.length >= 8;
  }

  /// Validate email format
  bool get isValidEmail {
    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    return emailRegex.hasMatch(email);
  }

  /// Check if all required fields are valid
  bool get isValid {
    return isValidEmail && 
           isValidPassword && 
           isValidPhone &&
           firstName.isNotEmpty &&
           lastName.isNotEmpty &&
           city.isNotEmpty &&
           acceptTerms &&
           acceptPrivacy;
  }

  /// Get validation errors
  List<String> get validationErrors {
    final errors = <String>[];
    
    if (!isValidEmail) {
      errors.add('Email invalide');
    }
    if (!isValidPassword) {
      errors.add('Le mot de passe doit contenir au moins 8 caractères');
    }
    if (!isValidPhone) {
      errors.add('Numéro de téléphone invalide (format: +237XXXXXXXX)');
    }
    if (firstName.isEmpty) {
      errors.add('Le prénom est requis');
    }
    if (lastName.isEmpty) {
      errors.add('Le nom est requis');
    }
    if (city.isEmpty) {
      errors.add('La ville est requise');
    }
    if (!acceptTerms) {
      errors.add('Vous devez accepter les conditions d\'utilisation');
    }
    if (!acceptPrivacy) {
      errors.add('Vous devez accepter la politique de confidentialité');
    }
    
    return errors;
  }

  /// Create copy with new values
  RegisterRequest copyWith({
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    String? phone,
    String? role,
    String? city,
    Map<String, dynamic>? deviceInfo,
    bool? acceptTerms,
    bool? acceptPrivacy,
  }) {
    return RegisterRequest(
      email: email ?? this.email,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      city: city ?? this.city,
      deviceInfo: deviceInfo ?? this.deviceInfo,
      acceptTerms: acceptTerms ?? this.acceptTerms,
      acceptPrivacy: acceptPrivacy ?? this.acceptPrivacy,
    );
  }

  @override
  String toString() {
    return 'RegisterRequest(email: $email, fullName: $fullName, phone: $phone, city: $city, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RegisterRequest &&
        other.email == email &&
        other.password == password &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.phone == phone &&
        other.role == role &&
        other.city == city;
  }

  @override
  int get hashCode {
    return Object.hash(
      email,
      password,
      firstName,
      lastName,
      phone,
      role,
      city,
    );
  }
}

/// Available cities in Cameroon (matching backend validation)
class CameroonCities {
  static const String yaounde = 'Yaoundé';
  static const String douala = 'Douala';
  static const String bafoussam = 'Bafoussam';
  static const String bamenda = 'Bamenda';
  static const String garoua = 'Garoua';
  static const String maroua = 'Maroua';
  
  static const List<String> all = [
    yaounde,
    douala,
    bafoussam,
    bamenda,
    garoua,
    maroua,
  ];
}

/// Available user roles (matching backend validation)
class UserRoles {
  static const String customer = 'customer';
  static const String restaurantOwner = 'restaurant_owner';
  static const String deliveryAgent = 'delivery_agent';
  static const String admin = 'admin';
  
  static const List<String> all = [
    customer,
    restaurantOwner,
    deliveryAgent,
  ];
  
  static const List<String> publicRoles = [
    customer,
    restaurantOwner,
    deliveryAgent,
  ];
}
