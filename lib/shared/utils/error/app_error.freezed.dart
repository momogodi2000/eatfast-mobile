// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppError {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? details, int? statusCode)
        networkError,
    required TResult Function(
            String message, String? details, int? statusCode, String? errorCode)
        serverError,
    required TResult Function(String message,
            Map<String, List<String>>? fieldErrors, String? errorCode)
        validationError,
    required TResult Function(
            String message, String? errorCode, bool requiresReauth)
        authError,
    required TResult Function(String message, String? requiredPermission)
        permissionError,
    required TResult Function(String message, String? resource) notFoundError,
    required TResult Function(String message, String? details) conflictError,
    required TResult Function(String message, int? retryAfterSeconds)
        rateLimitError,
    required TResult Function(String message, String? estimatedRestoreTime)
        maintenanceError,
    required TResult Function(
            String message, String? details, Object? originalError)
        unknownError,
    required TResult Function(String message, String? operation)
        localStorageError,
    required TResult Function(String message, String? permissionStatus)
        locationError,
    required TResult Function(String message, String? permissionStatus)
        cameraError,
    required TResult Function(String message, String? reason) biometricError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, int? statusCode)?
        networkError,
    TResult? Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult? Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult? Function(String message, String? requiredPermission)?
        permissionError,
    TResult? Function(String message, String? resource)? notFoundError,
    TResult? Function(String message, String? details)? conflictError,
    TResult? Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult? Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult? Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult? Function(String message, String? operation)? localStorageError,
    TResult? Function(String message, String? permissionStatus)? locationError,
    TResult? Function(String message, String? permissionStatus)? cameraError,
    TResult? Function(String message, String? reason)? biometricError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, int? statusCode)?
        networkError,
    TResult Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult Function(String message, String? requiredPermission)?
        permissionError,
    TResult Function(String message, String? resource)? notFoundError,
    TResult Function(String message, String? details)? conflictError,
    TResult Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult Function(String message, String? operation)? localStorageError,
    TResult Function(String message, String? permissionStatus)? locationError,
    TResult Function(String message, String? permissionStatus)? cameraError,
    TResult Function(String message, String? reason)? biometricError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(AuthError value) authError,
    required TResult Function(PermissionError value) permissionError,
    required TResult Function(NotFoundError value) notFoundError,
    required TResult Function(ConflictError value) conflictError,
    required TResult Function(RateLimitError value) rateLimitError,
    required TResult Function(MaintenanceError value) maintenanceError,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(LocalStorageError value) localStorageError,
    required TResult Function(LocationError value) locationError,
    required TResult Function(CameraError value) cameraError,
    required TResult Function(BiometricError value) biometricError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(AuthError value)? authError,
    TResult? Function(PermissionError value)? permissionError,
    TResult? Function(NotFoundError value)? notFoundError,
    TResult? Function(ConflictError value)? conflictError,
    TResult? Function(RateLimitError value)? rateLimitError,
    TResult? Function(MaintenanceError value)? maintenanceError,
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(LocalStorageError value)? localStorageError,
    TResult? Function(LocationError value)? locationError,
    TResult? Function(CameraError value)? cameraError,
    TResult? Function(BiometricError value)? biometricError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(AuthError value)? authError,
    TResult Function(PermissionError value)? permissionError,
    TResult Function(NotFoundError value)? notFoundError,
    TResult Function(ConflictError value)? conflictError,
    TResult Function(RateLimitError value)? rateLimitError,
    TResult Function(MaintenanceError value)? maintenanceError,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(LocalStorageError value)? localStorageError,
    TResult Function(LocationError value)? locationError,
    TResult Function(CameraError value)? cameraError,
    TResult Function(BiometricError value)? biometricError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppErrorCopyWith<AppError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppErrorCopyWith<$Res> {
  factory $AppErrorCopyWith(AppError value, $Res Function(AppError) then) =
      _$AppErrorCopyWithImpl<$Res, AppError>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AppErrorCopyWithImpl<$Res, $Val extends AppError>
    implements $AppErrorCopyWith<$Res> {
  _$AppErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$NetworkErrorImplCopyWith(
          _$NetworkErrorImpl value, $Res Function(_$NetworkErrorImpl) then) =
      __$$NetworkErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? details, int? statusCode});
}

