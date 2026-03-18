import 'dart:async';

import 'package:convenience_types/errors/app_error.dart';
import 'package:convenience_types/types/maybe.dart';
import 'package:convenience_types/types/unit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

/// A type-safe way to model operations that can succeed or fail.
///
/// [Result]\<ResultType> is a union type with two variants:
/// - [Success]\<ResultType> — carries a value of type [ResultType]
/// - [Failure] — carries an [AppError] describing what went wrong
///
/// Using [Result] instead of throwing or returning nullable values makes
/// success and failure explicit and forces both cases to be handled, typically
/// via [handle], pattern matching, or the [mapSuccess] / [mapFailure] methods.
///
/// Example — handling a result:
/// ```dart
/// Result<String> result = await fetchUserName();
/// final message = result.handle(
///   onSuccess: (name) => 'Hello, $name',
///   onFailure: (error) => 'Error: ${error.message}',
/// );
/// ```
///
/// Example — pattern matching:
/// ```dart
/// switch (result) {
///   Success(:final data) => print(data),
///   Failure(:final error) => showError(error),
/// }
/// ```
@Freezed()
sealed class Result<ResultType> with _$Result<ResultType> {
  const Result._();

  /// Success case carrying [data] of type [ResultType].
  const factory Result.success(ResultType data) = Success<ResultType>;

  /// Failure case carrying an [AppError].
  const factory Result.failure(AppError error) = Failure;

  /// True if this is [Success].
  bool get isSuccess => this is Success;

  /// True if this is [Failure].
  bool get isFailure => this is Failure;

  /// Casts to [Success]\<ResultType>; throws if this is [Failure]. Prefer pattern matching when possible.
  Success<ResultType> get asSuccess => this as Success<ResultType>;

  /// Casts to [Failure]\<AppError>; throws if this is [Success]. Prefer pattern matching when possible.
  Failure<AppError> get asFailure => this as Failure<AppError>;

  /// Handles both outcomes: calls [onSuccess] with the value when [Success], [onFailure] with the error when [Failure]. Returns the callback's return value.
  T handle<T>({
    required T Function(ResultType data) onSuccess,
    required T Function(AppError error) onFailure,
  }) {
    if (this is Success) {
      return onSuccess((this as Success).data);
    } else {
      return onFailure((this as Failure).error);
    }
  }

  /// If [Success], applies [combiner] to the value and returns the result; if [Failure], returns the same [Failure].
  // ignore: empty_constructor_bodies
  Result<K> mapSuccess<K>(
    Result<K> Function(ResultType) combiner,
  ) {
    return handle(
        onSuccess: (data) => combiner(data),
        onFailure: (error) => Failure(error));
  }

  /// Async version of [mapSuccess]: if [Success], runs [combiner] on the value; if [Failure], returns the same [Failure].
  // ignore: empty_constructor_bodies
  FutureOr<Result<K>> mapAsyncSuccess<K>(
    FutureOr<Result<K>> Function(ResultType) combiner,
  ) {
    return handle(
        onSuccess: (data) => combiner(data),
        onFailure: (error) => Failure(error));
  }

  /// If [Failure], applies [combiner] to the error and returns the result; if [Success], returns this [Result] unchanged.
  Result mapFailure<K>(
    Result<K> Function(AppError error) combiner,
  ) {
    return handle(
        onSuccess: (_) => identity(this),
        onFailure: (error) => combiner(error));
  }

  /// Async version of [mapFailure]: if [Failure], runs [combiner] on the error; if [Success], returns this [Result] unchanged.
  FutureOr<Result> mapAsyncFailure<K>(
    FutureOr<Result<K>> Function(AppError error) combiner,
  ) {
    return handle(
        onSuccess: (_) => identity(this),
        onFailure: (error) => combiner(error));
  }

  /// Converts to [Maybe]: [Success] → [Just](data), [Failure] → [Nothing].
  Maybe<ResultType> get maybeData => handle(
        onSuccess: (data) => Just(data),
        onFailure: (_) => Nothing<ResultType>(),
      );

  /// Folds the result: applies [onError] with the error when [Failure],
  /// [onSuccess] with the value when [Success]. Returns the callback's return value.
  ///
  /// This is an alias for [handle] with a more traditional FP naming convention.
  T fold<T>(
    T Function(AppError error) onError,
    T Function(ResultType data) onSuccess,
  ) =>
      handle(onSuccess: onSuccess, onFailure: onError);

  /// Returns [fallback] when [Failure], otherwise returns this [Result] unchanged.
  Result<ResultType> orElse(Result<ResultType> fallback) {
    return handle(
      onSuccess: (_) => identity(this),
      onFailure: (_) => fallback,
    );
  }

  /// Applies [factory] to the error when [Failure] and returns the result;
  /// returns this [Result] unchanged when [Success].
  Result<ResultType> orElseGet(Result<ResultType> Function(AppError error) factory) {
    return handle(
      onSuccess: (_) => identity(this),
      onFailure: (error) => factory(error),
    );
  }
}
