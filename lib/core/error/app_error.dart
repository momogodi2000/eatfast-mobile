import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_error.freezed.dart';

/// Comprehensive error handling matching backend error format
@freezed
class AppError with _$AppError {
  const factory AppError.networkError({
    required String message,
    String? details,
    int? statusCode,
  }) = NetworkError;

  const factory AppError.serverError({
    required String message,
    String? details,
    int? statusCode,
    String? errorCode,
  }) = ServerError;

  const factory AppError.validationError({
    required String message,
    Map<String, List<String>>? fieldErrors,
    String? errorCode,
  }) = ValidationError;

  const factory AppError.authError({
    required String message,
    String? errorCode,
    @Default(false) bool requiresReauth,
  }) = AuthError;

  const factory AppError.permissionError({
    required String message,
    String? requiredPermission,
  }) = PermissionError;

  const factory AppError.notFoundError({
    required String message,
    String? resource,
  }) = NotFoundError;

  const factory AppError.conflictError({
    required String message,
    String? details,
  }) = ConflictError;

  const factory AppError.rateLimitError({
    required String message,
    int? retryAfterSeconds,
  }) = RateLimitError;

  const factory AppError.maintenanceError({
    required String message,
    String? estimatedRestoreTime,
  }) = MaintenanceError;

  const factory AppError.unknownError({
    required String message,
    String? details,
    Object? originalError,
  }) = UnknownError;

  const factory AppError.localStorageError({
    required String message,
    String? operation,
  }) = LocalStorageError;

  const factory AppError.locationError({
    required String message,
    String? permissionStatus,
  }) = LocationError;

  const factory AppError.cameraError({
    required String message,
    String? permissionStatus,
  }) = CameraError;

  const factory AppError.biometricError({
    required String message,
    String? reason,
  }) = BiometricError;
}

/// Error severity level
enum ErrorSeverity {
  low,
  medium,
  high,
  critical;

  String get displayName {
    switch (this) {
      case ErrorSeverity.low:
        return 'Faible';
      case ErrorSeverity.medium:
        return 'Moyen';
      case ErrorSeverity.high:
        return 'Élevé';
      case ErrorSeverity.critical:
        return 'Critique';
    }
  }
}

/// Error extension methods
extension AppErrorX on AppError {
  /// Get error severity
  ErrorSeverity get severity {
    return when(
      networkError: (message, details, statusCode) => ErrorSeverity.medium,
      serverError: (message, details, statusCode, errorCode) => ErrorSeverity.high,
      validationError: (message, fieldErrors, errorCode) => ErrorSeverity.low,
      authError: (message, errorCode, requiresReauth) => ErrorSeverity.high,
      permissionError: (message, requiredPermission) => ErrorSeverity.medium,
      notFoundError: (message, resource) => ErrorSeverity.low,
      conflictError: (message, details) => ErrorSeverity.medium,
      rateLimitError: (message, retryAfterSeconds) => ErrorSeverity.medium,
      maintenanceError: (message, estimatedRestoreTime) => ErrorSeverity.critical,
      unknownError: (message, details, originalError) => ErrorSeverity.high,
      localStorageError: (message, operation) => ErrorSeverity.medium,
      locationError: (message, permissionStatus) => ErrorSeverity.medium,
      cameraError: (message, permissionStatus) => ErrorSeverity.medium,
      biometricError: (message, reason) => ErrorSeverity.low,
    );
  }