/// @nodoc
class __$$NetworkErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$NetworkErrorImpl>
    implements _$$NetworkErrorImplCopyWith<$Res> {
  __$$NetworkErrorImplCopyWithImpl(
      _$NetworkErrorImpl _value, $Res Function(_$NetworkErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? details = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_$NetworkErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$NetworkErrorImpl implements NetworkError {
  const _$NetworkErrorImpl(
      {required this.message, this.details, this.statusCode});

  @override
  final String message;
  @override
  final String? details;
  @override
  final int? statusCode;

  @override
  String toString() {
    return 'AppError.networkError(message: $message, details: $details, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, details, statusCode);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      __$$NetworkErrorImplCopyWithImpl<_$NetworkErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? details, int? statusCode)
        networkError,
    required TResult Function(
            String message, String? details, int? statusCode, String? errorCode)
        serverError,
    required TResult Function(String message,
            Map<String, List<String>>? fieldErrors, String? errorCode)
        validationError,
    required TResult Function(
            String message, String? errorCode, bool requiresReauth)
        authError,
    required TResult Function(String message, String? requiredPermission)
        permissionError,
    required TResult Function(String message, String? resource) notFoundError,
    required TResult Function(String message, String? details) conflictError,
    required TResult Function(String message, int? retryAfterSeconds)
        rateLimitError,
    required TResult Function(String message, String? estimatedRestoreTime)
        maintenanceError,
    required TResult Function(
            String message, String? details, Object? originalError)
        unknownError,
    required TResult Function(String message, String? operation)
        localStorageError,
    required TResult Function(String message, String? permissionStatus)
        locationError,
    required TResult Function(String message, String? permissionStatus)
        cameraError,
    required TResult Function(String message, String? reason) biometricError,
  }) {
    return networkError(message, details, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, int? statusCode)?
        networkError,
    TResult? Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult? Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult? Function(String message, String? requiredPermission)?
        permissionError,
    TResult? Function(String message, String? resource)? notFoundError,
    TResult? Function(String message, String? details)? conflictError,
    TResult? Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult? Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult? Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult? Function(String message, String? operation)? localStorageError,
    TResult? Function(String message, String? permissionStatus)? locationError,
    TResult? Function(String message, String? permissionStatus)? cameraError,
    TResult? Function(String message, String? reason)? biometricError,
  }) {
    return networkError?.call(message, details, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, int? statusCode)?
        networkError,
    TResult Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult Function(String message, String? requiredPermission)?
        permissionError,
    TResult Function(String message, String? resource)? notFoundError,
    TResult Function(String message, String? details)? conflictError,
    TResult Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult Function(String message, String? operation)? localStorageError,
    TResult Function(String message, String? permissionStatus)? locationError,
    TResult Function(String message, String? permissionStatus)? cameraError,
    TResult Function(String message, String? reason)? biometricError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(message, details, statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(AuthError value) authError,
    required TResult Function(PermissionError value) permissionError,
    required TResult Function(NotFoundError value) notFoundError,
    required TResult Function(ConflictError value) conflictError,
    required TResult Function(RateLimitError value) rateLimitError,
    required TResult Function(MaintenanceError value) maintenanceError,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(LocalStorageError value) localStorageError,
    required TResult Function(LocationError value) locationError,
    required TResult Function(CameraError value) cameraError,
    required TResult Function(BiometricError value) biometricError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(AuthError value)? authError,
    TResult? Function(PermissionError value)? permissionError,
    TResult? Function(NotFoundError value)? notFoundError,
    TResult? Function(ConflictError value)? conflictError,
    TResult? Function(RateLimitError value)? rateLimitError,
    TResult? Function(MaintenanceError value)? maintenanceError,
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(LocalStorageError value)? localStorageError,
    TResult? Function(LocationError value)? locationError,
    TResult? Function(CameraError value)? cameraError,
    TResult? Function(BiometricError value)? biometricError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(AuthError value)? authError,
    TResult Function(PermissionError value)? permissionError,
    TResult Function(NotFoundError value)? notFoundError,
    TResult Function(ConflictError value)? conflictError,
    TResult Function(RateLimitError value)? rateLimitError,
    TResult Function(MaintenanceError value)? maintenanceError,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(LocalStorageError value)? localStorageError,
    TResult Function(LocationError value)? locationError,
    TResult Function(CameraError value)? cameraError,
    TResult Function(BiometricError value)? biometricError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class NetworkError implements AppError {
  const factory NetworkError(
      {required final String message,
      final String? details,
      final int? statusCode}) = _$NetworkErrorImpl;

  @override
  String get message;
  String? get details;
  int? get statusCode;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$ServerErrorImplCopyWith(
          _$ServerErrorImpl value, $Res Function(_$ServerErrorImpl) then) =
      __$$ServerErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message, String? details, int? statusCode, String? errorCode});
}

/// @nodoc
class __$$ServerErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$ServerErrorImpl>
    implements _$$ServerErrorImplCopyWith<$Res> {
  __$$ServerErrorImplCopyWithImpl(
      _$ServerErrorImpl _value, $Res Function(_$ServerErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? details = freezed,
    Object? statusCode = freezed,
    Object? errorCode = freezed,
  }) {
    return _then(_$ServerErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ServerErrorImpl implements ServerError {
  const _$ServerErrorImpl(
      {required this.message, this.details, this.statusCode, this.errorCode});

  @override
  final String message;
  @override
  final String? details;
  @override
  final int? statusCode;
  @override
  final String? errorCode;

  @override
  String toString() {
    return 'AppError.serverError(message: $message, details: $details, statusCode: $statusCode, errorCode: $errorCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, message, details, statusCode, errorCode);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      __$$ServerErrorImplCopyWithImpl<_$ServerErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? details, int? statusCode)
        networkError,
    required TResult Function(
            String message, String? details, int? statusCode, String? errorCode)
        serverError,
    required TResult Function(String message,
            Map<String, List<String>>? fieldErrors, String? errorCode)
        validationError,
    required TResult Function(
            String message, String? errorCode, bool requiresReauth)
        authError,
    required TResult Function(String message, String? requiredPermission)
        permissionError,
    required TResult Function(String message, String? resource) notFoundError,
    required TResult Function(String message, String? details) conflictError,
    required TResult Function(String message, int? retryAfterSeconds)
        rateLimitError,
    required TResult Function(String message, String? estimatedRestoreTime)
        maintenanceError,
    required TResult Function(
            String message, String? details, Object? originalError)
        unknownError,
    required TResult Function(String message, String? operation)
        localStorageError,
    required TResult Function(String message, String? permissionStatus)
        locationError,
    required TResult Function(String message, String? permissionStatus)
        cameraError,
    required TResult Function(String message, String? reason) biometricError,
  }) {
    return serverError(message, details, statusCode, errorCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, int? statusCode)?
        networkError,
    TResult? Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult? Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult? Function(String message, String? requiredPermission)?
        permissionError,
    TResult? Function(String message, String? resource)? notFoundError,
    TResult? Function(String message, String? details)? conflictError,
    TResult? Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult? Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult? Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult? Function(String message, String? operation)? localStorageError,
    TResult? Function(String message, String? permissionStatus)? locationError,
    TResult? Function(String message, String? permissionStatus)? cameraError,
    TResult? Function(String message, String? reason)? biometricError,
  }) {
    return serverError?.call(message, details, statusCode, errorCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, int? statusCode)?
        networkError,
    TResult Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult Function(String message, String? requiredPermission)?
        permissionError,
    TResult Function(String message, String? resource)? notFoundError,
    TResult Function(String message, String? details)? conflictError,
    TResult Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult Function(String message, String? operation)? localStorageError,
    TResult Function(String message, String? permissionStatus)? locationError,
    TResult Function(String message, String? permissionStatus)? cameraError,
    TResult Function(String message, String? reason)? biometricError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(message, details, statusCode, errorCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(AuthError value) authError,
    required TResult Function(PermissionError value) permissionError,
    required TResult Function(NotFoundError value) notFoundError,
    required TResult Function(ConflictError value) conflictError,
    required TResult Function(RateLimitError value) rateLimitError,
    required TResult Function(MaintenanceError value) maintenanceError,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(LocalStorageError value) localStorageError,
    required TResult Function(LocationError value) locationError,
    required TResult Function(CameraError value) cameraError,
    required TResult Function(BiometricError value) biometricError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(AuthError value)? authError,
    TResult? Function(PermissionError value)? permissionError,
    TResult? Function(NotFoundError value)? notFoundError,
    TResult? Function(ConflictError value)? conflictError,
    TResult? Function(RateLimitError value)? rateLimitError,
    TResult? Function(MaintenanceError value)? maintenanceError,
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(LocalStorageError value)? localStorageError,
    TResult? Function(LocationError value)? locationError,
    TResult? Function(CameraError value)? cameraError,
    TResult? Function(BiometricError value)? biometricError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(AuthError value)? authError,
    TResult Function(PermissionError value)? permissionError,
    TResult Function(NotFoundError value)? notFoundError,
    TResult Function(ConflictError value)? conflictError,
    TResult Function(RateLimitError value)? rateLimitError,
    TResult Function(MaintenanceError value)? maintenanceError,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(LocalStorageError value)? localStorageError,
    TResult Function(LocationError value)? locationError,
    TResult Function(CameraError value)? cameraError,
    TResult Function(BiometricError value)? biometricError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements AppError {
  const factory ServerError(
      {required final String message,
      final String? details,
      final int? statusCode,
      final String? errorCode}) = _$ServerErrorImpl;

  @override
  String get message;
  String? get details;
  int? get statusCode;
  String? get errorCode;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidationErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$ValidationErrorImplCopyWith(_$ValidationErrorImpl value,
          $Res Function(_$ValidationErrorImpl) then) =
      __$$ValidationErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      Map<String, List<String>>? fieldErrors,
      String? errorCode});
}

/// @nodoc
class __$$ValidationErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$ValidationErrorImpl>
    implements _$$ValidationErrorImplCopyWith<$Res> {
  __$$ValidationErrorImplCopyWithImpl(
      _$ValidationErrorImpl _value, $Res Function(_$ValidationErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? fieldErrors = freezed,
    Object? errorCode = freezed,
  }) {
    return _then(_$ValidationErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      fieldErrors: freezed == fieldErrors
          ? _value._fieldErrors
          : fieldErrors // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>?,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ValidationErrorImpl implements ValidationError {
  const _$ValidationErrorImpl(
      {required this.message,
      final Map<String, List<String>>? fieldErrors,
      this.errorCode})
      : _fieldErrors = fieldErrors;

  @override
  final String message;
  final Map<String, List<String>>? _fieldErrors;
  @override
  Map<String, List<String>>? get fieldErrors {
    final value = _fieldErrors;
    if (value == null) return null;
    if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? errorCode;

  @override
  String toString() {
    return 'AppError.validationError(message: $message, fieldErrors: $fieldErrors, errorCode: $errorCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._fieldErrors, _fieldErrors) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message,
      const DeepCollectionEquality().hash(_fieldErrors), errorCode);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationErrorImplCopyWith<_$ValidationErrorImpl> get copyWith =>
      __$$ValidationErrorImplCopyWithImpl<_$ValidationErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? details, int? statusCode)
        networkError,
    required TResult Function(
            String message, String? details, int? statusCode, String? errorCode)
        serverError,
    required TResult Function(String message,
            Map<String, List<String>>? fieldErrors, String? errorCode)
        validationError,
    required TResult Function(
            String message, String? errorCode, bool requiresReauth)
        authError,
    required TResult Function(String message, String? requiredPermission)
        permissionError,
    required TResult Function(String message, String? resource) notFoundError,
    required TResult Function(String message, String? details) conflictError,
    required TResult Function(String message, int? retryAfterSeconds)
        rateLimitError,
    required TResult Function(String message, String? estimatedRestoreTime)
        maintenanceError,
    required TResult Function(
            String message, String? details, Object? originalError)
        unknownError,
    required TResult Function(String message, String? operation)
        localStorageError,
    required TResult Function(String message, String? permissionStatus)
        locationError,
    required TResult Function(String message, String? permissionStatus)
        cameraError,
    required TResult Function(String message, String? reason) biometricError,
  }) {
    return validationError(message, fieldErrors, errorCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, int? statusCode)?
        networkError,
    TResult? Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult? Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult? Function(String message, String? requiredPermission)?
        permissionError,
    TResult? Function(String message, String? resource)? notFoundError,
    TResult? Function(String message, String? details)? conflictError,
    TResult? Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult? Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult? Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult? Function(String message, String? operation)? localStorageError,
    TResult? Function(String message, String? permissionStatus)? locationError,
    TResult? Function(String message, String? permissionStatus)? cameraError,
    TResult? Function(String message, String? reason)? biometricError,
  }) {
    return validationError?.call(message, fieldErrors, errorCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, int? statusCode)?
        networkError,
    TResult Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult Function(String message, String? requiredPermission)?
        permissionError,
    TResult Function(String message, String? resource)? notFoundError,
    TResult Function(String message, String? details)? conflictError,
    TResult Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult Function(String message, String? operation)? localStorageError,
    TResult Function(String message, String? permissionStatus)? locationError,
    TResult Function(String message, String? permissionStatus)? cameraError,
    TResult Function(String message, String? reason)? biometricError,
    required TResult orElse(),
  }) {
    if (validationError != null) {
      return validationError(message, fieldErrors, errorCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(AuthError value) authError,
    required TResult Function(PermissionError value) permissionError,
    required TResult Function(NotFoundError value) notFoundError,
    required TResult Function(ConflictError value) conflictError,
    required TResult Function(RateLimitError value) rateLimitError,
    required TResult Function(MaintenanceError value) maintenanceError,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(LocalStorageError value) localStorageError,
    required TResult Function(LocationError value) locationError,
    required TResult Function(CameraError value) cameraError,
    required TResult Function(BiometricError value) biometricError,
  }) {
    return validationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(AuthError value)? authError,
    TResult? Function(PermissionError value)? permissionError,
    TResult? Function(NotFoundError value)? notFoundError,
    TResult? Function(ConflictError value)? conflictError,
    TResult? Function(RateLimitError value)? rateLimitError,
    TResult? Function(MaintenanceError value)? maintenanceError,
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(LocalStorageError value)? localStorageError,
    TResult? Function(LocationError value)? locationError,
    TResult? Function(CameraError value)? cameraError,
    TResult? Function(BiometricError value)? biometricError,
  }) {
    return validationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(AuthError value)? authError,
    TResult Function(PermissionError value)? permissionError,
    TResult Function(NotFoundError value)? notFoundError,
    TResult Function(ConflictError value)? conflictError,
    TResult Function(RateLimitError value)? rateLimitError,
    TResult Function(MaintenanceError value)? maintenanceError,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(LocalStorageError value)? localStorageError,
    TResult Function(LocationError value)? locationError,
    TResult Function(CameraError value)? cameraError,
    TResult Function(BiometricError value)? biometricError,
    required TResult orElse(),
  }) {
    if (validationError != null) {
      return validationError(this);
    }
    return orElse();
  }
}

abstract class ValidationError implements AppError {
  const factory ValidationError(
      {required final String message,
      final Map<String, List<String>>? fieldErrors,
      final String? errorCode}) = _$ValidationErrorImpl;

  @override
  String get message;
  Map<String, List<String>>? get fieldErrors;
  String? get errorCode;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationErrorImplCopyWith<_$ValidationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$AuthErrorImplCopyWith(
          _$AuthErrorImpl value, $Res Function(_$AuthErrorImpl) then) =
      __$$AuthErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? errorCode, bool requiresReauth});
}

