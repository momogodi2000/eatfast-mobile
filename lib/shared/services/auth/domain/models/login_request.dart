/// Login request model matching backend API
class LoginRequest {
  final String email;
  final String password;
  final bool rememberMe;
  final Map<String, dynamic>? deviceInfo;

  const LoginRequest({
    required this.email,
    required this.password,
    this.rememberMe = false,
    this.deviceInfo,
  });

  /// Convert to JSON for API
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'rememberMe': rememberMe,
      if (deviceInfo != null) 'deviceInfo': deviceInfo,
    };
  }

  /// Create from JSON
  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      rememberMe: json['rememberMe'] as bool? ?? false,
      deviceInfo: json['deviceInfo'] as Map<String, dynamic>?,
    );
  }

  /// Create copy with new values
  LoginRequest copyWith({
    String? email,
    String? password,
    bool? rememberMe,
    Map<String, dynamic>? deviceInfo,
  }) {
    return LoginRequest(
      email: email ?? this.email,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
      deviceInfo: deviceInfo ?? this.deviceInfo,
    );
  }

  @override
  String toString() {
    return 'LoginRequest(email: $email, rememberMe: $rememberMe)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LoginRequest &&
        other.email == email &&
        other.password == password &&
        other.rememberMe == rememberMe;
  }

  @override
  int get hashCode {
    return email.hashCode ^ password.hashCode ^ rememberMe.hashCode;
  }
}
