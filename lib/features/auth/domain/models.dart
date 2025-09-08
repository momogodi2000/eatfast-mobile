/// User model class matching backend User model structure
class User {
  final String id;
  final String email;
  final String? phone;
  final String? firstName;
  final String? lastName;
  final String? phoneCm; // Changed from phone_cm
  // first_name and last_name are duplicates, removed
  final UserRole role;
  final UserStatus status;
  final String? avatar;
  final Map<String, dynamic>? location;
  final Map<String, dynamic>? preferences;
  final bool emailVerified;
  final bool phoneVerified;
  final DateTime? lastLoginAt;
  final String? city;
  final String language;
  
  // Loyalty fields
  final int loyaltyPoints;
  final String loyaltyTier;
  final int totalOrders;
  final double totalSpent;
  final String? referralCode;
  final String? referredBy;
  
  // Push notification token
  final String? pushToken;
  final Map<String, dynamic>? pushSubscription;
  
  // 2FA fields
  final bool twoFactorEnabled;
  final String? twoFactorMethod;
  
  // OAuth fields
  final String? googleId;
  final String? appleId;
  
  final DateTime createdAt;
  final DateTime? updatedAt;

  const User({
    required this.id,
    required this.email,
    this.phone,
    this.firstName,
    this.lastName,
    this.phoneCm,
    this.role = UserRole.customer,
    this.status = UserStatus.pending,
    this.avatar,
    this.location,
    this.preferences,
    this.emailVerified = false,
    this.phoneVerified = false,
    this.lastLoginAt,
    this.city,
    this.language = 'fr',
    this.loyaltyPoints = 0,
    this.loyaltyTier = 'bronze',
    this.totalOrders = 0,
    this.totalSpent = 0.0,
    this.referralCode,
    this.referredBy,
    this.pushToken,
    this.pushSubscription,
    this.twoFactorEnabled = false,
    this.twoFactorMethod,
    this.googleId,
    this.appleId,
    required this.createdAt,
    this.updatedAt,
  });

  /// Get display name (firstName + lastName or fallback)
  String get displayName {
    if (firstName != null && lastName != null) {
      return '$firstName $lastName';
    }
    return email.split('@').first;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      firstName: json['firstName'] as String? ?? json['first_name'] as String?,
      lastName: json['lastName'] as String? ?? json['last_name'] as String?,
      phoneCm: json['phone_cm'] as String?,
      role: UserRole.values.firstWhere(
        (e) => e.name == json['role'],
        orElse: () => UserRole.customer,
      ),
      status: UserStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => UserStatus.pending,
      ),
      avatar: json['avatar'] as String?,
      location: json['location'] as Map<String, dynamic>?,
      preferences: json['preferences'] as Map<String, dynamic>?,
      emailVerified: json['emailVerified'] as bool? ?? false,
      phoneVerified: json['phoneVerified'] as bool? ?? false,
      lastLoginAt: json['lastLoginAt'] != null 
          ? DateTime.parse(json['lastLoginAt'] as String)
          : null,
      city: json['city'] as String?,
      language: json['language'] as String? ?? 'fr',
      loyaltyPoints: json['loyalty_points'] as int? ?? 0,
      loyaltyTier: json['loyalty_tier'] as String? ?? 'bronze',
      totalOrders: json['total_orders'] as int? ?? 0,
      totalSpent: (json['total_spent'] as num?)?.toDouble() ?? 0.0,
      referralCode: json['referral_code'] as String?,
      referredBy: json['referred_by'] as String?,
      pushToken: json['pushToken'] as String?,
      pushSubscription: json['pushSubscription'] as Map<String, dynamic>?,
      twoFactorEnabled: json['twoFactorEnabled'] as bool? ?? false,
      twoFactorMethod: json['twoFactorMethod'] as String?,
      googleId: json['googleId'] as String?,
      appleId: json['appleId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] != null 
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'firstName': firstName,
      'lastName': lastName,
      'phone_cm': phoneCm,
      'first_name': firstName,
      'last_name': lastName,
      'role': role.name,
      'status': status.name,
      'avatar': avatar,
      'location': location,
      'preferences': preferences,
      'emailVerified': emailVerified,
      'phoneVerified': phoneVerified,
      'lastLoginAt': lastLoginAt?.toIso8601String(),
      'city': city,
      'language': language,
      'loyalty_points': loyaltyPoints,
      'loyalty_tier': loyaltyTier,
      'total_orders': totalOrders,
      'total_spent': totalSpent,
      'referral_code': referralCode,
      'referred_by': referredBy,
      'pushToken': pushToken,
      'pushSubscription': pushSubscription,
      'twoFactorEnabled': twoFactorEnabled,
      'twoFactorMethod': twoFactorMethod,
      'googleId': googleId,
      'appleId': appleId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  User copyWith({
    String? id,
    String? email,
    String? phone,
    String? firstName,
    String? lastName,
    String? phoneCm,
    UserRole? role,
    UserStatus? status,
    String? avatar,
    Map<String, dynamic>? location,
    Map<String, dynamic>? preferences,
    bool? emailVerified,
    bool? phoneVerified,
    DateTime? lastLoginAt,
    String? city,
    String? language,
    int? loyaltyPoints,
    String? loyaltyTier,
    int? totalOrders,
    double? totalSpent,
    String? referralCode,
    String? referredBy,
    String? pushToken,
    Map<String, dynamic>? pushSubscription,
    bool? twoFactorEnabled,
    String? twoFactorMethod,
    String? googleId,
    String? appleId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneCm: phoneCm ?? this.phoneCm,
      role: role ?? this.role,
      status: status ?? this.status,
      avatar: avatar ?? this.avatar,
      location: location ?? this.location,
      preferences: preferences ?? this.preferences,
      emailVerified: emailVerified ?? this.emailVerified,
      phoneVerified: phoneVerified ?? this.phoneVerified,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      city: city ?? this.city,
      language: language ?? this.language,
      loyaltyPoints: loyaltyPoints ?? this.loyaltyPoints,
      loyaltyTier: loyaltyTier ?? this.loyaltyTier,
      totalOrders: totalOrders ?? this.totalOrders,
      totalSpent: totalSpent ?? this.totalSpent,
      referralCode: referralCode ?? this.referralCode,
      referredBy: referredBy ?? this.referredBy,
      pushToken: pushToken ?? this.pushToken,
      pushSubscription: pushSubscription ?? this.pushSubscription,
      twoFactorEnabled: twoFactorEnabled ?? this.twoFactorEnabled,
      twoFactorMethod: twoFactorMethod ?? this.twoFactorMethod,
      googleId: googleId ?? this.googleId,
      appleId: appleId ?? this.appleId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, email: $email, displayName: $displayName, role: ${role.name})';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User &&
        other.id == id &&
        other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^ email.hashCode;
  }
}

/// User roles matching backend enum
enum UserRole {
  customer,
  restaurantOwner,
  deliveryAgent,
  admin;