/// @nodoc
class __$$AuthErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$AuthErrorImpl>
    implements _$$AuthErrorImplCopyWith<$Res> {
  __$$AuthErrorImplCopyWithImpl(
      _$AuthErrorImpl _value, $Res Function(_$AuthErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? errorCode = freezed,
    Object? requiresReauth = null,
  }) {
    return _then(_$AuthErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      requiresReauth: null == requiresReauth
          ? _value.requiresReauth
          : requiresReauth // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthErrorImpl implements AuthError {
  const _$AuthErrorImpl(
      {required this.message, this.errorCode, this.requiresReauth = false});

  @override
  final String message;
  @override
  final String? errorCode;
  @override
  @JsonKey()
  final bool requiresReauth;

  @override
  String toString() {
    return 'AppError.authError(message: $message, errorCode: $errorCode, requiresReauth: $requiresReauth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.requiresReauth, requiresReauth) ||
                other.requiresReauth == requiresReauth));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, message, errorCode, requiresReauth);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      __$$AuthErrorImplCopyWithImpl<_$AuthErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? details, int? statusCode)
        networkError,
    required TResult Function(
            String message, String? details, int? statusCode, String? errorCode)
        serverError,
    required TResult Function(String message,
            Map<String, List<String>>? fieldErrors, String? errorCode)
        validationError,
    required TResult Function(
            String message, String? errorCode, bool requiresReauth)
        authError,
    required TResult Function(String message, String? requiredPermission)
        permissionError,
    required TResult Function(String message, String? resource) notFoundError,
    required TResult Function(String message, String? details) conflictError,
    required TResult Function(String message, int? retryAfterSeconds)
        rateLimitError,
    required TResult Function(String message, String? estimatedRestoreTime)
        maintenanceError,
    required TResult Function(
            String message, String? details, Object? originalError)
        unknownError,
    required TResult Function(String message, String? operation)
        localStorageError,
    required TResult Function(String message, String? permissionStatus)
        locationError,
    required TResult Function(String message, String? permissionStatus)
        cameraError,
    required TResult Function(String message, String? reason) biometricError,
  }) {
    return authError(message, errorCode, requiresReauth);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, int? statusCode)?
        networkError,
    TResult? Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult? Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult? Function(String message, String? requiredPermission)?
        permissionError,
    TResult? Function(String message, String? resource)? notFoundError,
    TResult? Function(String message, String? details)? conflictError,
    TResult? Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult? Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult? Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult? Function(String message, String? operation)? localStorageError,
    TResult? Function(String message, String? permissionStatus)? locationError,
    TResult? Function(String message, String? permissionStatus)? cameraError,
    TResult? Function(String message, String? reason)? biometricError,
  }) {
    return authError?.call(message, errorCode, requiresReauth);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, int? statusCode)?
        networkError,
    TResult Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult Function(String message, String? requiredPermission)?
        permissionError,
    TResult Function(String message, String? resource)? notFoundError,
    TResult Function(String message, String? details)? conflictError,
    TResult Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult Function(String message, String? operation)? localStorageError,
    TResult Function(String message, String? permissionStatus)? locationError,
    TResult Function(String message, String? permissionStatus)? cameraError,
    TResult Function(String message, String? reason)? biometricError,
    required TResult orElse(),
  }) {
    if (authError != null) {
      return authError(message, errorCode, requiresReauth);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(AuthError value) authError,
    required TResult Function(PermissionError value) permissionError,
    required TResult Function(NotFoundError value) notFoundError,
    required TResult Function(ConflictError value) conflictError,
    required TResult Function(RateLimitError value) rateLimitError,
    required TResult Function(MaintenanceError value) maintenanceError,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(LocalStorageError value) localStorageError,
    required TResult Function(LocationError value) locationError,
    required TResult Function(CameraError value) cameraError,
    required TResult Function(BiometricError value) biometricError,
  }) {
    return authError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(AuthError value)? authError,
    TResult? Function(PermissionError value)? permissionError,
    TResult? Function(NotFoundError value)? notFoundError,
    TResult? Function(ConflictError value)? conflictError,
    TResult? Function(RateLimitError value)? rateLimitError,
    TResult? Function(MaintenanceError value)? maintenanceError,
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(LocalStorageError value)? localStorageError,
    TResult? Function(LocationError value)? locationError,
    TResult? Function(CameraError value)? cameraError,
    TResult? Function(BiometricError value)? biometricError,
  }) {
    return authError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(AuthError value)? authError,
    TResult Function(PermissionError value)? permissionError,
    TResult Function(NotFoundError value)? notFoundError,
    TResult Function(ConflictError value)? conflictError,
    TResult Function(RateLimitError value)? rateLimitError,
    TResult Function(MaintenanceError value)? maintenanceError,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(LocalStorageError value)? localStorageError,
    TResult Function(LocationError value)? locationError,
    TResult Function(CameraError value)? cameraError,
    TResult Function(BiometricError value)? biometricError,
    required TResult orElse(),
  }) {
    if (authError != null) {
      return authError(this);
    }
    return orElse();
  }
}

abstract class AuthError implements AppError {
  const factory AuthError(
      {required final String message,
      final String? errorCode,
      final bool requiresReauth}) = _$AuthErrorImpl;

  @override
  String get message;
  String? get errorCode;
  bool get requiresReauth;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PermissionErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$PermissionErrorImplCopyWith(_$PermissionErrorImpl value,
          $Res Function(_$PermissionErrorImpl) then) =
      __$$PermissionErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? requiredPermission});
}

/// @nodoc
class __$$PermissionErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$PermissionErrorImpl>
    implements _$$PermissionErrorImplCopyWith<$Res> {
  __$$PermissionErrorImplCopyWithImpl(
      _$PermissionErrorImpl _value, $Res Function(_$PermissionErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? requiredPermission = freezed,
  }) {
    return _then(_$PermissionErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      requiredPermission: freezed == requiredPermission
          ? _value.requiredPermission
          : requiredPermission // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PermissionErrorImpl implements PermissionError {
  const _$PermissionErrorImpl({required this.message, this.requiredPermission});

  @override
  final String message;
  @override
  final String? requiredPermission;

  @override
  String toString() {
    return 'AppError.permissionError(message: $message, requiredPermission: $requiredPermission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requiredPermission, requiredPermission) ||
                other.requiredPermission == requiredPermission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, requiredPermission);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionErrorImplCopyWith<_$PermissionErrorImpl> get copyWith =>
      __$$PermissionErrorImplCopyWithImpl<_$PermissionErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? details, int? statusCode)
        networkError,
    required TResult Function(
            String message, String? details, int? statusCode, String? errorCode)
        serverError,
    required TResult Function(String message,
            Map<String, List<String>>? fieldErrors, String? errorCode)
        validationError,
    required TResult Function(
            String message, String? errorCode, bool requiresReauth)
        authError,
    required TResult Function(String message, String? requiredPermission)
        permissionError,
    required TResult Function(String message, String? resource) notFoundError,
    required TResult Function(String message, String? details) conflictError,
    required TResult Function(String message, int? retryAfterSeconds)
        rateLimitError,
    required TResult Function(String message, String? estimatedRestoreTime)
        maintenanceError,
    required TResult Function(
            String message, String? details, Object? originalError)
        unknownError,
    required TResult Function(String message, String? operation)
        localStorageError,
    required TResult Function(String message, String? permissionStatus)
        locationError,
    required TResult Function(String message, String? permissionStatus)
        cameraError,
    required TResult Function(String message, String? reason) biometricError,
  }) {
    return permissionError(message, requiredPermission);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, int? statusCode)?
        networkError,
    TResult? Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult? Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult? Function(String message, String? requiredPermission)?
        permissionError,
    TResult? Function(String message, String? resource)? notFoundError,
    TResult? Function(String message, String? details)? conflictError,
    TResult? Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult? Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult? Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult? Function(String message, String? operation)? localStorageError,
    TResult? Function(String message, String? permissionStatus)? locationError,
    TResult? Function(String message, String? permissionStatus)? cameraError,
    TResult? Function(String message, String? reason)? biometricError,
  }) {
    return permissionError?.call(message, requiredPermission);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, int? statusCode)?
        networkError,
    TResult Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult Function(String message, String? requiredPermission)?
        permissionError,
    TResult Function(String message, String? resource)? notFoundError,
    TResult Function(String message, String? details)? conflictError,
    TResult Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult Function(String message, String? operation)? localStorageError,
    TResult Function(String message, String? permissionStatus)? locationError,
    TResult Function(String message, String? permissionStatus)? cameraError,
    TResult Function(String message, String? reason)? biometricError,
    required TResult orElse(),
  }) {
    if (permissionError != null) {
      return permissionError(message, requiredPermission);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(AuthError value) authError,
    required TResult Function(PermissionError value) permissionError,
    required TResult Function(NotFoundError value) notFoundError,
    required TResult Function(ConflictError value) conflictError,
    required TResult Function(RateLimitError value) rateLimitError,
    required TResult Function(MaintenanceError value) maintenanceError,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(LocalStorageError value) localStorageError,
    required TResult Function(LocationError value) locationError,
    required TResult Function(CameraError value) cameraError,
    required TResult Function(BiometricError value) biometricError,
  }) {
    return permissionError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(AuthError value)? authError,
    TResult? Function(PermissionError value)? permissionError,
    TResult? Function(NotFoundError value)? notFoundError,
    TResult? Function(ConflictError value)? conflictError,
    TResult? Function(RateLimitError value)? rateLimitError,
    TResult? Function(MaintenanceError value)? maintenanceError,
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(LocalStorageError value)? localStorageError,
    TResult? Function(LocationError value)? locationError,
    TResult? Function(CameraError value)? cameraError,
    TResult? Function(BiometricError value)? biometricError,
  }) {
    return permissionError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(AuthError value)? authError,
    TResult Function(PermissionError value)? permissionError,
    TResult Function(NotFoundError value)? notFoundError,
    TResult Function(ConflictError value)? conflictError,
    TResult Function(RateLimitError value)? rateLimitError,
    TResult Function(MaintenanceError value)? maintenanceError,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(LocalStorageError value)? localStorageError,
    TResult Function(LocationError value)? locationError,
    TResult Function(CameraError value)? cameraError,
    TResult Function(BiometricError value)? biometricError,
    required TResult orElse(),
  }) {
    if (permissionError != null) {
      return permissionError(this);
    }
    return orElse();
  }
}

