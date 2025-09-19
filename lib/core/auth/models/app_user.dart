/// User roles in the application (matching backend exactly)
enum UserRole {
  customer('customer'),
  restaurantOwner('restaurant_owner'),
  deliveryAgent('delivery_agent'),
  admin('admin'),
  guest('guest');

  const UserRole(this.value);
  final String value;

  static UserRole fromString(String value) {
    return UserRole.values.firstWhere(
      (role) => role.value == value,
      orElse: () => UserRole.customer,
    );
  }
}

/// User status enum (matching backend)
enum UserStatus {
  active('active'),
  suspended('suspended'),
  pending('pending'),
  inactive('inactive');

  const UserStatus(this.value);
  final String value;

  static UserStatus fromString(String value) {
    return UserStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => UserStatus.pending,
    );
  }
}

/// User authentication status
enum AuthStatus {
  authenticated,
  unauthenticated,
  loading,
}

/// User data model (matching backend schema)
class AppUser {
  final String id;
  final String email;
  final String? phone;
  final String? firstName;
  final String? lastName;
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
  final bool twoFactorEnabled;
  final String? twoFactorMethod;
  final String? googleId;
  final String? appleId;
  final String? pushToken;
  final int loyaltyPoints;
  final String loyaltyTier;
  final int totalOrders;
  final double totalSpent;
  final String? referralCode;
  final String? referredBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  const AppUser({
    required this.id,
    required this.email,
    this.phone,
    this.firstName,
    this.lastName,
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
    this.twoFactorEnabled = false,
    this.twoFactorMethod,
    this.googleId,
    this.appleId,
    this.pushToken,
    this.loyaltyPoints = 0,
    this.loyaltyTier = 'bronze',
    this.totalOrders = 0,
    this.totalSpent = 0.0,
    this.referralCode,
    this.referredBy,
    required this.createdAt,
    required this.updatedAt,
  });

  // Computed properties
  String get fullName => [firstName, lastName].where((name) => name != null && name.isNotEmpty).join(' ');
  String get displayName => fullName.isNotEmpty ? fullName : email;
  String get name => fullName; // Alias for backward compatibility
  bool get isVerified => emailVerified || phoneVerified;
  
  AppUser copyWith({
    String? id,
    String? email,
    String? phone,
    String? firstName,
    String? lastName,
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
    bool? twoFactorEnabled,
    String? twoFactorMethod,
    String? googleId,
    String? appleId,
    String? pushToken,
    int? loyaltyPoints,
    String? loyaltyTier,
    int? totalOrders,
    double? totalSpent,
    String? referralCode,
    String? referredBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AppUser(
      id: id ?? this.id,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
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
      twoFactorEnabled: twoFactorEnabled ?? this.twoFactorEnabled,
      twoFactorMethod: twoFactorMethod ?? this.twoFactorMethod,
      googleId: googleId ?? this.googleId,
      appleId: appleId ?? this.appleId,
      pushToken: pushToken ?? this.pushToken,
      loyaltyPoints: loyaltyPoints ?? this.loyaltyPoints,
      loyaltyTier: loyaltyTier ?? this.loyaltyTier,
      totalOrders: totalOrders ?? this.totalOrders,
      totalSpent: totalSpent ?? this.totalSpent,
      referralCode: referralCode ?? this.referralCode,
      referredBy: referredBy ?? this.referredBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'firstName': firstName,
      'lastName': lastName,
      'role': role.value,
      'status': status.value,
      'avatar': avatar,
      'location': location,
      'preferences': preferences,
      'emailVerified': emailVerified,
      'phoneVerified': phoneVerified,
      'lastLoginAt': lastLoginAt?.toIso8601String(),
      'city': city,
      'language': language,
      'twoFactorEnabled': twoFactorEnabled,
      'twoFactorMethod': twoFactorMethod,
      'googleId': googleId,
      'appleId': appleId,
      'pushToken': pushToken,
      'loyaltyPoints': loyaltyPoints,
      'loyaltyTier': loyaltyTier,
      'totalOrders': totalOrders,
      'totalSpent': totalSpent,
      'referralCode': referralCode,
      'referredBy': referredBy,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      role: UserRole.fromString(json['role'] as String? ?? 'customer'),
      status: UserStatus.fromString(json['status'] as String? ?? 'pending'),
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
      twoFactorEnabled: json['twoFactorEnabled'] as bool? ?? false,
      twoFactorMethod: json['twoFactorMethod'] as String?,
      googleId: json['googleId'] as String?,
      appleId: json['appleId'] as String?,
      pushToken: json['pushToken'] as String?,
      loyaltyPoints: json['loyalty_points'] as int? ?? json['loyaltyPoints'] as int? ?? 0,
      loyaltyTier: json['loyalty_tier'] as String? ?? json['loyaltyTier'] as String? ?? 'bronze',
      totalOrders: json['total_orders'] as int? ?? json['totalOrders'] as int? ?? 0,
      totalSpent: (json['total_spent'] as num?)?.toDouble() ?? (json['totalSpent'] as num?)?.toDouble() ?? 0.0,
      referralCode: json['referral_code'] as String? ?? json['referralCode'] as String?,
      referredBy: json['referred_by'] as String? ?? json['referredBy'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String? ?? json['created_at'] as String? ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] as String? ?? json['updated_at'] as String? ?? DateTime.now().toIso8601String()),
    );
  }

  bool hasRole(UserRole requiredRole) {
    return role == requiredRole;
  }

  bool hasAnyRole(List<UserRole> roles) {
    return roles.contains(role);
  }
}
