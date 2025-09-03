/// Minimal Result wrapper used across the codebase.
/// Simple abstract class with Success and Failure subclasses.
abstract class Result<T, E> {
  const Result();

  R when<R>({required R Function(T value) success, required R Function(E error) failure});

  bool get isSuccess => this is Success<T, E>;
  bool get isFailure => this is Failure<T, E>;
}

class Success<T, E> extends Result<T, E> {
  final T value;
  const Success(this.value);

  @override
  R when<R>({required R Function(T value) success, required R Function(E error) failure}) => success(value);

  @override
  String toString() => 'Success($value)';
}

class Failure<T, E> extends Result<T, E> {
  final E error;
  const Failure(this.error);

  @override
  R when<R>({required R Function(T value) success, required R Function(E error) failure}) => failure(error);

  @override
  String toString() => 'Failure($error)';
}