abstract class PermissionError implements AppError {
  const factory PermissionError(
      {required final String message,
      final String? requiredPermission}) = _$PermissionErrorImpl;

  @override
  String get message;
  String? get requiredPermission;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionErrorImplCopyWith<_$PermissionErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$NotFoundErrorImplCopyWith(
          _$NotFoundErrorImpl value, $Res Function(_$NotFoundErrorImpl) then) =
      __$$NotFoundErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? resource});
}

/// @nodoc
class __$$NotFoundErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$NotFoundErrorImpl>
    implements _$$NotFoundErrorImplCopyWith<$Res> {
  __$$NotFoundErrorImplCopyWithImpl(
      _$NotFoundErrorImpl _value, $Res Function(_$NotFoundErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? resource = freezed,
  }) {
    return _then(_$NotFoundErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      resource: freezed == resource
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NotFoundErrorImpl implements NotFoundError {
  const _$NotFoundErrorImpl({required this.message, this.resource});

  @override
  final String message;
  @override
  final String? resource;

  @override
  String toString() {
    return 'AppError.notFoundError(message: $message, resource: $resource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.resource, resource) ||
                other.resource == resource));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, resource);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundErrorImplCopyWith<_$NotFoundErrorImpl> get copyWith =>
      __$$NotFoundErrorImplCopyWithImpl<_$NotFoundErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? details, int? statusCode)
        networkError,
    required TResult Function(
            String message, String? details, int? statusCode, String? errorCode)
        serverError,
    required TResult Function(String message,
            Map<String, List<String>>? fieldErrors, String? errorCode)
        validationError,
    required TResult Function(
            String message, String? errorCode, bool requiresReauth)
        authError,
    required TResult Function(String message, String? requiredPermission)
        permissionError,
    required TResult Function(String message, String? resource) notFoundError,
    required TResult Function(String message, String? details) conflictError,
    required TResult Function(String message, int? retryAfterSeconds)
        rateLimitError,
    required TResult Function(String message, String? estimatedRestoreTime)
        maintenanceError,
    required TResult Function(
            String message, String? details, Object? originalError)
        unknownError,
    required TResult Function(String message, String? operation)
        localStorageError,
    required TResult Function(String message, String? permissionStatus)
        locationError,
    required TResult Function(String message, String? permissionStatus)
        cameraError,
    required TResult Function(String message, String? reason) biometricError,
  }) {
    return notFoundError(message, resource);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, int? statusCode)?
        networkError,
    TResult? Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult? Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult? Function(String message, String? requiredPermission)?
        permissionError,
    TResult? Function(String message, String? resource)? notFoundError,
    TResult? Function(String message, String? details)? conflictError,
    TResult? Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult? Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult? Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult? Function(String message, String? operation)? localStorageError,
    TResult? Function(String message, String? permissionStatus)? locationError,
    TResult? Function(String message, String? permissionStatus)? cameraError,
    TResult? Function(String message, String? reason)? biometricError,
  }) {
    return notFoundError?.call(message, resource);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, int? statusCode)?
        networkError,
    TResult Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult Function(String message, String? requiredPermission)?
        permissionError,
    TResult Function(String message, String? resource)? notFoundError,
    TResult Function(String message, String? details)? conflictError,
    TResult Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult Function(String message, String? operation)? localStorageError,
    TResult Function(String message, String? permissionStatus)? locationError,
    TResult Function(String message, String? permissionStatus)? cameraError,
    TResult Function(String message, String? reason)? biometricError,
    required TResult orElse(),
  }) {
    if (notFoundError != null) {
      return notFoundError(message, resource);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(AuthError value) authError,
    required TResult Function(PermissionError value) permissionError,
    required TResult Function(NotFoundError value) notFoundError,
    required TResult Function(ConflictError value) conflictError,
    required TResult Function(RateLimitError value) rateLimitError,
    required TResult Function(MaintenanceError value) maintenanceError,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(LocalStorageError value) localStorageError,
    required TResult Function(LocationError value) locationError,
    required TResult Function(CameraError value) cameraError,
    required TResult Function(BiometricError value) biometricError,
  }) {
    return notFoundError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(AuthError value)? authError,
    TResult? Function(PermissionError value)? permissionError,
    TResult? Function(NotFoundError value)? notFoundError,
    TResult? Function(ConflictError value)? conflictError,
    TResult? Function(RateLimitError value)? rateLimitError,
    TResult? Function(MaintenanceError value)? maintenanceError,
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(LocalStorageError value)? localStorageError,
    TResult? Function(LocationError value)? locationError,
    TResult? Function(CameraError value)? cameraError,
    TResult? Function(BiometricError value)? biometricError,
  }) {
    return notFoundError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(AuthError value)? authError,
    TResult Function(PermissionError value)? permissionError,
    TResult Function(NotFoundError value)? notFoundError,
    TResult Function(ConflictError value)? conflictError,
    TResult Function(RateLimitError value)? rateLimitError,
    TResult Function(MaintenanceError value)? maintenanceError,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(LocalStorageError value)? localStorageError,
    TResult Function(LocationError value)? locationError,
    TResult Function(CameraError value)? cameraError,
    TResult Function(BiometricError value)? biometricError,
    required TResult orElse(),
  }) {
    if (notFoundError != null) {
      return notFoundError(this);
    }
    return orElse();
  }
}

abstract class NotFoundError implements AppError {
  const factory NotFoundError(
      {required final String message,
      final String? resource}) = _$NotFoundErrorImpl;

  @override
  String get message;
  String? get resource;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundErrorImplCopyWith<_$NotFoundErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConflictErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$ConflictErrorImplCopyWith(
          _$ConflictErrorImpl value, $Res Function(_$ConflictErrorImpl) then) =
      __$$ConflictErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? details});
}

/// @nodoc
class __$$ConflictErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$ConflictErrorImpl>
    implements _$$ConflictErrorImplCopyWith<$Res> {
  __$$ConflictErrorImplCopyWithImpl(
      _$ConflictErrorImpl _value, $Res Function(_$ConflictErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? details = freezed,
  }) {
    return _then(_$ConflictErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ConflictErrorImpl implements ConflictError {
  const _$ConflictErrorImpl({required this.message, this.details});

  @override
  final String message;
  @override
  final String? details;

  @override
  String toString() {
    return 'AppError.conflictError(message: $message, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConflictErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, details);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConflictErrorImplCopyWith<_$ConflictErrorImpl> get copyWith =>
      __$$ConflictErrorImplCopyWithImpl<_$ConflictErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? details, int? statusCode)
        networkError,
    required TResult Function(
            String message, String? details, int? statusCode, String? errorCode)
        serverError,
    required TResult Function(String message,
            Map<String, List<String>>? fieldErrors, String? errorCode)
        validationError,
    required TResult Function(
            String message, String? errorCode, bool requiresReauth)
        authError,
    required TResult Function(String message, String? requiredPermission)
        permissionError,
    required TResult Function(String message, String? resource) notFoundError,
    required TResult Function(String message, String? details) conflictError,
    required TResult Function(String message, int? retryAfterSeconds)
        rateLimitError,
    required TResult Function(String message, String? estimatedRestoreTime)
        maintenanceError,
    required TResult Function(
            String message, String? details, Object? originalError)
        unknownError,
    required TResult Function(String message, String? operation)
        localStorageError,
    required TResult Function(String message, String? permissionStatus)
        locationError,
    required TResult Function(String message, String? permissionStatus)
        cameraError,
    required TResult Function(String message, String? reason) biometricError,
  }) {
    return conflictError(message, details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, int? statusCode)?
        networkError,
    TResult? Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult? Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult? Function(String message, String? requiredPermission)?
        permissionError,
    TResult? Function(String message, String? resource)? notFoundError,
    TResult? Function(String message, String? details)? conflictError,
    TResult? Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult? Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult? Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult? Function(String message, String? operation)? localStorageError,
    TResult? Function(String message, String? permissionStatus)? locationError,
    TResult? Function(String message, String? permissionStatus)? cameraError,
    TResult? Function(String message, String? reason)? biometricError,
  }) {
    return conflictError?.call(message, details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, int? statusCode)?
        networkError,
    TResult Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult Function(String message, String? requiredPermission)?
        permissionError,
    TResult Function(String message, String? resource)? notFoundError,
    TResult Function(String message, String? details)? conflictError,
    TResult Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult Function(String message, String? operation)? localStorageError,
    TResult Function(String message, String? permissionStatus)? locationError,
    TResult Function(String message, String? permissionStatus)? cameraError,
    TResult Function(String message, String? reason)? biometricError,
    required TResult orElse(),
  }) {
    if (conflictError != null) {
      return conflictError(message, details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(AuthError value) authError,
    required TResult Function(PermissionError value) permissionError,
    required TResult Function(NotFoundError value) notFoundError,
    required TResult Function(ConflictError value) conflictError,
    required TResult Function(RateLimitError value) rateLimitError,
    required TResult Function(MaintenanceError value) maintenanceError,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(LocalStorageError value) localStorageError,
    required TResult Function(LocationError value) locationError,
    required TResult Function(CameraError value) cameraError,
    required TResult Function(BiometricError value) biometricError,
  }) {
    return conflictError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(AuthError value)? authError,
    TResult? Function(PermissionError value)? permissionError,
    TResult? Function(NotFoundError value)? notFoundError,
    TResult? Function(ConflictError value)? conflictError,
    TResult? Function(RateLimitError value)? rateLimitError,
    TResult? Function(MaintenanceError value)? maintenanceError,
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(LocalStorageError value)? localStorageError,
    TResult? Function(LocationError value)? locationError,
    TResult? Function(CameraError value)? cameraError,
    TResult? Function(BiometricError value)? biometricError,
  }) {
    return conflictError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(AuthError value)? authError,
    TResult Function(PermissionError value)? permissionError,
    TResult Function(NotFoundError value)? notFoundError,
    TResult Function(ConflictError value)? conflictError,
    TResult Function(RateLimitError value)? rateLimitError,
    TResult Function(MaintenanceError value)? maintenanceError,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(LocalStorageError value)? localStorageError,
    TResult Function(LocationError value)? locationError,
    TResult Function(CameraError value)? cameraError,
    TResult Function(BiometricError value)? biometricError,
    required TResult orElse(),
  }) {
    if (conflictError != null) {
      return conflictError(this);
    }
    return orElse();
  }
}