  String get displayName {
    switch (this) {
      case UserRole.customer:
        return 'Client';
      case UserRole.restaurantOwner:
        return 'Propriétaire de Restaurant';
      case UserRole.deliveryAgent:
        return 'Livreur';
      case UserRole.admin:
        return 'Administrateur';
    }
  }
}

/// User status matching backend enum
enum UserStatus {
  active,
  suspended,
  pending,
  inactive;

  String get displayName {
    switch (this) {
      case UserStatus.active:
        return 'Actif';
      case UserStatus.suspended:
        return 'Suspendu';
      case UserStatus.pending:
        return 'En Attente';
      case UserStatus.inactive:
        return 'Inactif';
    }
  }
}

/// Cities enum matching backend
enum CameroonCity {
  yaounde('Yaoundé'),
  douala('Douala'),
  bafoussam('Bafoussam'),
  bamenda('Bamenda'),
  autre('Autre');

  const CameroonCity(this.displayName);
  final String displayName;
}

/// Address model class
class Address {
  final String id;
  final String name;
  final String address;
  final String? landmark;
  final double? latitude;
  final double? longitude;
  final bool isDefault;
  final AddressType type;

  const Address({
    required this.id,
    required this.name,
    required this.address,
    this.landmark,
    this.latitude,
    this.longitude,
    this.isDefault = false,
    this.type = AddressType.other,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      landmark: json['landmark'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      isDefault: json['isDefault'] as bool? ?? false,
      type: AddressType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => AddressType.other,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'landmark': landmark,
      'latitude': latitude,
      'longitude': longitude,
      'isDefault': isDefault,
      'type': type.name,
    };
  }

  Address copyWith({
    String? id,
    String? name,
    String? address,
    String? landmark,
    double? latitude,
    double? longitude,
    bool? isDefault,
    AddressType? type,
  }) {
    return Address(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      landmark: landmark ?? this.landmark,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isDefault: isDefault ?? this.isDefault,
      type: type ?? this.type,
    );
  }
}

/// Address types
enum AddressType {
  home,
  work,
  other;

  String get displayName {
    switch (this) {
      case AddressType.home:
        return 'Domicile';
      case AddressType.work:
        return 'Bureau';
      case AddressType.other:
        return 'Autre';
    }
  }
}

/// Authentication response model matching backend format
class AuthResponse {
  final bool success;
  final String? message;
  final AuthData? data;
  final String? error;

  const AuthResponse({
    required this.success,
    this.message,
    this.data,
    this.error,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      success: json['success'] as bool,
      message: json['message'] as String?,
      data: json['data'] != null ? AuthData.fromJson(json['data'] as Map<String, dynamic>) : null,
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data?.toJson(),
      'error': error,
    };
  }
}

/// Auth data containing user and tokens
class AuthData {
  final User user;
  final String token;
  final String? refreshToken;
  final bool? requiresTwoFactor;
  final String? userId;
  final String? method;

  const AuthData({
    required this.user,
    required this.token,
    this.refreshToken,
    this.requiresTwoFactor,
    this.userId,
    this.method,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String?,
      requiresTwoFactor: json['requiresTwoFactor'] as bool?,
      userId: json['userId'] as String?,
      method: json['method'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'token': token,
      'refreshToken': refreshToken,
      'requiresTwoFactor': requiresTwoFactor,
      'userId': userId,
      'method': method,
    };
  }
}

/// Login request model
class LoginRequest {
  final String email;
  final String password;

  const LoginRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

/// Register request model
class RegisterRequest {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phone;
  final String role;
  final String city;

  const RegisterRequest({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phone,
    this.role = 'customer',
    required this.city,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'role': role,
      'city': city,
    };
  }
}

/// Password reset request model
class PasswordResetRequest {
  final String email;

  const PasswordResetRequest({required this.email});

  Map<String, dynamic> toJson() {
    return {'email': email};
  }
}

/// Verify reset code request model
class VerifyResetCodeRequest {
  final String email;
  final String code;

  const VerifyResetCodeRequest({
    required this.email,
    required this.code,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'code': code,
    };
  }
}

/// Reset password request model
class ResetPasswordRequest {
  final String resetToken;
  final String newPassword;

  const ResetPasswordRequest({
    required this.resetToken,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'resetToken': resetToken,
      'newPassword': newPassword,
    };
  }
}
