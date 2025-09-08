/// User model representing a user in the system - matches backend User model
class User {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String phone;
  final String role;
  final String? city;
  final String? avatarUrl;
  final bool isEmailVerified;
  final bool isPhoneVerified;
  final bool is2FAEnabled;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? lastLoginAt;
  final Map<String, dynamic>? preferences;

  const User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.role,
    this.city,
    this.avatarUrl,
    this.isEmailVerified = false,
    this.isPhoneVerified = false,
    this.is2FAEnabled = false,
    required this.createdAt,
    required this.updatedAt,
    this.lastLoginAt,
    this.preferences,
  });

  /// Get full name
  String get fullName => '$firstName $lastName'.trim();

  /// Create User from JSON - matches backend response format
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String? ?? json['first_name'] as String? ?? '',
      lastName: json['lastName'] as String? ?? json['last_name'] as String? ?? '',
      phone: json['phone'] as String? ?? json['phoneNumber'] as String? ?? '',
      role: json['role'] as String? ?? 'customer',
      city: json['city'] as String?,
      avatarUrl: json['avatarUrl'] as String? ?? json['avatar_url'] as String?,
      isEmailVerified: json['isEmailVerified'] as bool? ?? json['email_verified'] as bool? ?? false,
      isPhoneVerified: json['isPhoneVerified'] as bool? ?? json['phone_verified'] as bool? ?? false,
      is2FAEnabled: json['is2FAEnabled'] as bool? ?? json['is_2fa_enabled'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String? ?? json['created_at'] as String? ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] as String? ?? json['updated_at'] as String? ?? DateTime.now().toIso8601String()),
      lastLoginAt: json['lastLoginAt'] as String? ?? json['last_login_at'] as String?,
      preferences: json['preferences'] as Map<String, dynamic>?,
    );
  }

  /// Convert User to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'role': role,
      'city': city,
      'avatarUrl': avatarUrl,
      'isEmailVerified': isEmailVerified,
      'isPhoneVerified': isPhoneVerified,
      'is2FAEnabled': is2FAEnabled,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'lastLoginAt': lastLoginAt,
      'preferences': preferences,
    };
  }

  /// Create a copy with updated values
  User copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? phone,
    String? role,
    String? city,
    String? avatarUrl,
    bool? isEmailVerified,
    bool? isPhoneVerified,
    bool? is2FAEnabled,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? lastLoginAt,
    Map<String, dynamic>? preferences,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      city: city ?? this.city,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
      is2FAEnabled: is2FAEnabled ?? this.is2FAEnabled,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      preferences: preferences ?? this.preferences,
    );
  }

  /// Get initials from full name
  String get initials {
    if (firstName.isEmpty && lastName.isEmpty) return '';
    if (lastName.isEmpty) {
      return firstName.substring(0, 1).toUpperCase();
    }
    return '${firstName.substring(0, 1)}${lastName.substring(0, 1)}'.toUpperCase();
  }

  /// Check if user profile is complete
  bool get isProfileComplete {
    return firstName.isNotEmpty && 
           lastName.isNotEmpty &&
           email.isNotEmpty && 
           phone.isNotEmpty &&
           isEmailVerified &&
           isPhoneVerified;
  }

  /// Check if user is customer
  bool get isCustomer => role == 'customer';
  
  /// Check if user is restaurant owner
  bool get isRestaurantOwner => role == 'restaurant_owner';
  
  /// Check if user is delivery agent/driver
  bool get isDriver => role == 'delivery_agent';
  
  /// Check if user is admin
  bool get isAdmin => role == 'admin';

  @override
  String toString() {
    return 'User(id: $id, fullName: $fullName, email: $email, phone: $phone, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
