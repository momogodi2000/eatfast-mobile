/// Base result type for handling success and error states
sealed class Result<T, E> {
  const Result();

  /// Create a successful result
  factory Result.success(T data) = Success<T, E>;

  /// Create a failure result
  factory Result.failure(E error) = Failure<T, E>;

  /// Transform result when successful
  Result<R, E> map<R>(R Function(T) transform) {
    return switch (this) {
      Success(data: final data) => Result.success(transform(data)),
      Failure(error: final error) => Result.failure(error),
    };
  }

  /// Handle both success and failure cases
  R when<R>({
    required R Function(T data) success,
    required R Function(E error) failure,
  }) {
    return switch (this) {
      Success(data: final data) => success(data),
      Failure(error: final error) => failure(error),
    };
  }

  /// Check if result is successful
  bool get isSuccess => this is Success<T, E>;

  /// Check if result is failure
  bool get isFailure => this is Failure<T, E>;

  /// Get data if successful, null otherwise
  T? get dataOrNull {
    return switch (this) {
      Success(data: final data) => data,
      Failure() => null,
    };
  }

  /// Get error if failure, null otherwise
  E? get errorOrNull {
    return switch (this) {
      Success() => null,
      Failure(error: final error) => error,
    };
  }
}

/// Success result containing data
final class Success<T, E> extends Result<T, E> {
  const Success(this.data);
  final T data;

  @override
  String toString() => 'Success(data: $data)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Success<T, E> && other.data == data);
  }

  @override
  int get hashCode => data.hashCode;
}

/// Failure result containing error
final class Failure<T, E> extends Result<T, E> {
  const Failure(this.error);
  final E error;

  @override
  String toString() => 'Failure(error: $error)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Failure<T, E> && other.error == error);
  }

  @override
  int get hashCode => error.hashCode;
}