abstract class ConflictError implements AppError {
  const factory ConflictError(
      {required final String message,
      final String? details}) = _$ConflictErrorImpl;

  @override
  String get message;
  String? get details;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConflictErrorImplCopyWith<_$ConflictErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RateLimitErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$RateLimitErrorImplCopyWith(_$RateLimitErrorImpl value,
          $Res Function(_$RateLimitErrorImpl) then) =
      __$$RateLimitErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int? retryAfterSeconds});
}

/// @nodoc
class __$$RateLimitErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$RateLimitErrorImpl>
    implements _$$RateLimitErrorImplCopyWith<$Res> {
  __$$RateLimitErrorImplCopyWithImpl(
      _$RateLimitErrorImpl _value, $Res Function(_$RateLimitErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? retryAfterSeconds = freezed,
  }) {
    return _then(_$RateLimitErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      retryAfterSeconds: freezed == retryAfterSeconds
          ? _value.retryAfterSeconds
          : retryAfterSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$RateLimitErrorImpl implements RateLimitError {
  const _$RateLimitErrorImpl({required this.message, this.retryAfterSeconds});

  @override
  final String message;
  @override
  final int? retryAfterSeconds;

  @override
  String toString() {
    return 'AppError.rateLimitError(message: $message, retryAfterSeconds: $retryAfterSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RateLimitErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.retryAfterSeconds, retryAfterSeconds) ||
                other.retryAfterSeconds == retryAfterSeconds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, retryAfterSeconds);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RateLimitErrorImplCopyWith<_$RateLimitErrorImpl> get copyWith =>
      __$$RateLimitErrorImplCopyWithImpl<_$RateLimitErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? details, int? statusCode)
        networkError,
    required TResult Function(
            String message, String? details, int? statusCode, String? errorCode)
        serverError,
    required TResult Function(String message,
            Map<String, List<String>>? fieldErrors, String? errorCode)
        validationError,
    required TResult Function(
            String message, String? errorCode, bool requiresReauth)
        authError,
    required TResult Function(String message, String? requiredPermission)
        permissionError,
    required TResult Function(String message, String? resource) notFoundError,
    required TResult Function(String message, String? details) conflictError,
    required TResult Function(String message, int? retryAfterSeconds)
        rateLimitError,
    required TResult Function(String message, String? estimatedRestoreTime)
        maintenanceError,
    required TResult Function(
            String message, String? details, Object? originalError)
        unknownError,
    required TResult Function(String message, String? operation)
        localStorageError,
    required TResult Function(String message, String? permissionStatus)
        locationError,
    required TResult Function(String message, String? permissionStatus)
        cameraError,
    required TResult Function(String message, String? reason) biometricError,
  }) {
    return rateLimitError(message, retryAfterSeconds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, int? statusCode)?
        networkError,
    TResult? Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult? Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult? Function(String message, String? requiredPermission)?
        permissionError,
    TResult? Function(String message, String? resource)? notFoundError,
    TResult? Function(String message, String? details)? conflictError,
    TResult? Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult? Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult? Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult? Function(String message, String? operation)? localStorageError,
    TResult? Function(String message, String? permissionStatus)? locationError,
    TResult? Function(String message, String? permissionStatus)? cameraError,
    TResult? Function(String message, String? reason)? biometricError,
  }) {
    return rateLimitError?.call(message, retryAfterSeconds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, int? statusCode)?
        networkError,
    TResult Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult Function(String message, String? requiredPermission)?
        permissionError,
    TResult Function(String message, String? resource)? notFoundError,
    TResult Function(String message, String? details)? conflictError,
    TResult Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult Function(String message, String? operation)? localStorageError,
    TResult Function(String message, String? permissionStatus)? locationError,
    TResult Function(String message, String? permissionStatus)? cameraError,
    TResult Function(String message, String? reason)? biometricError,
    required TResult orElse(),
  }) {
    if (rateLimitError != null) {
      return rateLimitError(message, retryAfterSeconds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(AuthError value) authError,
    required TResult Function(PermissionError value) permissionError,
    required TResult Function(NotFoundError value) notFoundError,
    required TResult Function(ConflictError value) conflictError,
    required TResult Function(RateLimitError value) rateLimitError,
    required TResult Function(MaintenanceError value) maintenanceError,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(LocalStorageError value) localStorageError,
    required TResult Function(LocationError value) locationError,
    required TResult Function(CameraError value) cameraError,
    required TResult Function(BiometricError value) biometricError,
  }) {
    return rateLimitError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(AuthError value)? authError,
    TResult? Function(PermissionError value)? permissionError,
    TResult? Function(NotFoundError value)? notFoundError,
    TResult? Function(ConflictError value)? conflictError,
    TResult? Function(RateLimitError value)? rateLimitError,
    TResult? Function(MaintenanceError value)? maintenanceError,
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(LocalStorageError value)? localStorageError,
    TResult? Function(LocationError value)? locationError,
    TResult? Function(CameraError value)? cameraError,
    TResult? Function(BiometricError value)? biometricError,
  }) {
    return rateLimitError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(AuthError value)? authError,
    TResult Function(PermissionError value)? permissionError,
    TResult Function(NotFoundError value)? notFoundError,
    TResult Function(ConflictError value)? conflictError,
    TResult Function(RateLimitError value)? rateLimitError,
    TResult Function(MaintenanceError value)? maintenanceError,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(LocalStorageError value)? localStorageError,
    TResult Function(LocationError value)? locationError,
    TResult Function(CameraError value)? cameraError,
    TResult Function(BiometricError value)? biometricError,
    required TResult orElse(),
  }) {
    if (rateLimitError != null) {
      return rateLimitError(this);
    }
    return orElse();
  }
}

abstract class RateLimitError implements AppError {
  const factory RateLimitError(
      {required final String message,
      final int? retryAfterSeconds}) = _$RateLimitErrorImpl;

  @override
  String get message;
  int? get retryAfterSeconds;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RateLimitErrorImplCopyWith<_$RateLimitErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MaintenanceErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$MaintenanceErrorImplCopyWith(_$MaintenanceErrorImpl value,
          $Res Function(_$MaintenanceErrorImpl) then) =
      __$$MaintenanceErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? estimatedRestoreTime});
}

/// @nodoc
class __$$MaintenanceErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$MaintenanceErrorImpl>
    implements _$$MaintenanceErrorImplCopyWith<$Res> {
  __$$MaintenanceErrorImplCopyWithImpl(_$MaintenanceErrorImpl _value,
      $Res Function(_$MaintenanceErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? estimatedRestoreTime = freezed,
  }) {
    return _then(_$MaintenanceErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedRestoreTime: freezed == estimatedRestoreTime
          ? _value.estimatedRestoreTime
          : estimatedRestoreTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MaintenanceErrorImpl implements MaintenanceError {
  const _$MaintenanceErrorImpl(
      {required this.message, this.estimatedRestoreTime});

  @override
  final String message;
  @override
  final String? estimatedRestoreTime;

  @override
  String toString() {
    return 'AppError.maintenanceError(message: $message, estimatedRestoreTime: $estimatedRestoreTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaintenanceErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.estimatedRestoreTime, estimatedRestoreTime) ||
                other.estimatedRestoreTime == estimatedRestoreTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, estimatedRestoreTime);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaintenanceErrorImplCopyWith<_$MaintenanceErrorImpl> get copyWith =>
      __$$MaintenanceErrorImplCopyWithImpl<_$MaintenanceErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? details, int? statusCode)
        networkError,
    required TResult Function(
            String message, String? details, int? statusCode, String? errorCode)
        serverError,
    required TResult Function(String message,
            Map<String, List<String>>? fieldErrors, String? errorCode)
        validationError,
    required TResult Function(
            String message, String? errorCode, bool requiresReauth)
        authError,
    required TResult Function(String message, String? requiredPermission)
        permissionError,
    required TResult Function(String message, String? resource) notFoundError,
    required TResult Function(String message, String? details) conflictError,
    required TResult Function(String message, int? retryAfterSeconds)
        rateLimitError,
    required TResult Function(String message, String? estimatedRestoreTime)
        maintenanceError,
    required TResult Function(
            String message, String? details, Object? originalError)
        unknownError,
    required TResult Function(String message, String? operation)
        localStorageError,
    required TResult Function(String message, String? permissionStatus)
        locationError,
    required TResult Function(String message, String? permissionStatus)
        cameraError,
    required TResult Function(String message, String? reason) biometricError,
  }) {
    return maintenanceError(message, estimatedRestoreTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, int? statusCode)?
        networkError,
    TResult? Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult? Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult? Function(String message, String? requiredPermission)?
        permissionError,
    TResult? Function(String message, String? resource)? notFoundError,
    TResult? Function(String message, String? details)? conflictError,
    TResult? Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult? Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult? Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult? Function(String message, String? operation)? localStorageError,
    TResult? Function(String message, String? permissionStatus)? locationError,
    TResult? Function(String message, String? permissionStatus)? cameraError,
    TResult? Function(String message, String? reason)? biometricError,
  }) {
    return maintenanceError?.call(message, estimatedRestoreTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, int? statusCode)?
        networkError,
    TResult Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult Function(String message, String? requiredPermission)?
        permissionError,
    TResult Function(String message, String? resource)? notFoundError,
    TResult Function(String message, String? details)? conflictError,
    TResult Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult Function(String message, String? operation)? localStorageError,
    TResult Function(String message, String? permissionStatus)? locationError,
    TResult Function(String message, String? permissionStatus)? cameraError,
    TResult Function(String message, String? reason)? biometricError,
    required TResult orElse(),
  }) {
    if (maintenanceError != null) {
      return maintenanceError(message, estimatedRestoreTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(AuthError value) authError,
    required TResult Function(PermissionError value) permissionError,
    required TResult Function(NotFoundError value) notFoundError,
    required TResult Function(ConflictError value) conflictError,
    required TResult Function(RateLimitError value) rateLimitError,
    required TResult Function(MaintenanceError value) maintenanceError,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(LocalStorageError value) localStorageError,
    required TResult Function(LocationError value) locationError,
    required TResult Function(CameraError value) cameraError,
    required TResult Function(BiometricError value) biometricError,
  }) {
    return maintenanceError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(AuthError value)? authError,
    TResult? Function(PermissionError value)? permissionError,
    TResult? Function(NotFoundError value)? notFoundError,
    TResult? Function(ConflictError value)? conflictError,
    TResult? Function(RateLimitError value)? rateLimitError,
    TResult? Function(MaintenanceError value)? maintenanceError,
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(LocalStorageError value)? localStorageError,
    TResult? Function(LocationError value)? locationError,
    TResult? Function(CameraError value)? cameraError,
    TResult? Function(BiometricError value)? biometricError,
  }) {
    return maintenanceError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(AuthError value)? authError,
    TResult Function(PermissionError value)? permissionError,
    TResult Function(NotFoundError value)? notFoundError,
    TResult Function(ConflictError value)? conflictError,
    TResult Function(RateLimitError value)? rateLimitError,
    TResult Function(MaintenanceError value)? maintenanceError,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(LocalStorageError value)? localStorageError,
    TResult Function(LocationError value)? locationError,
    TResult Function(CameraError value)? cameraError,
    TResult Function(BiometricError value)? biometricError,
    required TResult orElse(),
  }) {
    if (maintenanceError != null) {
      return maintenanceError(this);
    }
    return orElse();
  }
}

