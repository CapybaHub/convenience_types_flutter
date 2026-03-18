import 'package:freezed_annotation/freezed_annotation.dart';

part 'try.freezed.dart';

/// A type representing a computation that may either result in an exception, or return a successfully computed value.
///
/// [Try] is similar to [Either] or [Result], but its semantics are specifically geared
/// towards capturing exceptions thrown during computation.
@Freezed()
sealed class Try<T> with _$Try<T> {
  const Try._();

  /// Represents a successful computation.
  const factory Try.success(T value) = TrySuccess;

  /// Represents a failed computation, capturing the exception and optional stack trace.
  const factory Try.failure(Object exception, [StackTrace? stackTrace]) = TryFailure;

  /// Executes [computation] and catches any synchronous exceptions, wrapping
  /// the result in a [Try].
  static Try<T> guard<T>(T Function() computation) {
    try {
      return Try.success(computation());
    } catch (e, s) {
      return Try.failure(e, s);
    }
  }

  /// True if this is [TrySuccess].
  bool get isSuccess => this is TrySuccess;

  /// True if this is [TryFailure].
  bool get isFailure => this is TryFailure;

  /// Folds the Try into a single value.
  R fold<R>(
    R Function(Object exception, StackTrace? stackTrace) onFailure,
    R Function(T value) onSuccess,
  ) {
    if (this is TrySuccess) {
      return onSuccess((this as TrySuccess<T>).value);
    } else {
      final failure = this as TryFailure<T>;
      return onFailure(failure.exception, failure.stackTrace);
    }
  }

  /// Transforms the successful value if [TrySuccess].
  Try<R> map<R>(R Function(T value) combiner) {
    return fold(
      (e, s) => TryFailure<R>(e, s),
      (v) => TrySuccess<R>(combiner(v)),
    );
  }

  /// Returns the value if successful, otherwise returns [fallback].
  T getOrElse(T Function(Object exception, StackTrace? stackTrace) fallback) {
    return fold(
      (e, s) => fallback(e, s),
      (v) => v,
    );
  }
}
