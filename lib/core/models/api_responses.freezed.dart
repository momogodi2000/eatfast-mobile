// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_responses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiResponse<T> {
  bool get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  T? get data => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiResponseCopyWith<T, ApiResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<T, $Res> {
  factory $ApiResponseCopyWith(
          ApiResponse<T> value, $Res Function(ApiResponse<T>) then) =
      _$ApiResponseCopyWithImpl<T, $Res, ApiResponse<T>>;
  @useResult
  $Res call(
      {bool success,
      String? message,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) T? data,
      String? error});
}

/// @nodoc
class _$ApiResponseCopyWithImpl<T, $Res, $Val extends ApiResponse<T>>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiResponseImplCopyWith<T, $Res>
    implements $ApiResponseCopyWith<T, $Res> {
  factory _$$ApiResponseImplCopyWith(_$ApiResponseImpl<T> value,
          $Res Function(_$ApiResponseImpl<T>) then) =
      __$$ApiResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {bool success,
      String? message,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) T? data,
      String? error});
}

/// @nodoc
class __$$ApiResponseImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$ApiResponseImpl<T>>
    implements _$$ApiResponseImplCopyWith<T, $Res> {
  __$$ApiResponseImplCopyWithImpl(
      _$ApiResponseImpl<T> _value, $Res Function(_$ApiResponseImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ApiResponseImpl<T>(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ApiResponseImpl<T> implements _ApiResponse<T> {
  const _$ApiResponseImpl(
      {required this.success,
      this.message,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) this.data,
      this.error});

  @override
  final bool success;
  @override
  final String? message;
  @override
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  final T? data;
  @override
  final String? error;

  @override
  String toString() {
    return 'ApiResponse<$T>(success: $success, message: $message, data: $data, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseImpl<T> &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(data), error);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseImplCopyWith<T, _$ApiResponseImpl<T>> get copyWith =>
      __$$ApiResponseImplCopyWithImpl<T, _$ApiResponseImpl<T>>(
          this, _$identity);
}

abstract class _ApiResponse<T> implements ApiResponse<T> {
  const factory _ApiResponse(
      {required final bool success,
      final String? message,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) final T? data,
      final String? error}) = _$ApiResponseImpl<T>;

  @override
  bool get success;
  @override
  String? get message;
  @override
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  T? get data;
  @override
  String? get error;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiResponseImplCopyWith<T, _$ApiResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationInfo _$PaginationInfoFromJson(Map<String, dynamic> json) {
  return _PaginationInfo.fromJson(json);
}

/// @nodoc
mixin _$PaginationInfo {
  int get currentPage => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalItems => throw _privateConstructorUsedError;
  int get itemsPerPage => throw _privateConstructorUsedError;
  bool get hasNextPage => throw _privateConstructorUsedError;
  bool get hasPreviousPage => throw _privateConstructorUsedError;

  /// Serializes this PaginationInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationInfoCopyWith<PaginationInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationInfoCopyWith<$Res> {
  factory $PaginationInfoCopyWith(
          PaginationInfo value, $Res Function(PaginationInfo) then) =
      _$PaginationInfoCopyWithImpl<$Res, PaginationInfo>;
  @useResult
  $Res call(
      {int currentPage,
      int totalPages,
      int totalItems,
      int itemsPerPage,
      bool hasNextPage,
      bool hasPreviousPage});
}

/// @nodoc
class _$PaginationInfoCopyWithImpl<$Res, $Val extends PaginationInfo>
    implements $PaginationInfoCopyWith<$Res> {
  _$PaginationInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalItems = null,
    Object? itemsPerPage = null,
    Object? hasNextPage = null,
    Object? hasPreviousPage = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPreviousPage: null == hasPreviousPage
          ? _value.hasPreviousPage
          : hasPreviousPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationInfoImplCopyWith<$Res>
    implements $PaginationInfoCopyWith<$Res> {
  factory _$$PaginationInfoImplCopyWith(_$PaginationInfoImpl value,
          $Res Function(_$PaginationInfoImpl) then) =
      __$$PaginationInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentPage,
      int totalPages,
      int totalItems,
      int itemsPerPage,
      bool hasNextPage,
      bool hasPreviousPage});
}

/// @nodoc
class __$$PaginationInfoImplCopyWithImpl<$Res>
    extends _$PaginationInfoCopyWithImpl<$Res, _$PaginationInfoImpl>
    implements _$$PaginationInfoImplCopyWith<$Res> {
  __$$PaginationInfoImplCopyWithImpl(
      _$PaginationInfoImpl _value, $Res Function(_$PaginationInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginationInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalItems = null,
    Object? itemsPerPage = null,
    Object? hasNextPage = null,
    Object? hasPreviousPage = null,
  }) {
    return _then(_$PaginationInfoImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPreviousPage: null == hasPreviousPage
          ? _value.hasPreviousPage
          : hasPreviousPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationInfoImpl implements _PaginationInfo {
  const _$PaginationInfoImpl(
      {required this.currentPage,
      required this.totalPages,
      required this.totalItems,
      required this.itemsPerPage,
      required this.hasNextPage,
      required this.hasPreviousPage});

  factory _$PaginationInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationInfoImplFromJson(json);

  @override
  final int currentPage;
  @override
  final int totalPages;
  @override
  final int totalItems;
  @override
  final int itemsPerPage;
  @override
  final bool hasNextPage;
  @override
  final bool hasPreviousPage;

  @override
  String toString() {
    return 'PaginationInfo(currentPage: $currentPage, totalPages: $totalPages, totalItems: $totalItems, itemsPerPage: $itemsPerPage, hasNextPage: $hasNextPage, hasPreviousPage: $hasPreviousPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationInfoImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage) &&
            (identical(other.hasPreviousPage, hasPreviousPage) ||
                other.hasPreviousPage == hasPreviousPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentPage, totalPages,
      totalItems, itemsPerPage, hasNextPage, hasPreviousPage);

  /// Create a copy of PaginationInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationInfoImplCopyWith<_$PaginationInfoImpl> get copyWith =>
      __$$PaginationInfoImplCopyWithImpl<_$PaginationInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationInfoImplToJson(
      this,
    );
  }
}

abstract class _PaginationInfo implements PaginationInfo {
  const factory _PaginationInfo(
      {required final int currentPage,
      required final int totalPages,
      required final int totalItems,
      required final int itemsPerPage,
      required final bool hasNextPage,
      required final bool hasPreviousPage}) = _$PaginationInfoImpl;

  factory _PaginationInfo.fromJson(Map<String, dynamic> json) =
      _$PaginationInfoImpl.fromJson;

  @override
  int get currentPage;
  @override
  int get totalPages;
  @override
  int get totalItems;
  @override
  int get itemsPerPage;
  @override
  bool get hasNextPage;
  @override
  bool get hasPreviousPage;

  /// Create a copy of PaginationInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationInfoImplCopyWith<_$PaginationInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GuestOrderResponse _$GuestOrderResponseFromJson(Map<String, dynamic> json) {
  return _GuestOrderResponse.fromJson(json);
}

/// @nodoc
mixin _$GuestOrderResponse {
  String get orderId => throw _privateConstructorUsedError;
  String get trackingUrl => throw _privateConstructorUsedError;
  String? get paymentUrl => throw _privateConstructorUsedError;
  String? get estimatedDeliveryTime => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this GuestOrderResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuestOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestOrderResponseCopyWith<GuestOrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestOrderResponseCopyWith<$Res> {
  factory $GuestOrderResponseCopyWith(
          GuestOrderResponse value, $Res Function(GuestOrderResponse) then) =
      _$GuestOrderResponseCopyWithImpl<$Res, GuestOrderResponse>;
  @useResult
  $Res call(
      {String orderId,
      String trackingUrl,
      String? paymentUrl,
      String? estimatedDeliveryTime,
      bool success,
      String? error});
}

/// @nodoc
class _$GuestOrderResponseCopyWithImpl<$Res, $Val extends GuestOrderResponse>
    implements $GuestOrderResponseCopyWith<$Res> {
  _$GuestOrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? trackingUrl = null,
    Object? paymentUrl = freezed,
    Object? estimatedDeliveryTime = freezed,
    Object? success = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      trackingUrl: null == trackingUrl
          ? _value.trackingUrl
          : trackingUrl // ignore: cast_nullable_to_non_nullable
              as String,
      paymentUrl: freezed == paymentUrl
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedDeliveryTime: freezed == estimatedDeliveryTime
          ? _value.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as String?,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuestOrderResponseImplCopyWith<$Res>
    implements $GuestOrderResponseCopyWith<$Res> {
  factory _$$GuestOrderResponseImplCopyWith(_$GuestOrderResponseImpl value,
          $Res Function(_$GuestOrderResponseImpl) then) =
      __$$GuestOrderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderId,
      String trackingUrl,
      String? paymentUrl,
      String? estimatedDeliveryTime,
      bool success,
      String? error});
}

/// @nodoc
class __$$GuestOrderResponseImplCopyWithImpl<$Res>
    extends _$GuestOrderResponseCopyWithImpl<$Res, _$GuestOrderResponseImpl>
    implements _$$GuestOrderResponseImplCopyWith<$Res> {
  __$$GuestOrderResponseImplCopyWithImpl(_$GuestOrderResponseImpl _value,
      $Res Function(_$GuestOrderResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuestOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? trackingUrl = null,
    Object? paymentUrl = freezed,
    Object? estimatedDeliveryTime = freezed,
    Object? success = null,
    Object? error = freezed,
  }) {
    return _then(_$GuestOrderResponseImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      trackingUrl: null == trackingUrl
          ? _value.trackingUrl
          : trackingUrl // ignore: cast_nullable_to_non_nullable
              as String,
      paymentUrl: freezed == paymentUrl
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedDeliveryTime: freezed == estimatedDeliveryTime
          ? _value.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as String?,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestOrderResponseImpl implements _GuestOrderResponse {
  const _$GuestOrderResponseImpl(
      {required this.orderId,
      required this.trackingUrl,
      this.paymentUrl,
      this.estimatedDeliveryTime,
      required this.success,
      this.error});

  factory _$GuestOrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestOrderResponseImplFromJson(json);

  @override
  final String orderId;
  @override
  final String trackingUrl;
  @override
  final String? paymentUrl;
  @override
  final String? estimatedDeliveryTime;
  @override
  final bool success;
  @override
  final String? error;

  @override
  String toString() {
    return 'GuestOrderResponse(orderId: $orderId, trackingUrl: $trackingUrl, paymentUrl: $paymentUrl, estimatedDeliveryTime: $estimatedDeliveryTime, success: $success, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestOrderResponseImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.trackingUrl, trackingUrl) ||
                other.trackingUrl == trackingUrl) &&
            (identical(other.paymentUrl, paymentUrl) ||
                other.paymentUrl == paymentUrl) &&
            (identical(other.estimatedDeliveryTime, estimatedDeliveryTime) ||
                other.estimatedDeliveryTime == estimatedDeliveryTime) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, trackingUrl, paymentUrl,
      estimatedDeliveryTime, success, error);

  /// Create a copy of GuestOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestOrderResponseImplCopyWith<_$GuestOrderResponseImpl> get copyWith =>
      __$$GuestOrderResponseImplCopyWithImpl<_$GuestOrderResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestOrderResponseImplToJson(
      this,
    );
  }
}

abstract class _GuestOrderResponse implements GuestOrderResponse {
  const factory _GuestOrderResponse(
      {required final String orderId,
      required final String trackingUrl,
      final String? paymentUrl,
      final String? estimatedDeliveryTime,
      required final bool success,
      final String? error}) = _$GuestOrderResponseImpl;

  factory _GuestOrderResponse.fromJson(Map<String, dynamic> json) =
      _$GuestOrderResponseImpl.fromJson;

  @override
  String get orderId;
  @override
  String get trackingUrl;
  @override
  String? get paymentUrl;
  @override
  String? get estimatedDeliveryTime;
  @override
  bool get success;
  @override
  String? get error;

  /// Create a copy of GuestOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestOrderResponseImplCopyWith<_$GuestOrderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GuestOrderRequest _$GuestOrderRequestFromJson(Map<String, dynamic> json) {
  return _GuestOrderRequest.fromJson(json);
}

/// @nodoc
mixin _$GuestOrderRequest {
  String get restaurantId => throw _privateConstructorUsedError;
  List<GuestOrderItem> get items => throw _privateConstructorUsedError;
  String get deliveryAddress => throw _privateConstructorUsedError;
  GuestOrderCoordinates get deliveryCoordinates =>
      throw _privateConstructorUsedError;
  String get guestName => throw _privateConstructorUsedError;
  String get guestPhone => throw _privateConstructorUsedError;
  String? get guestEmail => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String? get specialInstructions => throw _privateConstructorUsedError;
  DateTime? get scheduledDeliveryTime => throw _privateConstructorUsedError;

  /// Serializes this GuestOrderRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuestOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestOrderRequestCopyWith<GuestOrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestOrderRequestCopyWith<$Res> {
  factory $GuestOrderRequestCopyWith(
          GuestOrderRequest value, $Res Function(GuestOrderRequest) then) =
      _$GuestOrderRequestCopyWithImpl<$Res, GuestOrderRequest>;
  @useResult
  $Res call(
      {String restaurantId,
      List<GuestOrderItem> items,
      String deliveryAddress,
      GuestOrderCoordinates deliveryCoordinates,
      String guestName,
      String guestPhone,
      String? guestEmail,
      String paymentMethod,
      String? specialInstructions,
      DateTime? scheduledDeliveryTime});

  $GuestOrderCoordinatesCopyWith<$Res> get deliveryCoordinates;
}

/// @nodoc
class _$GuestOrderRequestCopyWithImpl<$Res, $Val extends GuestOrderRequest>
    implements $GuestOrderRequestCopyWith<$Res> {
  _$GuestOrderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantId = null,
    Object? items = null,
    Object? deliveryAddress = null,
    Object? deliveryCoordinates = null,
    Object? guestName = null,
    Object? guestPhone = null,
    Object? guestEmail = freezed,
    Object? paymentMethod = null,
    Object? specialInstructions = freezed,
    Object? scheduledDeliveryTime = freezed,
  }) {
    return _then(_value.copyWith(
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GuestOrderItem>,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryCoordinates: null == deliveryCoordinates
          ? _value.deliveryCoordinates
          : deliveryCoordinates // ignore: cast_nullable_to_non_nullable
              as GuestOrderCoordinates,
      guestName: null == guestName
          ? _value.guestName
          : guestName // ignore: cast_nullable_to_non_nullable
              as String,
      guestPhone: null == guestPhone
          ? _value.guestPhone
          : guestPhone // ignore: cast_nullable_to_non_nullable
              as String,
      guestEmail: freezed == guestEmail
          ? _value.guestEmail
          : guestEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledDeliveryTime: freezed == scheduledDeliveryTime
          ? _value.scheduledDeliveryTime
          : scheduledDeliveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of GuestOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GuestOrderCoordinatesCopyWith<$Res> get deliveryCoordinates {
    return $GuestOrderCoordinatesCopyWith<$Res>(_value.deliveryCoordinates,
        (value) {
      return _then(_value.copyWith(deliveryCoordinates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GuestOrderRequestImplCopyWith<$Res>
    implements $GuestOrderRequestCopyWith<$Res> {
  factory _$$GuestOrderRequestImplCopyWith(_$GuestOrderRequestImpl value,
          $Res Function(_$GuestOrderRequestImpl) then) =
      __$$GuestOrderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String restaurantId,
      List<GuestOrderItem> items,
      String deliveryAddress,
      GuestOrderCoordinates deliveryCoordinates,
      String guestName,
      String guestPhone,
      String? guestEmail,
      String paymentMethod,
      String? specialInstructions,
      DateTime? scheduledDeliveryTime});

  @override
  $GuestOrderCoordinatesCopyWith<$Res> get deliveryCoordinates;
}

/// @nodoc
class __$$GuestOrderRequestImplCopyWithImpl<$Res>
    extends _$GuestOrderRequestCopyWithImpl<$Res, _$GuestOrderRequestImpl>
    implements _$$GuestOrderRequestImplCopyWith<$Res> {
  __$$GuestOrderRequestImplCopyWithImpl(_$GuestOrderRequestImpl _value,
      $Res Function(_$GuestOrderRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuestOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantId = null,
    Object? items = null,
    Object? deliveryAddress = null,
    Object? deliveryCoordinates = null,
    Object? guestName = null,
    Object? guestPhone = null,
    Object? guestEmail = freezed,
    Object? paymentMethod = null,
    Object? specialInstructions = freezed,
    Object? scheduledDeliveryTime = freezed,
  }) {
    return _then(_$GuestOrderRequestImpl(
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GuestOrderItem>,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryCoordinates: null == deliveryCoordinates
          ? _value.deliveryCoordinates
          : deliveryCoordinates // ignore: cast_nullable_to_non_nullable
              as GuestOrderCoordinates,
      guestName: null == guestName
          ? _value.guestName
          : guestName // ignore: cast_nullable_to_non_nullable
              as String,
      guestPhone: null == guestPhone
          ? _value.guestPhone
          : guestPhone // ignore: cast_nullable_to_non_nullable
              as String,
      guestEmail: freezed == guestEmail
          ? _value.guestEmail
          : guestEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledDeliveryTime: freezed == scheduledDeliveryTime
          ? _value.scheduledDeliveryTime
          : scheduledDeliveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestOrderRequestImpl implements _GuestOrderRequest {
  const _$GuestOrderRequestImpl(
      {required this.restaurantId,
      required final List<GuestOrderItem> items,
      required this.deliveryAddress,
      required this.deliveryCoordinates,
      required this.guestName,
      required this.guestPhone,
      this.guestEmail,
      this.paymentMethod = 'cash',
      this.specialInstructions,
      this.scheduledDeliveryTime})
      : _items = items;

  factory _$GuestOrderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestOrderRequestImplFromJson(json);

  @override
  final String restaurantId;
  final List<GuestOrderItem> _items;
  @override
  List<GuestOrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String deliveryAddress;
  @override
  final GuestOrderCoordinates deliveryCoordinates;
  @override
  final String guestName;
  @override
  final String guestPhone;
  @override
  final String? guestEmail;
  @override
  @JsonKey()
  final String paymentMethod;
  @override
  final String? specialInstructions;
  @override
  final DateTime? scheduledDeliveryTime;

  @override
  String toString() {
    return 'GuestOrderRequest(restaurantId: $restaurantId, items: $items, deliveryAddress: $deliveryAddress, deliveryCoordinates: $deliveryCoordinates, guestName: $guestName, guestPhone: $guestPhone, guestEmail: $guestEmail, paymentMethod: $paymentMethod, specialInstructions: $specialInstructions, scheduledDeliveryTime: $scheduledDeliveryTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestOrderRequestImpl &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.deliveryCoordinates, deliveryCoordinates) ||
                other.deliveryCoordinates == deliveryCoordinates) &&
            (identical(other.guestName, guestName) ||
                other.guestName == guestName) &&
            (identical(other.guestPhone, guestPhone) ||
                other.guestPhone == guestPhone) &&
            (identical(other.guestEmail, guestEmail) ||
                other.guestEmail == guestEmail) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions) &&
            (identical(other.scheduledDeliveryTime, scheduledDeliveryTime) ||
                other.scheduledDeliveryTime == scheduledDeliveryTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      restaurantId,
      const DeepCollectionEquality().hash(_items),
      deliveryAddress,
      deliveryCoordinates,
      guestName,
      guestPhone,
      guestEmail,
      paymentMethod,
      specialInstructions,
      scheduledDeliveryTime);

  /// Create a copy of GuestOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestOrderRequestImplCopyWith<_$GuestOrderRequestImpl> get copyWith =>
      __$$GuestOrderRequestImplCopyWithImpl<_$GuestOrderRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestOrderRequestImplToJson(
      this,
    );
  }
}

abstract class _GuestOrderRequest implements GuestOrderRequest {
  const factory _GuestOrderRequest(
      {required final String restaurantId,
      required final List<GuestOrderItem> items,
      required final String deliveryAddress,
      required final GuestOrderCoordinates deliveryCoordinates,
      required final String guestName,
      required final String guestPhone,
      final String? guestEmail,
      final String paymentMethod,
      final String? specialInstructions,
      final DateTime? scheduledDeliveryTime}) = _$GuestOrderRequestImpl;

  factory _GuestOrderRequest.fromJson(Map<String, dynamic> json) =
      _$GuestOrderRequestImpl.fromJson;

  @override
  String get restaurantId;
  @override
  List<GuestOrderItem> get items;
  @override
  String get deliveryAddress;
  @override
  GuestOrderCoordinates get deliveryCoordinates;
  @override
  String get guestName;
  @override
  String get guestPhone;
  @override
  String? get guestEmail;
  @override
  String get paymentMethod;
  @override
  String? get specialInstructions;
  @override
  DateTime? get scheduledDeliveryTime;

  /// Create a copy of GuestOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestOrderRequestImplCopyWith<_$GuestOrderRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GuestOrderItem _$GuestOrderItemFromJson(Map<String, dynamic> json) {
  return _GuestOrderItem.fromJson(json);
}

/// @nodoc
mixin _$GuestOrderItem {
  String get menuId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String? get customizations => throw _privateConstructorUsedError;

  /// Serializes this GuestOrderItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuestOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestOrderItemCopyWith<GuestOrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestOrderItemCopyWith<$Res> {
  factory $GuestOrderItemCopyWith(
          GuestOrderItem value, $Res Function(GuestOrderItem) then) =
      _$GuestOrderItemCopyWithImpl<$Res, GuestOrderItem>;
  @useResult
  $Res call({String menuId, int quantity, String? customizations});
}

/// @nodoc
class _$GuestOrderItemCopyWithImpl<$Res, $Val extends GuestOrderItem>
    implements $GuestOrderItemCopyWith<$Res> {
  _$GuestOrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuId = null,
    Object? quantity = null,
    Object? customizations = freezed,
  }) {
    return _then(_value.copyWith(
      menuId: null == menuId
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      customizations: freezed == customizations
          ? _value.customizations
          : customizations // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuestOrderItemImplCopyWith<$Res>
    implements $GuestOrderItemCopyWith<$Res> {
  factory _$$GuestOrderItemImplCopyWith(_$GuestOrderItemImpl value,
          $Res Function(_$GuestOrderItemImpl) then) =
      __$$GuestOrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String menuId, int quantity, String? customizations});
}

/// @nodoc
class __$$GuestOrderItemImplCopyWithImpl<$Res>
    extends _$GuestOrderItemCopyWithImpl<$Res, _$GuestOrderItemImpl>
    implements _$$GuestOrderItemImplCopyWith<$Res> {
  __$$GuestOrderItemImplCopyWithImpl(
      _$GuestOrderItemImpl _value, $Res Function(_$GuestOrderItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuestOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuId = null,
    Object? quantity = null,
    Object? customizations = freezed,
  }) {
    return _then(_$GuestOrderItemImpl(
      menuId: null == menuId
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      customizations: freezed == customizations
          ? _value.customizations
          : customizations // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestOrderItemImpl implements _GuestOrderItem {
  const _$GuestOrderItemImpl(
      {required this.menuId, required this.quantity, this.customizations});

  factory _$GuestOrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestOrderItemImplFromJson(json);

  @override
  final String menuId;
  @override
  final int quantity;
  @override
  final String? customizations;

  @override
  String toString() {
    return 'GuestOrderItem(menuId: $menuId, quantity: $quantity, customizations: $customizations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestOrderItemImpl &&
            (identical(other.menuId, menuId) || other.menuId == menuId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.customizations, customizations) ||
                other.customizations == customizations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, menuId, quantity, customizations);

  /// Create a copy of GuestOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestOrderItemImplCopyWith<_$GuestOrderItemImpl> get copyWith =>
      __$$GuestOrderItemImplCopyWithImpl<_$GuestOrderItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestOrderItemImplToJson(
      this,
    );
  }
}

abstract class _GuestOrderItem implements GuestOrderItem {
  const factory _GuestOrderItem(
      {required final String menuId,
      required final int quantity,
      final String? customizations}) = _$GuestOrderItemImpl;

  factory _GuestOrderItem.fromJson(Map<String, dynamic> json) =
      _$GuestOrderItemImpl.fromJson;

  @override
  String get menuId;
  @override
  int get quantity;
  @override
  String? get customizations;

  /// Create a copy of GuestOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestOrderItemImplCopyWith<_$GuestOrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GuestOrderCoordinates _$GuestOrderCoordinatesFromJson(
    Map<String, dynamic> json) {
  return _GuestOrderCoordinates.fromJson(json);
}

/// @nodoc
mixin _$GuestOrderCoordinates {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  /// Serializes this GuestOrderCoordinates to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuestOrderCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestOrderCoordinatesCopyWith<GuestOrderCoordinates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestOrderCoordinatesCopyWith<$Res> {
  factory $GuestOrderCoordinatesCopyWith(GuestOrderCoordinates value,
          $Res Function(GuestOrderCoordinates) then) =
      _$GuestOrderCoordinatesCopyWithImpl<$Res, GuestOrderCoordinates>;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$GuestOrderCoordinatesCopyWithImpl<$Res,
        $Val extends GuestOrderCoordinates>
    implements $GuestOrderCoordinatesCopyWith<$Res> {
  _$GuestOrderCoordinatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestOrderCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuestOrderCoordinatesImplCopyWith<$Res>
    implements $GuestOrderCoordinatesCopyWith<$Res> {
  factory _$$GuestOrderCoordinatesImplCopyWith(
          _$GuestOrderCoordinatesImpl value,
          $Res Function(_$GuestOrderCoordinatesImpl) then) =
      __$$GuestOrderCoordinatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$GuestOrderCoordinatesImplCopyWithImpl<$Res>
    extends _$GuestOrderCoordinatesCopyWithImpl<$Res,
        _$GuestOrderCoordinatesImpl>
    implements _$$GuestOrderCoordinatesImplCopyWith<$Res> {
  __$$GuestOrderCoordinatesImplCopyWithImpl(_$GuestOrderCoordinatesImpl _value,
      $Res Function(_$GuestOrderCoordinatesImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuestOrderCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$GuestOrderCoordinatesImpl(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestOrderCoordinatesImpl implements _GuestOrderCoordinates {
  const _$GuestOrderCoordinatesImpl({required this.lat, required this.lng});

  factory _$GuestOrderCoordinatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestOrderCoordinatesImplFromJson(json);

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'GuestOrderCoordinates(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestOrderCoordinatesImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  /// Create a copy of GuestOrderCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestOrderCoordinatesImplCopyWith<_$GuestOrderCoordinatesImpl>
      get copyWith => __$$GuestOrderCoordinatesImplCopyWithImpl<
          _$GuestOrderCoordinatesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestOrderCoordinatesImplToJson(
      this,
    );
  }
}

abstract class _GuestOrderCoordinates implements GuestOrderCoordinates {
  const factory _GuestOrderCoordinates(
      {required final double lat,
      required final double lng}) = _$GuestOrderCoordinatesImpl;

  factory _GuestOrderCoordinates.fromJson(Map<String, dynamic> json) =
      _$GuestOrderCoordinatesImpl.fromJson;

  @override
  double get lat;
  @override
  double get lng;

  /// Create a copy of GuestOrderCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestOrderCoordinatesImplCopyWith<_$GuestOrderCoordinatesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WalletResponse _$WalletResponseFromJson(Map<String, dynamic> json) {
  return _WalletResponse.fromJson(json);
}

/// @nodoc
mixin _$WalletResponse {
  double get balance => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  List<WalletTransaction> get recentTransactions =>
      throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this WalletResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletResponseCopyWith<WalletResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletResponseCopyWith<$Res> {
  factory $WalletResponseCopyWith(
          WalletResponse value, $Res Function(WalletResponse) then) =
      _$WalletResponseCopyWithImpl<$Res, WalletResponse>;
  @useResult
  $Res call(
      {double balance,
      String currency,
      List<WalletTransaction> recentTransactions,
      bool success,
      String? error});
}

/// @nodoc
class _$WalletResponseCopyWithImpl<$Res, $Val extends WalletResponse>
    implements $WalletResponseCopyWith<$Res> {
  _$WalletResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
    Object? currency = null,
    Object? recentTransactions = null,
    Object? success = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      recentTransactions: null == recentTransactions
          ? _value.recentTransactions
          : recentTransactions // ignore: cast_nullable_to_non_nullable
              as List<WalletTransaction>,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletResponseImplCopyWith<$Res>
    implements $WalletResponseCopyWith<$Res> {
  factory _$$WalletResponseImplCopyWith(_$WalletResponseImpl value,
          $Res Function(_$WalletResponseImpl) then) =
      __$$WalletResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double balance,
      String currency,
      List<WalletTransaction> recentTransactions,
      bool success,
      String? error});
}

/// @nodoc
class __$$WalletResponseImplCopyWithImpl<$Res>
    extends _$WalletResponseCopyWithImpl<$Res, _$WalletResponseImpl>
    implements _$$WalletResponseImplCopyWith<$Res> {
  __$$WalletResponseImplCopyWithImpl(
      _$WalletResponseImpl _value, $Res Function(_$WalletResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalletResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
    Object? currency = null,
    Object? recentTransactions = null,
    Object? success = null,
    Object? error = freezed,
  }) {
    return _then(_$WalletResponseImpl(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      recentTransactions: null == recentTransactions
          ? _value._recentTransactions
          : recentTransactions // ignore: cast_nullable_to_non_nullable
              as List<WalletTransaction>,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletResponseImpl implements _WalletResponse {
  const _$WalletResponseImpl(
      {required this.balance,
      required this.currency,
      required final List<WalletTransaction> recentTransactions,
      required this.success,
      this.error})
      : _recentTransactions = recentTransactions;

  factory _$WalletResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletResponseImplFromJson(json);

  @override
  final double balance;
  @override
  final String currency;
  final List<WalletTransaction> _recentTransactions;
  @override
  List<WalletTransaction> get recentTransactions {
    if (_recentTransactions is EqualUnmodifiableListView)
      return _recentTransactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentTransactions);
  }

  @override
  final bool success;
  @override
  final String? error;

  @override
  String toString() {
    return 'WalletResponse(balance: $balance, currency: $currency, recentTransactions: $recentTransactions, success: $success, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletResponseImpl &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality()
                .equals(other._recentTransactions, _recentTransactions) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, balance, currency,
      const DeepCollectionEquality().hash(_recentTransactions), success, error);

  /// Create a copy of WalletResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletResponseImplCopyWith<_$WalletResponseImpl> get copyWith =>
      __$$WalletResponseImplCopyWithImpl<_$WalletResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletResponseImplToJson(
      this,
    );
  }
}

abstract class _WalletResponse implements WalletResponse {
  const factory _WalletResponse(
      {required final double balance,
      required final String currency,
      required final List<WalletTransaction> recentTransactions,
      required final bool success,
      final String? error}) = _$WalletResponseImpl;

  factory _WalletResponse.fromJson(Map<String, dynamic> json) =
      _$WalletResponseImpl.fromJson;

  @override
  double get balance;
  @override
  String get currency;
  @override
  List<WalletTransaction> get recentTransactions;
  @override
  bool get success;
  @override
  String? get error;

  /// Create a copy of WalletResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletResponseImplCopyWith<_$WalletResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WalletTransaction _$WalletTransactionFromJson(Map<String, dynamic> json) {
  return _WalletTransaction.fromJson(json);
}

/// @nodoc
mixin _$WalletTransaction {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError; // 'credit', 'debit'
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get reference => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  /// Serializes this WalletTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletTransactionCopyWith<WalletTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletTransactionCopyWith<$Res> {
  factory $WalletTransactionCopyWith(
          WalletTransaction value, $Res Function(WalletTransaction) then) =
      _$WalletTransactionCopyWithImpl<$Res, WalletTransaction>;
  @useResult
  $Res call(
      {String id,
      String type,
      double amount,
      String currency,
      String description,
      DateTime createdAt,
      String? reference,
      String? status});
}

/// @nodoc
class _$WalletTransactionCopyWithImpl<$Res, $Val extends WalletTransaction>
    implements $WalletTransactionCopyWith<$Res> {
  _$WalletTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? amount = null,
    Object? currency = null,
    Object? description = null,
    Object? createdAt = null,
    Object? reference = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletTransactionImplCopyWith<$Res>
    implements $WalletTransactionCopyWith<$Res> {
  factory _$$WalletTransactionImplCopyWith(_$WalletTransactionImpl value,
          $Res Function(_$WalletTransactionImpl) then) =
      __$$WalletTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      double amount,
      String currency,
      String description,
      DateTime createdAt,
      String? reference,
      String? status});
}

/// @nodoc
class __$$WalletTransactionImplCopyWithImpl<$Res>
    extends _$WalletTransactionCopyWithImpl<$Res, _$WalletTransactionImpl>
    implements _$$WalletTransactionImplCopyWith<$Res> {
  __$$WalletTransactionImplCopyWithImpl(_$WalletTransactionImpl _value,
      $Res Function(_$WalletTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalletTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? amount = null,
    Object? currency = null,
    Object? description = null,
    Object? createdAt = null,
    Object? reference = freezed,
    Object? status = freezed,
  }) {
    return _then(_$WalletTransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletTransactionImpl implements _WalletTransaction {
  const _$WalletTransactionImpl(
      {required this.id,
      required this.type,
      required this.amount,
      required this.currency,
      required this.description,
      required this.createdAt,
      this.reference,
      this.status});

  factory _$WalletTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletTransactionImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
// 'credit', 'debit'
  @override
  final double amount;
  @override
  final String currency;
  @override
  final String description;
  @override
  final DateTime createdAt;
  @override
  final String? reference;
  @override
  final String? status;

  @override
  String toString() {
    return 'WalletTransaction(id: $id, type: $type, amount: $amount, currency: $currency, description: $description, createdAt: $createdAt, reference: $reference, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, amount, currency,
      description, createdAt, reference, status);

  /// Create a copy of WalletTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletTransactionImplCopyWith<_$WalletTransactionImpl> get copyWith =>
      __$$WalletTransactionImplCopyWithImpl<_$WalletTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletTransactionImplToJson(
      this,
    );
  }
}

abstract class _WalletTransaction implements WalletTransaction {
  const factory _WalletTransaction(
      {required final String id,
      required final String type,
      required final double amount,
      required final String currency,
      required final String description,
      required final DateTime createdAt,
      final String? reference,
      final String? status}) = _$WalletTransactionImpl;

  factory _WalletTransaction.fromJson(Map<String, dynamic> json) =
      _$WalletTransactionImpl.fromJson;

  @override
  String get id;
  @override
  String get type; // 'credit', 'debit'
  @override
  double get amount;
  @override
  String get currency;
  @override
  String get description;
  @override
  DateTime get createdAt;
  @override
  String? get reference;
  @override
  String? get status;

  /// Create a copy of WalletTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletTransactionImplCopyWith<_$WalletTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoyaltyResponse _$LoyaltyResponseFromJson(Map<String, dynamic> json) {
  return _LoyaltyResponse.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyResponse {
  int get points => throw _privateConstructorUsedError;
  String get tier => throw _privateConstructorUsedError;
  List<LoyaltyReward> get availableRewards =>
      throw _privateConstructorUsedError;
  int get totalEarned => throw _privateConstructorUsedError;
  int get totalRedeemed => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this LoyaltyResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoyaltyResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoyaltyResponseCopyWith<LoyaltyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyResponseCopyWith<$Res> {
  factory $LoyaltyResponseCopyWith(
          LoyaltyResponse value, $Res Function(LoyaltyResponse) then) =
      _$LoyaltyResponseCopyWithImpl<$Res, LoyaltyResponse>;
  @useResult
  $Res call(
      {int points,
      String tier,
      List<LoyaltyReward> availableRewards,
      int totalEarned,
      int totalRedeemed,
      bool success,
      String? error});
}

/// @nodoc
class _$LoyaltyResponseCopyWithImpl<$Res, $Val extends LoyaltyResponse>
    implements $LoyaltyResponseCopyWith<$Res> {
  _$LoyaltyResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoyaltyResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? tier = null,
    Object? availableRewards = null,
    Object? totalEarned = null,
    Object? totalRedeemed = null,
    Object? success = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as String,
      availableRewards: null == availableRewards
          ? _value.availableRewards
          : availableRewards // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyReward>,
      totalEarned: null == totalEarned
          ? _value.totalEarned
          : totalEarned // ignore: cast_nullable_to_non_nullable
              as int,
      totalRedeemed: null == totalRedeemed
          ? _value.totalRedeemed
          : totalRedeemed // ignore: cast_nullable_to_non_nullable
              as int,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoyaltyResponseImplCopyWith<$Res>
    implements $LoyaltyResponseCopyWith<$Res> {
  factory _$$LoyaltyResponseImplCopyWith(_$LoyaltyResponseImpl value,
          $Res Function(_$LoyaltyResponseImpl) then) =
      __$$LoyaltyResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int points,
      String tier,
      List<LoyaltyReward> availableRewards,
      int totalEarned,
      int totalRedeemed,
      bool success,
      String? error});
}

/// @nodoc
class __$$LoyaltyResponseImplCopyWithImpl<$Res>
    extends _$LoyaltyResponseCopyWithImpl<$Res, _$LoyaltyResponseImpl>
    implements _$$LoyaltyResponseImplCopyWith<$Res> {
  __$$LoyaltyResponseImplCopyWithImpl(
      _$LoyaltyResponseImpl _value, $Res Function(_$LoyaltyResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoyaltyResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? tier = null,
    Object? availableRewards = null,
    Object? totalEarned = null,
    Object? totalRedeemed = null,
    Object? success = null,
    Object? error = freezed,
  }) {
    return _then(_$LoyaltyResponseImpl(
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as String,
      availableRewards: null == availableRewards
          ? _value._availableRewards
          : availableRewards // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyReward>,
      totalEarned: null == totalEarned
          ? _value.totalEarned
          : totalEarned // ignore: cast_nullable_to_non_nullable
              as int,
      totalRedeemed: null == totalRedeemed
          ? _value.totalRedeemed
          : totalRedeemed // ignore: cast_nullable_to_non_nullable
              as int,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoyaltyResponseImpl implements _LoyaltyResponse {
  const _$LoyaltyResponseImpl(
      {required this.points,
      required this.tier,
      required final List<LoyaltyReward> availableRewards,
      required this.totalEarned,
      required this.totalRedeemed,
      required this.success,
      this.error})
      : _availableRewards = availableRewards;

  factory _$LoyaltyResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoyaltyResponseImplFromJson(json);

  @override
  final int points;
  @override
  final String tier;
  final List<LoyaltyReward> _availableRewards;
  @override
  List<LoyaltyReward> get availableRewards {
    if (_availableRewards is EqualUnmodifiableListView)
      return _availableRewards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableRewards);
  }

  @override
  final int totalEarned;
  @override
  final int totalRedeemed;
  @override
  final bool success;
  @override
  final String? error;

  @override
  String toString() {
    return 'LoyaltyResponse(points: $points, tier: $tier, availableRewards: $availableRewards, totalEarned: $totalEarned, totalRedeemed: $totalRedeemed, success: $success, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoyaltyResponseImpl &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.tier, tier) || other.tier == tier) &&
            const DeepCollectionEquality()
                .equals(other._availableRewards, _availableRewards) &&
            (identical(other.totalEarned, totalEarned) ||
                other.totalEarned == totalEarned) &&
            (identical(other.totalRedeemed, totalRedeemed) ||
                other.totalRedeemed == totalRedeemed) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      points,
      tier,
      const DeepCollectionEquality().hash(_availableRewards),
      totalEarned,
      totalRedeemed,
      success,
      error);

  /// Create a copy of LoyaltyResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoyaltyResponseImplCopyWith<_$LoyaltyResponseImpl> get copyWith =>
      __$$LoyaltyResponseImplCopyWithImpl<_$LoyaltyResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoyaltyResponseImplToJson(
      this,
    );
  }
}

abstract class _LoyaltyResponse implements LoyaltyResponse {
  const factory _LoyaltyResponse(
      {required final int points,
      required final String tier,
      required final List<LoyaltyReward> availableRewards,
      required final int totalEarned,
      required final int totalRedeemed,
      required final bool success,
      final String? error}) = _$LoyaltyResponseImpl;

  factory _LoyaltyResponse.fromJson(Map<String, dynamic> json) =
      _$LoyaltyResponseImpl.fromJson;

  @override
  int get points;
  @override
  String get tier;
  @override
  List<LoyaltyReward> get availableRewards;
  @override
  int get totalEarned;
  @override
  int get totalRedeemed;
  @override
  bool get success;
  @override
  String? get error;

  /// Create a copy of LoyaltyResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoyaltyResponseImplCopyWith<_$LoyaltyResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoyaltyReward _$LoyaltyRewardFromJson(Map<String, dynamic> json) {
  return _LoyaltyReward.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyReward {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get pointsCost => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // 'discount', 'freeItem', 'delivery'
  String? get imageUrl => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;

  /// Serializes this LoyaltyReward to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoyaltyReward
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoyaltyRewardCopyWith<LoyaltyReward> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyRewardCopyWith<$Res> {
  factory $LoyaltyRewardCopyWith(
          LoyaltyReward value, $Res Function(LoyaltyReward) then) =
      _$LoyaltyRewardCopyWithImpl<$Res, LoyaltyReward>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      int pointsCost,
      String type,
      String? imageUrl,
      DateTime? expiresAt,
      bool isAvailable});
}

/// @nodoc
class _$LoyaltyRewardCopyWithImpl<$Res, $Val extends LoyaltyReward>
    implements $LoyaltyRewardCopyWith<$Res> {
  _$LoyaltyRewardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoyaltyReward
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? pointsCost = null,
    Object? type = null,
    Object? imageUrl = freezed,
    Object? expiresAt = freezed,
    Object? isAvailable = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      pointsCost: null == pointsCost
          ? _value.pointsCost
          : pointsCost // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoyaltyRewardImplCopyWith<$Res>
    implements $LoyaltyRewardCopyWith<$Res> {
  factory _$$LoyaltyRewardImplCopyWith(
          _$LoyaltyRewardImpl value, $Res Function(_$LoyaltyRewardImpl) then) =
      __$$LoyaltyRewardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      int pointsCost,
      String type,
      String? imageUrl,
      DateTime? expiresAt,
      bool isAvailable});
}

/// @nodoc
class __$$LoyaltyRewardImplCopyWithImpl<$Res>
    extends _$LoyaltyRewardCopyWithImpl<$Res, _$LoyaltyRewardImpl>
    implements _$$LoyaltyRewardImplCopyWith<$Res> {
  __$$LoyaltyRewardImplCopyWithImpl(
      _$LoyaltyRewardImpl _value, $Res Function(_$LoyaltyRewardImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoyaltyReward
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? pointsCost = null,
    Object? type = null,
    Object? imageUrl = freezed,
    Object? expiresAt = freezed,
    Object? isAvailable = null,
  }) {
    return _then(_$LoyaltyRewardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      pointsCost: null == pointsCost
          ? _value.pointsCost
          : pointsCost // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoyaltyRewardImpl implements _LoyaltyReward {
  const _$LoyaltyRewardImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.pointsCost,
      required this.type,
      this.imageUrl,
      this.expiresAt,
      required this.isAvailable});

  factory _$LoyaltyRewardImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoyaltyRewardImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final int pointsCost;
  @override
  final String type;
// 'discount', 'freeItem', 'delivery'
  @override
  final String? imageUrl;
  @override
  final DateTime? expiresAt;
  @override
  final bool isAvailable;

  @override
  String toString() {
    return 'LoyaltyReward(id: $id, title: $title, description: $description, pointsCost: $pointsCost, type: $type, imageUrl: $imageUrl, expiresAt: $expiresAt, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoyaltyRewardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.pointsCost, pointsCost) ||
                other.pointsCost == pointsCost) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      pointsCost, type, imageUrl, expiresAt, isAvailable);

  /// Create a copy of LoyaltyReward
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoyaltyRewardImplCopyWith<_$LoyaltyRewardImpl> get copyWith =>
      __$$LoyaltyRewardImplCopyWithImpl<_$LoyaltyRewardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoyaltyRewardImplToJson(
      this,
    );
  }
}

abstract class _LoyaltyReward implements LoyaltyReward {
  const factory _LoyaltyReward(
      {required final String id,
      required final String title,
      required final String description,
      required final int pointsCost,
      required final String type,
      final String? imageUrl,
      final DateTime? expiresAt,
      required final bool isAvailable}) = _$LoyaltyRewardImpl;

  factory _LoyaltyReward.fromJson(Map<String, dynamic> json) =
      _$LoyaltyRewardImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  int get pointsCost;
  @override
  String get type; // 'discount', 'freeItem', 'delivery'
  @override
  String? get imageUrl;
  @override
  DateTime? get expiresAt;
  @override
  bool get isAvailable;

  /// Create a copy of LoyaltyReward
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoyaltyRewardImplCopyWith<_$LoyaltyRewardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderTrackingResponse _$OrderTrackingResponseFromJson(
    Map<String, dynamic> json) {
  return _OrderTrackingResponse.fromJson(json);
}

/// @nodoc
mixin _$OrderTrackingResponse {
  Order get order => throw _privateConstructorUsedError;
  DriverLocation? get driverLocation => throw _privateConstructorUsedError;
  List<OrderStatusHistory> get statusHistory =>
      throw _privateConstructorUsedError;
  String? get estimatedArrival => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this OrderTrackingResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderTrackingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderTrackingResponseCopyWith<OrderTrackingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTrackingResponseCopyWith<$Res> {
  factory $OrderTrackingResponseCopyWith(OrderTrackingResponse value,
          $Res Function(OrderTrackingResponse) then) =
      _$OrderTrackingResponseCopyWithImpl<$Res, OrderTrackingResponse>;
  @useResult
  $Res call(
      {Order order,
      DriverLocation? driverLocation,
      List<OrderStatusHistory> statusHistory,
      String? estimatedArrival,
      bool success,
      String? error});

  $OrderCopyWith<$Res> get order;
  $DriverLocationCopyWith<$Res>? get driverLocation;
}

/// @nodoc
class _$OrderTrackingResponseCopyWithImpl<$Res,
        $Val extends OrderTrackingResponse>
    implements $OrderTrackingResponseCopyWith<$Res> {
  _$OrderTrackingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderTrackingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? driverLocation = freezed,
    Object? statusHistory = null,
    Object? estimatedArrival = freezed,
    Object? success = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order,
      driverLocation: freezed == driverLocation
          ? _value.driverLocation
          : driverLocation // ignore: cast_nullable_to_non_nullable
              as DriverLocation?,
      statusHistory: null == statusHistory
          ? _value.statusHistory
          : statusHistory // ignore: cast_nullable_to_non_nullable
              as List<OrderStatusHistory>,
      estimatedArrival: freezed == estimatedArrival
          ? _value.estimatedArrival
          : estimatedArrival // ignore: cast_nullable_to_non_nullable
              as String?,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of OrderTrackingResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderCopyWith<$Res> get order {
    return $OrderCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }

  /// Create a copy of OrderTrackingResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DriverLocationCopyWith<$Res>? get driverLocation {
    if (_value.driverLocation == null) {
      return null;
    }

    return $DriverLocationCopyWith<$Res>(_value.driverLocation!, (value) {
      return _then(_value.copyWith(driverLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderTrackingResponseImplCopyWith<$Res>
    implements $OrderTrackingResponseCopyWith<$Res> {
  factory _$$OrderTrackingResponseImplCopyWith(
          _$OrderTrackingResponseImpl value,
          $Res Function(_$OrderTrackingResponseImpl) then) =
      __$$OrderTrackingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Order order,
      DriverLocation? driverLocation,
      List<OrderStatusHistory> statusHistory,
      String? estimatedArrival,
      bool success,
      String? error});

  @override
  $OrderCopyWith<$Res> get order;
  @override
  $DriverLocationCopyWith<$Res>? get driverLocation;
}

/// @nodoc
class __$$OrderTrackingResponseImplCopyWithImpl<$Res>
    extends _$OrderTrackingResponseCopyWithImpl<$Res,
        _$OrderTrackingResponseImpl>
    implements _$$OrderTrackingResponseImplCopyWith<$Res> {
  __$$OrderTrackingResponseImplCopyWithImpl(_$OrderTrackingResponseImpl _value,
      $Res Function(_$OrderTrackingResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderTrackingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? driverLocation = freezed,
    Object? statusHistory = null,
    Object? estimatedArrival = freezed,
    Object? success = null,
    Object? error = freezed,
  }) {
    return _then(_$OrderTrackingResponseImpl(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order,
      driverLocation: freezed == driverLocation
          ? _value.driverLocation
          : driverLocation // ignore: cast_nullable_to_non_nullable
              as DriverLocation?,
      statusHistory: null == statusHistory
          ? _value._statusHistory
          : statusHistory // ignore: cast_nullable_to_non_nullable
              as List<OrderStatusHistory>,
      estimatedArrival: freezed == estimatedArrival
          ? _value.estimatedArrival
          : estimatedArrival // ignore: cast_nullable_to_non_nullable
              as String?,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderTrackingResponseImpl implements _OrderTrackingResponse {
  const _$OrderTrackingResponseImpl(
      {required this.order,
      this.driverLocation,
      required final List<OrderStatusHistory> statusHistory,
      this.estimatedArrival,
      required this.success,
      this.error})
      : _statusHistory = statusHistory;

  factory _$OrderTrackingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderTrackingResponseImplFromJson(json);

  @override
  final Order order;
  @override
  final DriverLocation? driverLocation;
  final List<OrderStatusHistory> _statusHistory;
  @override
  List<OrderStatusHistory> get statusHistory {
    if (_statusHistory is EqualUnmodifiableListView) return _statusHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statusHistory);
  }

  @override
  final String? estimatedArrival;
  @override
  final bool success;
  @override
  final String? error;

  @override
  String toString() {
    return 'OrderTrackingResponse(order: $order, driverLocation: $driverLocation, statusHistory: $statusHistory, estimatedArrival: $estimatedArrival, success: $success, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderTrackingResponseImpl &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.driverLocation, driverLocation) ||
                other.driverLocation == driverLocation) &&
            const DeepCollectionEquality()
                .equals(other._statusHistory, _statusHistory) &&
            (identical(other.estimatedArrival, estimatedArrival) ||
                other.estimatedArrival == estimatedArrival) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      order,
      driverLocation,
      const DeepCollectionEquality().hash(_statusHistory),
      estimatedArrival,
      success,
      error);

  /// Create a copy of OrderTrackingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderTrackingResponseImplCopyWith<_$OrderTrackingResponseImpl>
      get copyWith => __$$OrderTrackingResponseImplCopyWithImpl<
          _$OrderTrackingResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderTrackingResponseImplToJson(
      this,
    );
  }
}

abstract class _OrderTrackingResponse implements OrderTrackingResponse {
  const factory _OrderTrackingResponse(
      {required final Order order,
      final DriverLocation? driverLocation,
      required final List<OrderStatusHistory> statusHistory,
      final String? estimatedArrival,
      required final bool success,
      final String? error}) = _$OrderTrackingResponseImpl;

  factory _OrderTrackingResponse.fromJson(Map<String, dynamic> json) =
      _$OrderTrackingResponseImpl.fromJson;

  @override
  Order get order;
  @override
  DriverLocation? get driverLocation;
  @override
  List<OrderStatusHistory> get statusHistory;
  @override
  String? get estimatedArrival;
  @override
  bool get success;
  @override
  String? get error;

  /// Create a copy of OrderTrackingResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderTrackingResponseImplCopyWith<_$OrderTrackingResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DriverLocation _$DriverLocationFromJson(Map<String, dynamic> json) {
  return _DriverLocation.fromJson(json);
}

/// @nodoc
mixin _$DriverLocation {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  double? get accuracy => throw _privateConstructorUsedError;
  double? get bearing => throw _privateConstructorUsedError;
  double? get speed => throw _privateConstructorUsedError;

  /// Serializes this DriverLocation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DriverLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriverLocationCopyWith<DriverLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverLocationCopyWith<$Res> {
  factory $DriverLocationCopyWith(
          DriverLocation value, $Res Function(DriverLocation) then) =
      _$DriverLocationCopyWithImpl<$Res, DriverLocation>;
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      DateTime timestamp,
      double? accuracy,
      double? bearing,
      double? speed});
}

/// @nodoc
class _$DriverLocationCopyWithImpl<$Res, $Val extends DriverLocation>
    implements $DriverLocationCopyWith<$Res> {
  _$DriverLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriverLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? timestamp = null,
    Object? accuracy = freezed,
    Object? bearing = freezed,
    Object? speed = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      bearing: freezed == bearing
          ? _value.bearing
          : bearing // ignore: cast_nullable_to_non_nullable
              as double?,
      speed: freezed == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DriverLocationImplCopyWith<$Res>
    implements $DriverLocationCopyWith<$Res> {
  factory _$$DriverLocationImplCopyWith(_$DriverLocationImpl value,
          $Res Function(_$DriverLocationImpl) then) =
      __$$DriverLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      DateTime timestamp,
      double? accuracy,
      double? bearing,
      double? speed});
}

/// @nodoc
class __$$DriverLocationImplCopyWithImpl<$Res>
    extends _$DriverLocationCopyWithImpl<$Res, _$DriverLocationImpl>
    implements _$$DriverLocationImplCopyWith<$Res> {
  __$$DriverLocationImplCopyWithImpl(
      _$DriverLocationImpl _value, $Res Function(_$DriverLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of DriverLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? timestamp = null,
    Object? accuracy = freezed,
    Object? bearing = freezed,
    Object? speed = freezed,
  }) {
    return _then(_$DriverLocationImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      bearing: freezed == bearing
          ? _value.bearing
          : bearing // ignore: cast_nullable_to_non_nullable
              as double?,
      speed: freezed == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverLocationImpl implements _DriverLocation {
  const _$DriverLocationImpl(
      {required this.latitude,
      required this.longitude,
      required this.timestamp,
      this.accuracy,
      this.bearing,
      this.speed});

  factory _$DriverLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverLocationImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final DateTime timestamp;
  @override
  final double? accuracy;
  @override
  final double? bearing;
  @override
  final double? speed;

  @override
  String toString() {
    return 'DriverLocation(latitude: $latitude, longitude: $longitude, timestamp: $timestamp, accuracy: $accuracy, bearing: $bearing, speed: $speed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverLocationImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.bearing, bearing) || other.bearing == bearing) &&
            (identical(other.speed, speed) || other.speed == speed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, latitude, longitude, timestamp, accuracy, bearing, speed);

  /// Create a copy of DriverLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverLocationImplCopyWith<_$DriverLocationImpl> get copyWith =>
      __$$DriverLocationImplCopyWithImpl<_$DriverLocationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverLocationImplToJson(
      this,
    );
  }
}

abstract class _DriverLocation implements DriverLocation {
  const factory _DriverLocation(
      {required final double latitude,
      required final double longitude,
      required final DateTime timestamp,
      final double? accuracy,
      final double? bearing,
      final double? speed}) = _$DriverLocationImpl;

  factory _DriverLocation.fromJson(Map<String, dynamic> json) =
      _$DriverLocationImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  DateTime get timestamp;
  @override
  double? get accuracy;
  @override
  double? get bearing;
  @override
  double? get speed;

  /// Create a copy of DriverLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriverLocationImplCopyWith<_$DriverLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderStatusHistory _$OrderStatusHistoryFromJson(Map<String, dynamic> json) {
  return _OrderStatusHistory.fromJson(json);
}

/// @nodoc
mixin _$OrderStatusHistory {
  OrderStatus get status => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get updatedBy => throw _privateConstructorUsedError;

  /// Serializes this OrderStatusHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderStatusHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderStatusHistoryCopyWith<OrderStatusHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusHistoryCopyWith<$Res> {
  factory $OrderStatusHistoryCopyWith(
          OrderStatusHistory value, $Res Function(OrderStatusHistory) then) =
      _$OrderStatusHistoryCopyWithImpl<$Res, OrderStatusHistory>;
  @useResult
  $Res call(
      {OrderStatus status,
      DateTime timestamp,
      String? note,
      String? updatedBy});
}

/// @nodoc
class _$OrderStatusHistoryCopyWithImpl<$Res, $Val extends OrderStatusHistory>
    implements $OrderStatusHistoryCopyWith<$Res> {
  _$OrderStatusHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderStatusHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? timestamp = null,
    Object? note = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderStatusHistoryImplCopyWith<$Res>
    implements $OrderStatusHistoryCopyWith<$Res> {
  factory _$$OrderStatusHistoryImplCopyWith(_$OrderStatusHistoryImpl value,
          $Res Function(_$OrderStatusHistoryImpl) then) =
      __$$OrderStatusHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrderStatus status,
      DateTime timestamp,
      String? note,
      String? updatedBy});
}

/// @nodoc
class __$$OrderStatusHistoryImplCopyWithImpl<$Res>
    extends _$OrderStatusHistoryCopyWithImpl<$Res, _$OrderStatusHistoryImpl>
    implements _$$OrderStatusHistoryImplCopyWith<$Res> {
  __$$OrderStatusHistoryImplCopyWithImpl(_$OrderStatusHistoryImpl _value,
      $Res Function(_$OrderStatusHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderStatusHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? timestamp = null,
    Object? note = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_$OrderStatusHistoryImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderStatusHistoryImpl implements _OrderStatusHistory {
  const _$OrderStatusHistoryImpl(
      {required this.status,
      required this.timestamp,
      this.note,
      this.updatedBy});

  factory _$OrderStatusHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderStatusHistoryImplFromJson(json);

  @override
  final OrderStatus status;
  @override
  final DateTime timestamp;
  @override
  final String? note;
  @override
  final String? updatedBy;

  @override
  String toString() {
    return 'OrderStatusHistory(status: $status, timestamp: $timestamp, note: $note, updatedBy: $updatedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStatusHistoryImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, timestamp, note, updatedBy);

  /// Create a copy of OrderStatusHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStatusHistoryImplCopyWith<_$OrderStatusHistoryImpl> get copyWith =>
      __$$OrderStatusHistoryImplCopyWithImpl<_$OrderStatusHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderStatusHistoryImplToJson(
      this,
    );
  }
}

abstract class _OrderStatusHistory implements OrderStatusHistory {
  const factory _OrderStatusHistory(
      {required final OrderStatus status,
      required final DateTime timestamp,
      final String? note,
      final String? updatedBy}) = _$OrderStatusHistoryImpl;

  factory _OrderStatusHistory.fromJson(Map<String, dynamic> json) =
      _$OrderStatusHistoryImpl.fromJson;

  @override
  OrderStatus get status;
  @override
  DateTime get timestamp;
  @override
  String? get note;
  @override
  String? get updatedBy;

  /// Create a copy of OrderStatusHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderStatusHistoryImplCopyWith<_$OrderStatusHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReviewResponse _$ReviewResponseFromJson(Map<String, dynamic> json) {
  return _ReviewResponse.fromJson(json);
}

/// @nodoc
mixin _$ReviewResponse {
  String get id => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this ReviewResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewResponseCopyWith<ReviewResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewResponseCopyWith<$Res> {
  factory $ReviewResponseCopyWith(
          ReviewResponse value, $Res Function(ReviewResponse) then) =
      _$ReviewResponseCopyWithImpl<$Res, ReviewResponse>;
  @useResult
  $Res call({String id, String message, bool success, String? error});
}

/// @nodoc
class _$ReviewResponseCopyWithImpl<$Res, $Val extends ReviewResponse>
    implements $ReviewResponseCopyWith<$Res> {
  _$ReviewResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? success = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewResponseImplCopyWith<$Res>
    implements $ReviewResponseCopyWith<$Res> {
  factory _$$ReviewResponseImplCopyWith(_$ReviewResponseImpl value,
          $Res Function(_$ReviewResponseImpl) then) =
      __$$ReviewResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String message, bool success, String? error});
}

/// @nodoc
class __$$ReviewResponseImplCopyWithImpl<$Res>
    extends _$ReviewResponseCopyWithImpl<$Res, _$ReviewResponseImpl>
    implements _$$ReviewResponseImplCopyWith<$Res> {
  __$$ReviewResponseImplCopyWithImpl(
      _$ReviewResponseImpl _value, $Res Function(_$ReviewResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? success = null,
    Object? error = freezed,
  }) {
    return _then(_$ReviewResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewResponseImpl implements _ReviewResponse {
  const _$ReviewResponseImpl(
      {required this.id,
      required this.message,
      required this.success,
      this.error});

  factory _$ReviewResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String message;
  @override
  final bool success;
  @override
  final String? error;

  @override
  String toString() {
    return 'ReviewResponse(id: $id, message: $message, success: $success, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, message, success, error);

  /// Create a copy of ReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewResponseImplCopyWith<_$ReviewResponseImpl> get copyWith =>
      __$$ReviewResponseImplCopyWithImpl<_$ReviewResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewResponseImplToJson(
      this,
    );
  }
}

abstract class _ReviewResponse implements ReviewResponse {
  const factory _ReviewResponse(
      {required final String id,
      required final String message,
      required final bool success,
      final String? error}) = _$ReviewResponseImpl;

  factory _ReviewResponse.fromJson(Map<String, dynamic> json) =
      _$ReviewResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get message;
  @override
  bool get success;
  @override
  String? get error;

  /// Create a copy of ReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewResponseImplCopyWith<_$ReviewResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReviewRequest _$ReviewRequestFromJson(Map<String, dynamic> json) {
  return _ReviewRequest.fromJson(json);
}

/// @nodoc
mixin _$ReviewRequest {
  String get orderId => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;

  /// Serializes this ReviewRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewRequestCopyWith<ReviewRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewRequestCopyWith<$Res> {
  factory $ReviewRequestCopyWith(
          ReviewRequest value, $Res Function(ReviewRequest) then) =
      _$ReviewRequestCopyWithImpl<$Res, ReviewRequest>;
  @useResult
  $Res call({String orderId, int rating, String comment, List<String>? tags});
}

/// @nodoc
class _$ReviewRequestCopyWithImpl<$Res, $Val extends ReviewRequest>
    implements $ReviewRequestCopyWith<$Res> {
  _$ReviewRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? rating = null,
    Object? comment = null,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewRequestImplCopyWith<$Res>
    implements $ReviewRequestCopyWith<$Res> {
  factory _$$ReviewRequestImplCopyWith(
          _$ReviewRequestImpl value, $Res Function(_$ReviewRequestImpl) then) =
      __$$ReviewRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String orderId, int rating, String comment, List<String>? tags});
}

/// @nodoc
class __$$ReviewRequestImplCopyWithImpl<$Res>
    extends _$ReviewRequestCopyWithImpl<$Res, _$ReviewRequestImpl>
    implements _$$ReviewRequestImplCopyWith<$Res> {
  __$$ReviewRequestImplCopyWithImpl(
      _$ReviewRequestImpl _value, $Res Function(_$ReviewRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? rating = null,
    Object? comment = null,
    Object? tags = freezed,
  }) {
    return _then(_$ReviewRequestImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewRequestImpl implements _ReviewRequest {
  const _$ReviewRequestImpl(
      {required this.orderId,
      required this.rating,
      required this.comment,
      final List<String>? tags})
      : _tags = tags;

  factory _$ReviewRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewRequestImplFromJson(json);

  @override
  final String orderId;
  @override
  final int rating;
  @override
  final String comment;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ReviewRequest(orderId: $orderId, rating: $rating, comment: $comment, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewRequestImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, rating, comment,
      const DeepCollectionEquality().hash(_tags));

  /// Create a copy of ReviewRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewRequestImplCopyWith<_$ReviewRequestImpl> get copyWith =>
      __$$ReviewRequestImplCopyWithImpl<_$ReviewRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewRequestImplToJson(
      this,
    );
  }
}

abstract class _ReviewRequest implements ReviewRequest {
  const factory _ReviewRequest(
      {required final String orderId,
      required final int rating,
      required final String comment,
      final List<String>? tags}) = _$ReviewRequestImpl;

  factory _ReviewRequest.fromJson(Map<String, dynamic> json) =
      _$ReviewRequestImpl.fromJson;

  @override
  String get orderId;
  @override
  int get rating;
  @override
  String get comment;
  @override
  List<String>? get tags;

  /// Create a copy of ReviewRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewRequestImplCopyWith<_$ReviewRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderStatusUpdate _$OrderStatusUpdateFromJson(Map<String, dynamic> json) {
  return _OrderStatusUpdate.fromJson(json);
}

/// @nodoc
mixin _$OrderStatusUpdate {
  String get orderId => throw _privateConstructorUsedError;
  OrderStatus get status => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get updatedBy => throw _privateConstructorUsedError;
  DriverLocation? get driverLocation => throw _privateConstructorUsedError;

  /// Serializes this OrderStatusUpdate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderStatusUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderStatusUpdateCopyWith<OrderStatusUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusUpdateCopyWith<$Res> {
  factory $OrderStatusUpdateCopyWith(
          OrderStatusUpdate value, $Res Function(OrderStatusUpdate) then) =
      _$OrderStatusUpdateCopyWithImpl<$Res, OrderStatusUpdate>;
  @useResult
  $Res call(
      {String orderId,
      OrderStatus status,
      DateTime timestamp,
      String? message,
      String? updatedBy,
      DriverLocation? driverLocation});

  $DriverLocationCopyWith<$Res>? get driverLocation;
}

/// @nodoc
class _$OrderStatusUpdateCopyWithImpl<$Res, $Val extends OrderStatusUpdate>
    implements $OrderStatusUpdateCopyWith<$Res> {
  _$OrderStatusUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderStatusUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? status = null,
    Object? timestamp = null,
    Object? message = freezed,
    Object? updatedBy = freezed,
    Object? driverLocation = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      driverLocation: freezed == driverLocation
          ? _value.driverLocation
          : driverLocation // ignore: cast_nullable_to_non_nullable
              as DriverLocation?,
    ) as $Val);
  }

  /// Create a copy of OrderStatusUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DriverLocationCopyWith<$Res>? get driverLocation {
    if (_value.driverLocation == null) {
      return null;
    }

    return $DriverLocationCopyWith<$Res>(_value.driverLocation!, (value) {
      return _then(_value.copyWith(driverLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderStatusUpdateImplCopyWith<$Res>
    implements $OrderStatusUpdateCopyWith<$Res> {
  factory _$$OrderStatusUpdateImplCopyWith(_$OrderStatusUpdateImpl value,
          $Res Function(_$OrderStatusUpdateImpl) then) =
      __$$OrderStatusUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderId,
      OrderStatus status,
      DateTime timestamp,
      String? message,
      String? updatedBy,
      DriverLocation? driverLocation});

  @override
  $DriverLocationCopyWith<$Res>? get driverLocation;
}

/// @nodoc
class __$$OrderStatusUpdateImplCopyWithImpl<$Res>
    extends _$OrderStatusUpdateCopyWithImpl<$Res, _$OrderStatusUpdateImpl>
    implements _$$OrderStatusUpdateImplCopyWith<$Res> {
  __$$OrderStatusUpdateImplCopyWithImpl(_$OrderStatusUpdateImpl _value,
      $Res Function(_$OrderStatusUpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderStatusUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? status = null,
    Object? timestamp = null,
    Object? message = freezed,
    Object? updatedBy = freezed,
    Object? driverLocation = freezed,
  }) {
    return _then(_$OrderStatusUpdateImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      driverLocation: freezed == driverLocation
          ? _value.driverLocation
          : driverLocation // ignore: cast_nullable_to_non_nullable
              as DriverLocation?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderStatusUpdateImpl implements _OrderStatusUpdate {
  const _$OrderStatusUpdateImpl(
      {required this.orderId,
      required this.status,
      required this.timestamp,
      this.message,
      this.updatedBy,
      this.driverLocation});

  factory _$OrderStatusUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderStatusUpdateImplFromJson(json);

  @override
  final String orderId;
  @override
  final OrderStatus status;
  @override
  final DateTime timestamp;
  @override
  final String? message;
  @override
  final String? updatedBy;
  @override
  final DriverLocation? driverLocation;

  @override
  String toString() {
    return 'OrderStatusUpdate(orderId: $orderId, status: $status, timestamp: $timestamp, message: $message, updatedBy: $updatedBy, driverLocation: $driverLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStatusUpdateImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.driverLocation, driverLocation) ||
                other.driverLocation == driverLocation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, status, timestamp,
      message, updatedBy, driverLocation);

  /// Create a copy of OrderStatusUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStatusUpdateImplCopyWith<_$OrderStatusUpdateImpl> get copyWith =>
      __$$OrderStatusUpdateImplCopyWithImpl<_$OrderStatusUpdateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderStatusUpdateImplToJson(
      this,
    );
  }
}

abstract class _OrderStatusUpdate implements OrderStatusUpdate {
  const factory _OrderStatusUpdate(
      {required final String orderId,
      required final OrderStatus status,
      required final DateTime timestamp,
      final String? message,
      final String? updatedBy,
      final DriverLocation? driverLocation}) = _$OrderStatusUpdateImpl;

  factory _OrderStatusUpdate.fromJson(Map<String, dynamic> json) =
      _$OrderStatusUpdateImpl.fromJson;

  @override
  String get orderId;
  @override
  OrderStatus get status;
  @override
  DateTime get timestamp;
  @override
  String? get message;
  @override
  String? get updatedBy;
  @override
  DriverLocation? get driverLocation;

  /// Create a copy of OrderStatusUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderStatusUpdateImplCopyWith<_$OrderStatusUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
