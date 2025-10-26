import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'app_error.dart';

/// Error handler service that converts exceptions to AppError
class ErrorHandler {
  static final Logger _logger = Logger('ErrorHandler');

  /// Convert any exception to AppError
  static AppError handleError(Object error, StackTrace? stackTrace) {
    _logger.severe('Error occurred: $error', error, stackTrace);

    if (error is AppError) {
      return error;
    }

    if (error is DioException) {
      return _handleDioError(error);
    }

    // Handle other common errors
    if (error is FormatException) {
      return const AppError.validationError(
        message: 'Format de données invalide',
        errorCode: 'INVALID_FORMAT',
      );
    }

    if (error is TypeError || error is NoSuchMethodError) {
      return AppError.unknownError(
        message: 'Erreur interne de l\'application',
        details: error.toString(),
        originalError: error,
      );
    }

    // Default unknown error
    return AppError.unknownError(
      message: 'Une erreur inattendue s\'est produite',
      details: error.toString(),
      originalError: error,
    );
  }

  /// Handle Dio HTTP errors
  static AppError _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return AppError.networkError(
          message: 'Délai de connexion dépassé',
          details: error.message,
        );

      case DioExceptionType.connectionError:
        return AppError.networkError(
          message: 'Erreur de connexion réseau',
          details: error.message,
        );

      case DioExceptionType.badResponse:
        return _handleHttpError(error);

      case DioExceptionType.cancel:
        return const AppError.unknownError(
          message: 'Requête annulée',
        );

      case DioExceptionType.unknown:
        return AppError.networkError(
          message: 'Erreur de connexion',
          details: error.message,
        );

      default:
        return AppError.unknownError(
          message: 'Erreur réseau inattendue',
          details: error.message,
          originalError: error,
        );
    }
  }

  /// Handle HTTP response errors
  static AppError _handleHttpError(DioException error) {
    final statusCode = error.response?.statusCode;
    final responseData = error.response?.data;

    // Try to parse backend error format
    if (responseData is Map<String, dynamic>) {
      final errorMessage = responseData['error'] as String?;
      final errorCode = responseData['error_code'] as String?;
      final message = responseData['message'] as String?;
      final fieldErrors = responseData['field_errors'] as Map<String, dynamic>?;

      // Handle specific error codes from backend
      switch (errorCode) {
        case 'VALIDATION_ERROR':
          return AppError.validationError(
            message: errorMessage ?? message ?? 'Erreur de validation',
            fieldErrors: fieldErrors?.map((key, value) => MapEntry(
              key, 
              value is List ? value.cast<String>() : [value.toString()]
            )),
            errorCode: errorCode,
          );

        case 'USER_NOT_FOUND':
        case 'RESTAURANT_NOT_FOUND':
        case 'ORDER_NOT_FOUND':
          return AppError.notFoundError(
            message: errorMessage ?? message ?? 'Ressource non trouvée',
            resource: errorCode,
          );

        case 'INVALID_CREDENTIALS':
        case 'TOKEN_EXPIRED':
        case 'INVALID_TOKEN':
          return AppError.authError(
            message: errorMessage ?? message ?? 'Erreur d\'authentification',
            errorCode: errorCode,
            requiresReauth: true,
          );

        case 'ACCESS_DENIED':
        case 'INSUFFICIENT_PERMISSIONS':
          return AppError.permissionError(
            message: errorMessage ?? message ?? 'Accès refusé',
            requiredPermission: errorCode,
          );

        case 'RATE_LIMIT_EXCEEDED':
          return AppError.rateLimitError(
            message: errorMessage ?? message ?? 'Trop de tentatives',
            retryAfterSeconds: responseData['retry_after'] as int?,
          );
      }
    }

    // Handle by status code
    switch (statusCode) {
      case 400:
        return AppError.validationError(
          message: _extractErrorMessage(responseData) ?? 'Requête invalide',
          errorCode: 'BAD_REQUEST',
        );

      case 401:
        return AppError.authError(
          message: _extractErrorMessage(responseData) ?? 'Non autorisé',
          requiresReauth: true,
        );

      case 403:
        return AppError.permissionError(
          message: _extractErrorMessage(responseData) ?? 'Accès interdit',
        );

      case 404:
        return AppError.notFoundError(
          message: _extractErrorMessage(responseData) ?? 'Ressource non trouvée',
        );

      case 409:
        return AppError.conflictError(
          message: _extractErrorMessage(responseData) ?? 'Conflit de données',
        );

      case 422:
        return AppError.validationError(
          message: _extractErrorMessage(responseData) ?? 'Données invalides',
          errorCode: 'UNPROCESSABLE_ENTITY',
        );

      case 429:
        return AppError.rateLimitError(
          message: _extractErrorMessage(responseData) ?? 'Trop de requêtes',
        );

      case 500:
        return AppError.serverError(
          message: _extractErrorMessage(responseData) ?? 'Erreur interne du serveur',
          statusCode: statusCode,
          errorCode: 'INTERNAL_SERVER_ERROR',
        );

      case 502:
      case 503:
      case 504:
        return AppError.maintenanceError(
          message: _extractErrorMessage(responseData) ?? 'Service temporairement indisponible',
        );

      default:
        return AppError.serverError(
          message: _extractErrorMessage(responseData) ?? 'Erreur serveur',
          statusCode: statusCode,
        );
    }
  }

  /// Extract error message from response data
  static String? _extractErrorMessage(dynamic responseData) {
    if (responseData is Map<String, dynamic>) {
      return responseData['error'] as String? ?? 
             responseData['message'] as String? ??
             responseData['detail'] as String?;
    }
    if (responseData is String) {
      return responseData;
    }
    return null;
  }

  /// Check if error is retryable
  static bool isRetryable(AppError error) {
    return error.when(
      networkError: (_, __, ___) => true,
      serverError: (_, __, statusCode, ___) => statusCode == null || statusCode >= 500,
      validationError: (_, __, ___) => false,
      authError: (_, __, ___) => false,
      permissionError: (_, __) => false,
      notFoundError: (_, __) => false,
      conflictError: (_, __) => false,
      rateLimitError: (_, __) => true,
      maintenanceError: (_, __) => true,
      unknownError: (_, __, ___) => false,
      localStorageError: (_, __) => false,
      locationError: (_, __) => false,
      cameraError: (_, __) => false,
      biometricError: (_, __) => false,
    );
  }

  /// Get retry delay in milliseconds
  static int getRetryDelay(int attempt) {
    // Exponential backoff: 1s, 2s, 4s, 8s, 16s (max)
    final delay = (1000 * (1 << (attempt - 1))).clamp(1000, 16000);
    return delay;
  }

  /// Check if should show error to user
  static bool shouldShowToUser(AppError error) {
    return error.when(
      networkError: (_, __, ___) => true,
      serverError: (_, __, ___, ____) => true,
      validationError: (_, __, ___) => true,
      authError: (_, __, ___) => true,
      permissionError: (_, __) => true,
      notFoundError: (_, __) => true,
      conflictError: (_, __) => true,
      rateLimitError: (_, __) => true,
      maintenanceError: (_, __) => true,
      unknownError: (_, __, ___) => true,
      localStorageError: (_, __) => true,
      locationError: (_, __) => true,
      cameraError: (_, __) => true,
      biometricError: (_, __) => true,
    );
  }
}
