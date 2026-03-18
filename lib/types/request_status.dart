import 'package:convenience_types/errors/app_error.dart';
import 'package:convenience_types/types/types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_status.freezed.dart';

/// A type-safe way to model the lifecycle of an asynchronous request in the UI.
///
/// [RequestStatus]\<ResultType> is a union type with four states:
/// - [Idle] — the request has not been fired yet
/// - [Loading] — the request is in flight
/// - [Succeeded]\<ResultType> — the request completed successfully; carries [data]
/// - [Failed] — the request failed; carries an [AppError]
///
/// Use [RequestStatus.fromResult] to build a status directly from a [Result].
///
/// To deal with the request states one should use Dart's native pattern matching.
/// The `switch` statement or expression forces you to deal with all four states explicitly.
///
/// Example:
/// ```dart
///
///   Widget build(context) {
///
///     final someRequestStatus = someStateManagement.desiredRequestStatus;
///
///     return switch (someRequestStatus) {
///       Idle() => const Text("widget for idle state"),
///       Loading() => const Text("widget for loading state"),
///       Succeeded(:final data) => Text("widget for succeeded state using $data"),
///       Failed(:final error) => Text("widget for failed state using ${error.msg}"),
///     };
///
///   }
///
/// ```
///
/// You can also handle only the states you care about using a default case `_`:
///
/// Example:
/// ```dart
///
///   Widget build(context) {
///
///     final someRequestStatus = someStateManagement.desiredRequestStatus;
///
///     return switch (someRequestStatus) {
///       Loading() => const Text("widget for loading state"),
///       Succeeded(:final data) => Text("widget for succeeded state using $data"),
///       _ => const Text("default widget to be displayed otherwise"),
///     };
///
///   }
///
/// ```
///
/// So, `RequestStatus` provides a safe and declarative way to always deal with all possible states of a request.

@freezed
sealed class RequestStatus<ResultType> with _$RequestStatus<ResultType> {
  const RequestStatus._();

  /// Type representing the [Idle] state of a request still not fired
  const factory RequestStatus.idle() = Idle;

  /// Type representing the [Loading] state of a request when it is waiting for a response
  const factory RequestStatus.loading() = Loading;

  /// Type representing the [Succeeded] state of a request when it is successful, bringing possibly the modeled response data
  const factory RequestStatus.succeeded(ResultType data) =
      Succeeded<ResultType>;

  /// Type representing the [Failed] state of a request when it is not successful, bringing possibly the modeled error
  const factory RequestStatus.failed(AppError error) = Failed;

  /// Factory for helping building a [RequestStatus] from a [Result] input. It produces a [Failed] status if the input is a [Failure], and a [Succeeded] otherwise
  factory RequestStatus.fromResult(Result<ResultType> result) => result.handle(
        onSuccess: (data) => Succeeded(data),
        onFailure: (error) => Failed(error),
      );

  /// Getter that results in a [Maybe] that is [Just] if the [RequestStatus] is [Succeeded] and [Nothing] otherwise
  Maybe<ResultType> get maybeData => switch (this) {
        Succeeded(:final data) => Just(data),
        _ => Nothing<ResultType>(),
      };

  /// True if this is [Idle].
  bool get isIdle => this is Idle;

  /// True if this is [Loading].
  bool get isLoading => this is Loading;

  /// True if this is [Succeeded].
  bool get isSucceeded => this is Succeeded;

  /// True if this is [Failed].
  bool get isFailed => this is Failed;

  /// Cast [this] into an [Idle], and throw an exception if the cast fails!
  /// `It might be tempting to just cast the RequestStatus into the desired type, but it's `
  /// `strongly advised to not do that indiscriminately`. Although, it might be convenient to have
  /// this cast sometimes. Use it wisely!
  Idle get asIdle => this as Idle;

  /// Cast [this] into a [Loading], and throw an exception if the cast fails!
  /// `It might be tempting to just cast the RequestStatus into the desired type, but it's `
  /// `strongly advised to not do that indiscriminately`. Although, it might be convenient to have
  /// this cast sometimes. Use it wisely!
  Loading get asLoading => this as Loading;

  /// Cast [this] into a [Succeeded], and throw an exception if the cast fails!
  /// `It might be tempting to just cast the RequestStatus into the desired type, but it's `
  /// `strongly advised to not do that indiscriminately`. Although, it might be convenient to have
  /// this cast sometimes. Use it wisely!
  Succeeded get asSucceeded => this as Succeeded;

  /// Cast [this] into a [Failed], and throw an exception if the cast fails!
  /// `It might be tempting to just cast the RequestStatus into the desired type, but it's `
  /// `strongly advised to not do that indiscriminately`. Although, it might be convenient to have
  /// this cast sometimes. Use it wisely!
  Failed get asFailed => this as Failed;

  /// If [Succeeded], applies [combiner] to the data and returns the result;
  /// returns this [RequestStatus] unchanged otherwise.
  RequestStatus<ResultType> mapSucceeded(RequestStatus<ResultType> Function(ResultType) combiner) {
    return switch (this) {
      Succeeded(:final data) => combiner(data),
      _ => identity(this),
    };
  }

  /// If [Failed], applies [combiner] to the error and returns the result;
  /// returns this [RequestStatus] unchanged otherwise.
  RequestStatus<ResultType> mapFailed(RequestStatus<ResultType> Function(AppError error) combiner) {
    return switch (this) {
      Failed(:final error) => combiner(error),
      _ => identity(this),
    };
  }
}