abstract class MaintenanceError implements AppError {
  const factory MaintenanceError(
      {required final String message,
      final String? estimatedRestoreTime}) = _$MaintenanceErrorImpl;

  @override
  String get message;
  String? get estimatedRestoreTime;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaintenanceErrorImplCopyWith<_$MaintenanceErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$UnknownErrorImplCopyWith(
          _$UnknownErrorImpl value, $Res Function(_$UnknownErrorImpl) then) =
      __$$UnknownErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? details, Object? originalError});
}

/// @nodoc
class __$$UnknownErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$UnknownErrorImpl>
    implements _$$UnknownErrorImplCopyWith<$Res> {
  __$$UnknownErrorImplCopyWithImpl(
      _$UnknownErrorImpl _value, $Res Function(_$UnknownErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? details = freezed,
    Object? originalError = freezed,
  }) {
    return _then(_$UnknownErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      originalError:
          freezed == originalError ? _value.originalError : originalError,
    ));
  }
}

/// @nodoc

class _$UnknownErrorImpl implements UnknownError {
  const _$UnknownErrorImpl(
      {required this.message, this.details, this.originalError});

  @override
  final String message;
  @override
  final String? details;
  @override
  final Object? originalError;

  @override
  String toString() {
    return 'AppError.unknownError(message: $message, details: $details, originalError: $originalError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details) &&
            const DeepCollectionEquality()
                .equals(other.originalError, originalError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, details,
      const DeepCollectionEquality().hash(originalError));

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownErrorImplCopyWith<_$UnknownErrorImpl> get copyWith =>
      __$$UnknownErrorImplCopyWithImpl<_$UnknownErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? details, int? statusCode)
        networkError,
    required TResult Function(
            String message, String? details, int? statusCode, String? errorCode)
        serverError,
    required TResult Function(String message,
            Map<String, List<String>>? fieldErrors, String? errorCode)
        validationError,
    required TResult Function(
            String message, String? errorCode, bool requiresReauth)
        authError,
    required TResult Function(String message, String? requiredPermission)
        permissionError,
    required TResult Function(String message, String? resource) notFoundError,
    required TResult Function(String message, String? details) conflictError,
    required TResult Function(String message, int? retryAfterSeconds)
        rateLimitError,
    required TResult Function(String message, String? estimatedRestoreTime)
        maintenanceError,
    required TResult Function(
            String message, String? details, Object? originalError)
        unknownError,
    required TResult Function(String message, String? operation)
        localStorageError,
    required TResult Function(String message, String? permissionStatus)
        locationError,
    required TResult Function(String message, String? permissionStatus)
        cameraError,
    required TResult Function(String message, String? reason) biometricError,
  }) {
    return unknownError(message, details, originalError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, int? statusCode)?
        networkError,
    TResult? Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult? Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult? Function(String message, String? requiredPermission)?
        permissionError,
    TResult? Function(String message, String? resource)? notFoundError,
    TResult? Function(String message, String? details)? conflictError,
    TResult? Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult? Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult? Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult? Function(String message, String? operation)? localStorageError,
    TResult? Function(String message, String? permissionStatus)? locationError,
    TResult? Function(String message, String? permissionStatus)? cameraError,
    TResult? Function(String message, String? reason)? biometricError,
  }) {
    return unknownError?.call(message, details, originalError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, int? statusCode)?
        networkError,
    TResult Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult Function(String message, String? requiredPermission)?
        permissionError,
    TResult Function(String message, String? resource)? notFoundError,
    TResult Function(String message, String? details)? conflictError,
    TResult Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult Function(String message, String? operation)? localStorageError,
    TResult Function(String message, String? permissionStatus)? locationError,
    TResult Function(String message, String? permissionStatus)? cameraError,
    TResult Function(String message, String? reason)? biometricError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(message, details, originalError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(AuthError value) authError,
    required TResult Function(PermissionError value) permissionError,
    required TResult Function(NotFoundError value) notFoundError,
    required TResult Function(ConflictError value) conflictError,
    required TResult Function(RateLimitError value) rateLimitError,
    required TResult Function(MaintenanceError value) maintenanceError,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(LocalStorageError value) localStorageError,
    required TResult Function(LocationError value) locationError,
    required TResult Function(CameraError value) cameraError,
    required TResult Function(BiometricError value) biometricError,
  }) {
    return unknownError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(AuthError value)? authError,
    TResult? Function(PermissionError value)? permissionError,
    TResult? Function(NotFoundError value)? notFoundError,
    TResult? Function(ConflictError value)? conflictError,
    TResult? Function(RateLimitError value)? rateLimitError,
    TResult? Function(MaintenanceError value)? maintenanceError,
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(LocalStorageError value)? localStorageError,
    TResult? Function(LocationError value)? locationError,
    TResult? Function(CameraError value)? cameraError,
    TResult? Function(BiometricError value)? biometricError,
  }) {
    return unknownError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(AuthError value)? authError,
    TResult Function(PermissionError value)? permissionError,
    TResult Function(NotFoundError value)? notFoundError,
    TResult Function(ConflictError value)? conflictError,
    TResult Function(RateLimitError value)? rateLimitError,
    TResult Function(MaintenanceError value)? maintenanceError,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(LocalStorageError value)? localStorageError,
    TResult Function(LocationError value)? locationError,
    TResult Function(CameraError value)? cameraError,
    TResult Function(BiometricError value)? biometricError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(this);
    }
    return orElse();
  }
}

abstract class UnknownError implements AppError {
  const factory UnknownError(
      {required final String message,
      final String? details,
      final Object? originalError}) = _$UnknownErrorImpl;

  @override
  String get message;
  String? get details;
  Object? get originalError;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownErrorImplCopyWith<_$UnknownErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocalStorageErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$LocalStorageErrorImplCopyWith(_$LocalStorageErrorImpl value,
          $Res Function(_$LocalStorageErrorImpl) then) =
      __$$LocalStorageErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? operation});
}

