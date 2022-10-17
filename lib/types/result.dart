import 'package:convenience_types/errors/app_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@Freezed(
  map: FreezedMapOptions(
    map: false,
    mapOrNull: false,
    maybeMap: false,
  ),
  when: FreezedWhenOptions(
    maybeWhen: false,
    when: false,
    whenOrNull: false,
  ),
)

/// Every asynchronus task can have two possible outcomes as a [Result].
/// It is either a [Success] or a [Failure].
/// So the
/// ```dart
/// Result<ResultType>
/// ```
/// generic union type is a convenience type to model
/// and help safelly deal with any asynchronus task outcomes
///
/// The approach is declarative, so in order to deal with the result, one
/// should call the [handle] method which has two required parameters
/// an onSuccess callback
/// ```dart
/// Type onSuccess(Type data)
/// ```
/// and an [onFailure] callback
/// ```dart
/// Type onFailure(AppError data)
/// ```
/// Where AppError is a convenience type to model errors in the application
///
/// Example:
///
/// ```dart
/// Result<String> asyncTaskResturningStringResult = await someFutureOfResultString();
///
/// asyncTaskResturningStringResult.handle(
///   onSuccess: (String data) {
///     "here one have access to the succesful value of the async task and might use it as desired"
///   },
///   onFailure: (AppError error) {
///     "here one have access to the failure modeled as AppError representing this async task"
///   }
/// );
/// ```
///
/// In this way one always needs to deal in a declarative way with both the
/// success and failure possible outcomes as unfortunatelly any asynchronus
/// task needs
class Result<ResultType> with _$Result<ResultType> {
  const Result._();

  /// Type representing the [Success] case of a [Result] of a asynchronus task
  /// possible outcome
  const factory Result.success(ResultType data) = Success<ResultType>;

  /// Type representing the [Failure] case of a [Result] of a asynchronus task
  /// possible outcome
  const factory Result.failure(AppError error) = Failure;

  bool get isSuccess => this is Success;
  bool get isFailure => this is Failure;

  /// Cast [this] into a [Success], and throw an exception if the cast fails!
  /// `It might be tempting to just cast the result into the desired type, but it's `
  /// `strongly advised to not do that`. Although, it might be convenient to have
  /// this cast sometimes. Use it wisely!
  Success<ResultType> get asSuccess => this as Success<ResultType>;

  /// Cast [this] into a [Failure], and throw an exception if the cast fails!
  /// `It might be tempting to just cast the result into the desired type, but it's `
  /// `strongly advised to not do that`. Although, it might be convenient to have
  /// this cast sometimes. Use it wisely!
  Failure<AppError> get asFailure => this as Failure<AppError>;

  /// the [handle] method which has two required parameters
  /// an onSuccess callback
  /// ```dart
  /// Type onSuccess(Type data)
  /// ```
  /// and an [onFailure] callback
  /// ```dart
  /// Type onFailure(AppError data)
  /// ```
  /// Where AppError is a convenience type to model errors in the application
  ///
  /// Example:
  ///
  /// ```dart
  /// Result<String> asyncTaskResturningStringResult = await someFutureOfResultString();
  ///
  /// asyncTaskResturningStringResult.handle(
  ///   onSuccess: (String data) {
  ///     "here one have access to the succesful value of the async task and might use it as desired"
  ///   },
  ///   onFailure: (AppError error) {
  ///     "here one have access to the failure modeled as AppError representing this async task"
  ///   }
  /// );
  /// ```
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

  /// Method chain access to data held by the [Result]. If `this` is [Failure] returns [Failure], if `this` is [Success], returns the result of the `combiner` method over the `data` inside [Success]
  Result<K> mapSuccess<K>(Result<K> Function(ResultType) combiner) {
    return handle(
        onSuccess: (data) => combiner(data),
        onFailure: (error) => Failure(error));
  }
}
