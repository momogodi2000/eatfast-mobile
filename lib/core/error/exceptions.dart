/// Base exception class for the application
abstract class AppException implements Exception {
  final String message;
  final String? code;

  const AppException(this.message, {this.code});

  @override
  String toString() => 'AppException: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Server-related exceptions
class ServerException extends AppException {
  const ServerException(super.message, {super.code});

  @override
  String toString() => 'ServerException: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Cache-related exceptions
class CacheException extends AppException {
  const CacheException(super.message, {super.code});

  @override
  String toString() => 'CacheException: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Network-related exceptions
class NetworkException extends AppException {
  const NetworkException(super.message, {super.code});

  @override
  String toString() => 'NetworkException: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Authentication-related exceptions
class AuthException extends AppException {
  const AuthException(super.message, {super.code});

  @override
  String toString() => 'AuthException: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Location-related exceptions
class LocationException extends AppException {
  const LocationException(super.message, {super.code});

  @override
  String toString() => 'LocationException: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Validation-related exceptions
class ValidationException extends AppException {
  const ValidationException(super.message, {super.code});

  @override
  String toString() => 'ValidationException: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Payment-related exceptions
class PaymentException extends AppException {
  const PaymentException(super.message, {super.code});

  @override
  String toString() => 'PaymentException: $message${code != null ? ' (Code: $code)' : ''}';
}