/// @nodoc
class __$$LocalStorageErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$LocalStorageErrorImpl>
    implements _$$LocalStorageErrorImplCopyWith<$Res> {
  __$$LocalStorageErrorImplCopyWithImpl(_$LocalStorageErrorImpl _value,
      $Res Function(_$LocalStorageErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? operation = freezed,
  }) {
    return _then(_$LocalStorageErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      operation: freezed == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LocalStorageErrorImpl implements LocalStorageError {
  const _$LocalStorageErrorImpl({required this.message, this.operation});

  @override
  final String message;
  @override
  final String? operation;

  @override
  String toString() {
    return 'AppError.localStorageError(message: $message, operation: $operation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalStorageErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.operation, operation) ||
                other.operation == operation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, operation);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalStorageErrorImplCopyWith<_$LocalStorageErrorImpl> get copyWith =>
      __$$LocalStorageErrorImplCopyWithImpl<_$LocalStorageErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? details, int? statusCode)
        networkError,
    required TResult Function(
            String message, String? details, int? statusCode, String? errorCode)
        serverError,
    required TResult Function(String message,
            Map<String, List<String>>? fieldErrors, String? errorCode)
        validationError,
    required TResult Function(
            String message, String? errorCode, bool requiresReauth)
        authError,
    required TResult Function(String message, String? requiredPermission)
        permissionError,
    required TResult Function(String message, String? resource) notFoundError,
    required TResult Function(String message, String? details) conflictError,
    required TResult Function(String message, int? retryAfterSeconds)
        rateLimitError,
    required TResult Function(String message, String? estimatedRestoreTime)
        maintenanceError,
    required TResult Function(
            String message, String? details, Object? originalError)
        unknownError,
    required TResult Function(String message, String? operation)
        localStorageError,
    required TResult Function(String message, String? permissionStatus)
        locationError,
    required TResult Function(String message, String? permissionStatus)
        cameraError,
    required TResult Function(String message, String? reason) biometricError,
  }) {
    return localStorageError(message, operation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, int? statusCode)?
        networkError,
    TResult? Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult? Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult? Function(String message, String? requiredPermission)?
        permissionError,
    TResult? Function(String message, String? resource)? notFoundError,
    TResult? Function(String message, String? details)? conflictError,
    TResult? Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult? Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult? Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult? Function(String message, String? operation)? localStorageError,
    TResult? Function(String message, String? permissionStatus)? locationError,
    TResult? Function(String message, String? permissionStatus)? cameraError,
    TResult? Function(String message, String? reason)? biometricError,
  }) {
    return localStorageError?.call(message, operation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, int? statusCode)?
        networkError,
    TResult Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult Function(String message, String? requiredPermission)?
        permissionError,
    TResult Function(String message, String? resource)? notFoundError,
    TResult Function(String message, String? details)? conflictError,
    TResult Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult Function(String message, String? operation)? localStorageError,
    TResult Function(String message, String? permissionStatus)? locationError,
    TResult Function(String message, String? permissionStatus)? cameraError,
    TResult Function(String message, String? reason)? biometricError,
    required TResult orElse(),
  }) {
    if (localStorageError != null) {
      return localStorageError(message, operation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(AuthError value) authError,
    required TResult Function(PermissionError value) permissionError,
    required TResult Function(NotFoundError value) notFoundError,
    required TResult Function(ConflictError value) conflictError,
    required TResult Function(RateLimitError value) rateLimitError,
    required TResult Function(MaintenanceError value) maintenanceError,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(LocalStorageError value) localStorageError,
    required TResult Function(LocationError value) locationError,
    required TResult Function(CameraError value) cameraError,
    required TResult Function(BiometricError value) biometricError,
  }) {
    return localStorageError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(AuthError value)? authError,
    TResult? Function(PermissionError value)? permissionError,
    TResult? Function(NotFoundError value)? notFoundError,
    TResult? Function(ConflictError value)? conflictError,
    TResult? Function(RateLimitError value)? rateLimitError,
    TResult? Function(MaintenanceError value)? maintenanceError,
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(LocalStorageError value)? localStorageError,
    TResult? Function(LocationError value)? locationError,
    TResult? Function(CameraError value)? cameraError,
    TResult? Function(BiometricError value)? biometricError,
  }) {
    return localStorageError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(AuthError value)? authError,
    TResult Function(PermissionError value)? permissionError,
    TResult Function(NotFoundError value)? notFoundError,
    TResult Function(ConflictError value)? conflictError,
    TResult Function(RateLimitError value)? rateLimitError,
    TResult Function(MaintenanceError value)? maintenanceError,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(LocalStorageError value)? localStorageError,
    TResult Function(LocationError value)? locationError,
    TResult Function(CameraError value)? cameraError,
    TResult Function(BiometricError value)? biometricError,
    required TResult orElse(),
  }) {
    if (localStorageError != null) {
      return localStorageError(this);
    }
    return orElse();
  }
}

abstract class LocalStorageError implements AppError {
  const factory LocalStorageError(
      {required final String message,
      final String? operation}) = _$LocalStorageErrorImpl;

  @override
  String get message;
  String? get operation;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalStorageErrorImplCopyWith<_$LocalStorageErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$LocationErrorImplCopyWith(
          _$LocationErrorImpl value, $Res Function(_$LocationErrorImpl) then) =
      __$$LocationErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? permissionStatus});
}

/// @nodoc
class __$$LocationErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$LocationErrorImpl>
    implements _$$LocationErrorImplCopyWith<$Res> {
  __$$LocationErrorImplCopyWithImpl(
      _$LocationErrorImpl _value, $Res Function(_$LocationErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? permissionStatus = freezed,
  }) {
    return _then(_$LocationErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      permissionStatus: freezed == permissionStatus
          ? _value.permissionStatus
          : permissionStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LocationErrorImpl implements LocationError {
  const _$LocationErrorImpl({required this.message, this.permissionStatus});

  @override
  final String message;
  @override
  final String? permissionStatus;

  @override
  String toString() {
    return 'AppError.locationError(message: $message, permissionStatus: $permissionStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.permissionStatus, permissionStatus) ||
                other.permissionStatus == permissionStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, permissionStatus);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationErrorImplCopyWith<_$LocationErrorImpl> get copyWith =>
      __$$LocationErrorImplCopyWithImpl<_$LocationErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? details, int? statusCode)
        networkError,
    required TResult Function(
            String message, String? details, int? statusCode, String? errorCode)
        serverError,
    required TResult Function(String message,
            Map<String, List<String>>? fieldErrors, String? errorCode)
        validationError,
    required TResult Function(
            String message, String? errorCode, bool requiresReauth)
        authError,
    required TResult Function(String message, String? requiredPermission)
        permissionError,
    required TResult Function(String message, String? resource) notFoundError,
    required TResult Function(String message, String? details) conflictError,
    required TResult Function(String message, int? retryAfterSeconds)
        rateLimitError,
    required TResult Function(String message, String? estimatedRestoreTime)
        maintenanceError,
    required TResult Function(
            String message, String? details, Object? originalError)
        unknownError,
    required TResult Function(String message, String? operation)
        localStorageError,
    required TResult Function(String message, String? permissionStatus)
        locationError,
    required TResult Function(String message, String? permissionStatus)
        cameraError,
    required TResult Function(String message, String? reason) biometricError,
  }) {
    return locationError(message, permissionStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, int? statusCode)?
        networkError,
    TResult? Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult? Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult? Function(String message, String? requiredPermission)?
        permissionError,
    TResult? Function(String message, String? resource)? notFoundError,
    TResult? Function(String message, String? details)? conflictError,
    TResult? Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult? Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult? Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult? Function(String message, String? operation)? localStorageError,
    TResult? Function(String message, String? permissionStatus)? locationError,
    TResult? Function(String message, String? permissionStatus)? cameraError,
    TResult? Function(String message, String? reason)? biometricError,
  }) {
    return locationError?.call(message, permissionStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, int? statusCode)?
        networkError,
    TResult Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult Function(String message, String? requiredPermission)?
        permissionError,
    TResult Function(String message, String? resource)? notFoundError,
    TResult Function(String message, String? details)? conflictError,
    TResult Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult Function(String message, String? operation)? localStorageError,
    TResult Function(String message, String? permissionStatus)? locationError,
    TResult Function(String message, String? permissionStatus)? cameraError,
    TResult Function(String message, String? reason)? biometricError,
    required TResult orElse(),
  }) {
    if (locationError != null) {
      return locationError(message, permissionStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(AuthError value) authError,
    required TResult Function(PermissionError value) permissionError,
    required TResult Function(NotFoundError value) notFoundError,
    required TResult Function(ConflictError value) conflictError,
    required TResult Function(RateLimitError value) rateLimitError,
    required TResult Function(MaintenanceError value) maintenanceError,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(LocalStorageError value) localStorageError,
    required TResult Function(LocationError value) locationError,
    required TResult Function(CameraError value) cameraError,
    required TResult Function(BiometricError value) biometricError,
  }) {
    return locationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(AuthError value)? authError,
    TResult? Function(PermissionError value)? permissionError,
    TResult? Function(NotFoundError value)? notFoundError,
    TResult? Function(ConflictError value)? conflictError,
    TResult? Function(RateLimitError value)? rateLimitError,
    TResult? Function(MaintenanceError value)? maintenanceError,
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(LocalStorageError value)? localStorageError,
    TResult? Function(LocationError value)? locationError,
    TResult? Function(CameraError value)? cameraError,
    TResult? Function(BiometricError value)? biometricError,
  }) {
    return locationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(AuthError value)? authError,
    TResult Function(PermissionError value)? permissionError,
    TResult Function(NotFoundError value)? notFoundError,
    TResult Function(ConflictError value)? conflictError,
    TResult Function(RateLimitError value)? rateLimitError,
    TResult Function(MaintenanceError value)? maintenanceError,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(LocalStorageError value)? localStorageError,
    TResult Function(LocationError value)? locationError,
    TResult Function(CameraError value)? cameraError,
    TResult Function(BiometricError value)? biometricError,
    required TResult orElse(),
  }) {
    if (locationError != null) {
      return locationError(this);
    }
    return orElse();
  }
}

abstract class LocationError implements AppError {
  const factory LocationError(
      {required final String message,
      final String? permissionStatus}) = _$LocationErrorImpl;

  @override
  String get message;
  String? get permissionStatus;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationErrorImplCopyWith<_$LocationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CameraErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$CameraErrorImplCopyWith(
          _$CameraErrorImpl value, $Res Function(_$CameraErrorImpl) then) =
      __$$CameraErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? permissionStatus});
}

