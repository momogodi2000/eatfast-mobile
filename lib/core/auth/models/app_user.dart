/// User roles in the application
enum UserRole {
  customer('customer'),
  restaurantOwner('restaurant_owner'),
  driver('driver'),
  admin('admin');

  const UserRole(this.value);
  final String value;

  static UserRole fromString(String value) {
    return UserRole.values.firstWhere(
      (role) => role.value == value,
      orElse: () => UserRole.customer,
    );
  }
}

/// User authentication status
enum AuthStatus {
  authenticated,
  unauthenticated,
  loading,
}

/// User data model
class AppUser {
  final String id;
  final String email;
  final String? name;
  final String? phone;
  final UserRole role;
  final String? avatar;
  final bool isVerified;
  final DateTime createdAt;
  final DateTime lastLoginAt;

  const AppUser({
    required this.id,
    required this.email,
    this.name,
    this.phone,
    this.role = UserRole.customer,
    this.avatar,
    this.isVerified = false,
    required this.createdAt,
    required this.lastLoginAt,
  });

  AppUser copyWith({
    String? id,
    String? email,
    String? name,
    String? phone,
    UserRole? role,
    String? avatar,
    bool? isVerified,
    DateTime? createdAt,
    DateTime? lastLoginAt,
  }) {
    return AppUser(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      avatar: avatar ?? this.avatar,
      isVerified: isVerified ?? this.isVerified,
      createdAt: createdAt ?? this.createdAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'role': role.value,
      'avatar': avatar,
      'isVerified': isVerified,
      'createdAt': createdAt.toIso8601String(),
      'lastLoginAt': lastLoginAt.toIso8601String(),
    };
  }

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      role: UserRole.fromString(json['role'] as String? ?? 'customer'),
      avatar: json['avatar'] as String?,
      isVerified: json['isVerified'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastLoginAt: DateTime.parse(json['lastLoginAt'] as String),
    );
  }

  bool hasRole(UserRole requiredRole) {
    return role == requiredRole;
  }

  bool hasAnyRole(List<UserRole> roles) {
    return roles.contains(role);
  }
}