  /// Get user-friendly message
  String get userMessage {
    return when(
      networkError: (message, details, statusCode) => 
          'Problème de connexion. Vérifiez votre connexion internet.',
      serverError: (message, details, statusCode, errorCode) {
        if (statusCode == 503) return 'Service temporairement indisponible. Veuillez réessayer plus tard.';
        return 'Erreur du serveur. Veuillez réessayer plus tard.';
      },
      validationError: (message, fieldErrors, errorCode) => message,
      authError: (message, errorCode, requiresReauth) => 
          'Erreur d\'authentification. Veuillez vous reconnecter.',
      permissionError: (message, requiredPermission) => 
          'Permissions insuffisantes pour cette opération.',
      notFoundError: (message, resource) => 'Ressource non trouvée.',
      conflictError: (message, details) => message,
      rateLimitError: (message, retryAfterSeconds) => 
          'Trop de tentatives. Veuillez attendre ${retryAfterSeconds ?? 60} secondes.',
      maintenanceError: (message, estimatedRestoreTime) => 
          'Service en maintenance. Veuillez réessayer plus tard.',
      unknownError: (message, details, originalError) => 
          'Une erreur inattendue s\'est produite.',
      localStorageError: (message, operation) => 
          'Erreur de stockage local.',
      locationError: (message, permissionStatus) => 
          'Impossible d\'accéder à votre localisation.',
      cameraError: (message, permissionStatus) => 
          'Impossible d\'accéder à l\'appareil photo.',
      biometricError: (message, reason) => 
          'Erreur d\'authentification biométrique.',
    );
  }

  /// Check if error requires user action
  bool get requiresUserAction {
    return when(
      networkError: (message, details, statusCode) => true,
      serverError: (message, details, statusCode, errorCode) => false,
      validationError: (message, fieldErrors, errorCode) => true,
      authError: (message, errorCode, requiresReauth) => requiresReauth,
      permissionError: (message, requiredPermission) => true,
      notFoundError: (message, resource) => false,
      conflictError: (message, details) => true,
      rateLimitError: (message, retryAfterSeconds) => false,
      maintenanceError: (message, estimatedRestoreTime) => false,
      unknownError: (message, details, originalError) => false,
      localStorageError: (message, operation) => true,
      locationError: (message, permissionStatus) => true,
      cameraError: (message, permissionStatus) => true,
      biometricError: (message, reason) => true,
    );
  }

  /// Check if error should be reported to crash analytics
  bool get shouldReport {
    return when(
      networkError: (message, details, statusCode) => false,
      serverError: (message, details, statusCode, errorCode) => true,
      validationError: (message, fieldErrors, errorCode) => false,
      authError: (message, errorCode, requiresReauth) => false,
      permissionError: (message, requiredPermission) => false,
      notFoundError: (message, resource) => false,
      conflictError: (message, details) => false,
      rateLimitError: (message, retryAfterSeconds) => false,
      maintenanceError: (message, estimatedRestoreTime) => false,
      unknownError: (message, details, originalError) => true,
      localStorageError: (message, operation) => true,
      locationError: (message, permissionStatus) => false,
      cameraError: (message, permissionStatus) => false,
      biometricError: (message, reason) => false,
    );
  }

  /// Get suggested action for the user
  String? get suggestedAction {
    return when(
      networkError: (message, details, statusCode) => 
          'Vérifiez votre connexion internet et réessayez',
      serverError: (message, details, statusCode, errorCode) => 
          'Veuillez réessayer dans quelques minutes',
      validationError: (message, fieldErrors, errorCode) => 
          'Corrigez les erreurs et réessayez',
      authError: (message, errorCode, requiresReauth) => 
          'Reconnectez-vous à votre compte',
      permissionError: (message, requiredPermission) => 
          'Accordez les permissions nécessaires dans les paramètres',
      notFoundError: (message, resource) => null,
      conflictError: (message, details) => 
          'Actualisez et réessayez',
      rateLimitError: (message, retryAfterSeconds) => 
          'Attendez quelques minutes avant de réessayer',
      maintenanceError: (message, estimatedRestoreTime) => 
          'Vérifiez les mises à jour de l\'application',
      unknownError: (message, details, originalError) => 
          'Redémarrez l\'application',
      localStorageError: (message, operation) => 
          'Libérez de l\'espace de stockage',
      locationError: (message, permissionStatus) => 
          'Activez la localisation dans les paramètres',
      cameraError: (message, permissionStatus) => 
          'Autorisez l\'accès à l\'appareil photo',
      biometricError: (message, reason) => 
          'Utilisez votre mot de passe à la place',
    );
  }
}