/// @nodoc
class __$$CameraErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$CameraErrorImpl>
    implements _$$CameraErrorImplCopyWith<$Res> {
  __$$CameraErrorImplCopyWithImpl(
      _$CameraErrorImpl _value, $Res Function(_$CameraErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? permissionStatus = freezed,
  }) {
    return _then(_$CameraErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      permissionStatus: freezed == permissionStatus
          ? _value.permissionStatus
          : permissionStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CameraErrorImpl implements CameraError {
  const _$CameraErrorImpl({required this.message, this.permissionStatus});

  @override
  final String message;
  @override
  final String? permissionStatus;

  @override
  String toString() {
    return 'AppError.cameraError(message: $message, permissionStatus: $permissionStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.permissionStatus, permissionStatus) ||
                other.permissionStatus == permissionStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, permissionStatus);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraErrorImplCopyWith<_$CameraErrorImpl> get copyWith =>
      __$$CameraErrorImplCopyWithImpl<_$CameraErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? details, int? statusCode)
        networkError,
    required TResult Function(
            String message, String? details, int? statusCode, String? errorCode)
        serverError,
    required TResult Function(String message,
            Map<String, List<String>>? fieldErrors, String? errorCode)
        validationError,
    required TResult Function(
            String message, String? errorCode, bool requiresReauth)
        authError,
    required TResult Function(String message, String? requiredPermission)
        permissionError,
    required TResult Function(String message, String? resource) notFoundError,
    required TResult Function(String message, String? details) conflictError,
    required TResult Function(String message, int? retryAfterSeconds)
        rateLimitError,
    required TResult Function(String message, String? estimatedRestoreTime)
        maintenanceError,
    required TResult Function(
            String message, String? details, Object? originalError)
        unknownError,
    required TResult Function(String message, String? operation)
        localStorageError,
    required TResult Function(String message, String? permissionStatus)
        locationError,
    required TResult Function(String message, String? permissionStatus)
        cameraError,
    required TResult Function(String message, String? reason) biometricError,
  }) {
    return cameraError(message, permissionStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, int? statusCode)?
        networkError,
    TResult? Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult? Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult? Function(String message, String? requiredPermission)?
        permissionError,
    TResult? Function(String message, String? resource)? notFoundError,
    TResult? Function(String message, String? details)? conflictError,
    TResult? Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult? Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult? Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult? Function(String message, String? operation)? localStorageError,
    TResult? Function(String message, String? permissionStatus)? locationError,
    TResult? Function(String message, String? permissionStatus)? cameraError,
    TResult? Function(String message, String? reason)? biometricError,
  }) {
    return cameraError?.call(message, permissionStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, int? statusCode)?
        networkError,
    TResult Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult Function(String message, String? requiredPermission)?
        permissionError,
    TResult Function(String message, String? resource)? notFoundError,
    TResult Function(String message, String? details)? conflictError,
    TResult Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult Function(String message, String? operation)? localStorageError,
    TResult Function(String message, String? permissionStatus)? locationError,
    TResult Function(String message, String? permissionStatus)? cameraError,
    TResult Function(String message, String? reason)? biometricError,
    required TResult orElse(),
  }) {
    if (cameraError != null) {
      return cameraError(message, permissionStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(AuthError value) authError,
    required TResult Function(PermissionError value) permissionError,
    required TResult Function(NotFoundError value) notFoundError,
    required TResult Function(ConflictError value) conflictError,
    required TResult Function(RateLimitError value) rateLimitError,
    required TResult Function(MaintenanceError value) maintenanceError,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(LocalStorageError value) localStorageError,
    required TResult Function(LocationError value) locationError,
    required TResult Function(CameraError value) cameraError,
    required TResult Function(BiometricError value) biometricError,
  }) {
    return cameraError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(AuthError value)? authError,
    TResult? Function(PermissionError value)? permissionError,
    TResult? Function(NotFoundError value)? notFoundError,
    TResult? Function(ConflictError value)? conflictError,
    TResult? Function(RateLimitError value)? rateLimitError,
    TResult? Function(MaintenanceError value)? maintenanceError,
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(LocalStorageError value)? localStorageError,
    TResult? Function(LocationError value)? locationError,
    TResult? Function(CameraError value)? cameraError,
    TResult? Function(BiometricError value)? biometricError,
  }) {
    return cameraError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(AuthError value)? authError,
    TResult Function(PermissionError value)? permissionError,
    TResult Function(NotFoundError value)? notFoundError,
    TResult Function(ConflictError value)? conflictError,
    TResult Function(RateLimitError value)? rateLimitError,
    TResult Function(MaintenanceError value)? maintenanceError,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(LocalStorageError value)? localStorageError,
    TResult Function(LocationError value)? locationError,
    TResult Function(CameraError value)? cameraError,
    TResult Function(BiometricError value)? biometricError,
    required TResult orElse(),
  }) {
    if (cameraError != null) {
      return cameraError(this);
    }
    return orElse();
  }
}

abstract class CameraError implements AppError {
  const factory CameraError(
      {required final String message,
      final String? permissionStatus}) = _$CameraErrorImpl;

  @override
  String get message;
  String? get permissionStatus;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CameraErrorImplCopyWith<_$CameraErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BiometricErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$BiometricErrorImplCopyWith(_$BiometricErrorImpl value,
          $Res Function(_$BiometricErrorImpl) then) =
      __$$BiometricErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? reason});
}

/// @nodoc
class __$$BiometricErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$BiometricErrorImpl>
    implements _$$BiometricErrorImplCopyWith<$Res> {
  __$$BiometricErrorImplCopyWithImpl(
      _$BiometricErrorImpl _value, $Res Function(_$BiometricErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? reason = freezed,
  }) {
    return _then(_$BiometricErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BiometricErrorImpl implements BiometricError {
  const _$BiometricErrorImpl({required this.message, this.reason});

  @override
  final String message;
  @override
  final String? reason;

  @override
  String toString() {
    return 'AppError.biometricError(message: $message, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiometricErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, reason);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BiometricErrorImplCopyWith<_$BiometricErrorImpl> get copyWith =>
      __$$BiometricErrorImplCopyWithImpl<_$BiometricErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? details, int? statusCode)
        networkError,
    required TResult Function(
            String message, String? details, int? statusCode, String? errorCode)
        serverError,
    required TResult Function(String message,
            Map<String, List<String>>? fieldErrors, String? errorCode)
        validationError,
    required TResult Function(
            String message, String? errorCode, bool requiresReauth)
        authError,
    required TResult Function(String message, String? requiredPermission)
        permissionError,
    required TResult Function(String message, String? resource) notFoundError,
    required TResult Function(String message, String? details) conflictError,
    required TResult Function(String message, int? retryAfterSeconds)
        rateLimitError,
    required TResult Function(String message, String? estimatedRestoreTime)
        maintenanceError,
    required TResult Function(
            String message, String? details, Object? originalError)
        unknownError,
    required TResult Function(String message, String? operation)
        localStorageError,
    required TResult Function(String message, String? permissionStatus)
        locationError,
    required TResult Function(String message, String? permissionStatus)
        cameraError,
    required TResult Function(String message, String? reason) biometricError,
  }) {
    return biometricError(message, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, int? statusCode)?
        networkError,
    TResult? Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult? Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult? Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult? Function(String message, String? requiredPermission)?
        permissionError,
    TResult? Function(String message, String? resource)? notFoundError,
    TResult? Function(String message, String? details)? conflictError,
    TResult? Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult? Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult? Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult? Function(String message, String? operation)? localStorageError,
    TResult? Function(String message, String? permissionStatus)? locationError,
    TResult? Function(String message, String? permissionStatus)? cameraError,
    TResult? Function(String message, String? reason)? biometricError,
  }) {
    return biometricError?.call(message, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, int? statusCode)?
        networkError,
    TResult Function(String message, String? details, int? statusCode,
            String? errorCode)?
        serverError,
    TResult Function(String message, Map<String, List<String>>? fieldErrors,
            String? errorCode)?
        validationError,
    TResult Function(String message, String? errorCode, bool requiresReauth)?
        authError,
    TResult Function(String message, String? requiredPermission)?
        permissionError,
    TResult Function(String message, String? resource)? notFoundError,
    TResult Function(String message, String? details)? conflictError,
    TResult Function(String message, int? retryAfterSeconds)? rateLimitError,
    TResult Function(String message, String? estimatedRestoreTime)?
        maintenanceError,
    TResult Function(String message, String? details, Object? originalError)?
        unknownError,
    TResult Function(String message, String? operation)? localStorageError,
    TResult Function(String message, String? permissionStatus)? locationError,
    TResult Function(String message, String? permissionStatus)? cameraError,
    TResult Function(String message, String? reason)? biometricError,
    required TResult orElse(),
  }) {
    if (biometricError != null) {
      return biometricError(message, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(AuthError value) authError,
    required TResult Function(PermissionError value) permissionError,
    required TResult Function(NotFoundError value) notFoundError,
    required TResult Function(ConflictError value) conflictError,
    required TResult Function(RateLimitError value) rateLimitError,
    required TResult Function(MaintenanceError value) maintenanceError,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(LocalStorageError value) localStorageError,
    required TResult Function(LocationError value) locationError,
    required TResult Function(CameraError value) cameraError,
    required TResult Function(BiometricError value) biometricError,
  }) {
    return biometricError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(AuthError value)? authError,
    TResult? Function(PermissionError value)? permissionError,
    TResult? Function(NotFoundError value)? notFoundError,
    TResult? Function(ConflictError value)? conflictError,
    TResult? Function(RateLimitError value)? rateLimitError,
    TResult? Function(MaintenanceError value)? maintenanceError,
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(LocalStorageError value)? localStorageError,
    TResult? Function(LocationError value)? locationError,
    TResult? Function(CameraError value)? cameraError,
    TResult? Function(BiometricError value)? biometricError,
  }) {
    return biometricError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(AuthError value)? authError,
    TResult Function(PermissionError value)? permissionError,
    TResult Function(NotFoundError value)? notFoundError,
    TResult Function(ConflictError value)? conflictError,
    TResult Function(RateLimitError value)? rateLimitError,
    TResult Function(MaintenanceError value)? maintenanceError,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(LocalStorageError value)? localStorageError,
    TResult Function(LocationError value)? locationError,
    TResult Function(CameraError value)? cameraError,
    TResult Function(BiometricError value)? biometricError,
    required TResult orElse(),
  }) {
    if (biometricError != null) {
      return biometricError(this);
    }
    return orElse();
  }
}

abstract class BiometricError implements AppError {
  const factory BiometricError(
      {required final String message,
      final String? reason}) = _$BiometricErrorImpl;

  @override
  String get message;
  String? get reason;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BiometricErrorImplCopyWith<_$BiometricErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
