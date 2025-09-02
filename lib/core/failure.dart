import 'package:dio/dio.dart';

/// Base failure class for error handling
sealed class Failure {
  const Failure(this.message);

  final String message;

  /// Network connectivity failure
  const factory Failure.networkError([String? message]) = NetworkFailure;

  /// Server error (5xx)
  const factory Failure.serverError([String? message]) = ServerFailure;

  /// Client error (4xx)
  const factory Failure.clientError([String? message]) = ClientFailure;

  /// Validation error
  const factory Failure.validationError([String? message]) = ValidationFailure;

  /// Authentication/Authorization error
  const factory Failure.unauthorized([String? message]) = UnauthorizedFailure;

  /// Resource not found
  const factory Failure.notFound([String? message]) = NotFoundFailure;

  /// Rate limiting error
  const factory Failure.rateLimited([String? message]) = RateLimitFailure;

  /// Timeout error
  const factory Failure.timeout([String? message]) = TimeoutFailure;

  /// Unknown/Unexpected error
  const factory Failure.unknown([String? message]) = UnknownFailure;

  /// Create failure from Dio error
  factory Failure.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Failure.timeout(error.message ?? 'Request timeout');

      case DioExceptionType.connectionError:
        return Failure.networkError(
          error.message ?? 'Connection error. Please check your internet connection.',
        );

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = _extractErrorMessage(error.response);

        if (statusCode != null) {
          if (statusCode >= 500) {
            return Failure.serverError(message ?? 'Server error');
          } else if (statusCode == 401 || statusCode == 403) {
            return Failure.unauthorized(message ?? 'Unauthorized access');
          } else if (statusCode == 404) {
            return Failure.notFound(message ?? 'Resource not found');
          } else if (statusCode == 429) {
            return Failure.rateLimited(message ?? 'Too many requests');
          } else if (statusCode >= 400) {
            return Failure.clientError(message ?? 'Bad request');
          }
        }
        return Failure.unknown(message ?? 'Unknown error occurred');

      case DioExceptionType.cancel:
        return const Failure.unknown('Request was cancelled');

      case DioExceptionType.unknown:
        return Failure.unknown(error.message ?? 'Unknown error occurred');

      case DioExceptionType.badCertificate:
        return const Failure.networkError('SSL certificate error');
    }
  }

  /// Extract error message from response
  static String? _extractErrorMessage(Response? response) {
    try {
      final data = response?.data;
      if (data is Map<String, dynamic>) {
        return data['message'] as String? ?? 
               data['error'] as String? ?? 
               data['detail'] as String?;
      }
      return response?.statusMessage;
    } catch (_) {
      return response?.statusMessage;
    }
  }

  @override
  String toString() => message;
}

/// Network connectivity failure
final class NetworkFailure extends Failure {
  const NetworkFailure([String? message]) 
      : super(message ?? 'Network connection error');
}

/// Server error (5xx)
final class ServerFailure extends Failure {
  const ServerFailure([String? message]) 
      : super(message ?? 'Server error occurred');
}

/// Client error (4xx)
final class ClientFailure extends Failure {
  const ClientFailure([String? message]) 
      : super(message ?? 'Bad request');
}

/// Validation error
final class ValidationFailure extends Failure {
  const ValidationFailure([String? message]) 
      : super(message ?? 'Validation error');
}

/// Authentication/Authorization error
final class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([String? message]) 
      : super(message ?? 'Unauthorized access');
}

/// Resource not found
final class NotFoundFailure extends Failure {
  const NotFoundFailure([String? message]) 
      : super(message ?? 'Resource not found');
}

/// Rate limiting error
final class RateLimitFailure extends Failure {
  const RateLimitFailure([String? message]) 
      : super(message ?? 'Rate limit exceeded');
}

/// Timeout error
final class TimeoutFailure extends Failure {
  const TimeoutFailure([String? message]) 
      : super(message ?? 'Request timeout');
}

/// Unknown/Unexpected error
final class UnknownFailure extends Failure {
  const UnknownFailure([String? message]) 
      : super(message ?? 'Unknown error occurred');
}
