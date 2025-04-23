import 'package:convenience_types/errors/app_error.dart';
import 'package:convenience_types/types/types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_status.freezed.dart';

/// When one is dealing with ui responses to different request states, in the course of it,
/// usually there are four states of interest [Idle], [Loading], [Succeded] or [Failed].
///
/// So the convenience generic union type
/// ```dart
/// RequestStatus<ResultType>
/// ```
/// serves the purpose of modeling those states. [Idle] and [Loading], carry no inner state, but
/// ```dart
/// Succeeded<ResultType>().data = ResultType data;
/// ```
/// contains a field `data` of type `ResultType`. And the
/// ```dart
/// Failed().error = AppError error;
/// ```
/// contains a field `error` of type `AppError`. Where `AppError` is the convenience type
/// that models errors in the app.
///
///
/// To deal with the request states one should use one of the unions methods.
/// The `.map` forces you to deal with all the four states explicitly, passing callbacks for
/// each state with undestructured states.
///
/// Example:
/// ```dart
///
///   Widget build(context) {
///
///     final someRequestStatus = someStateManagement.desiredRequestStatus;
///
///     return someRequestStatus.map(
///               idle: (idle) => "widget for idle state",
///               loading: (loading) => "widget for loading state",
///               succeeded: (succeeded) => "widget for succeeded state using possibly data within succeeded.data",
///               failed: (failed) => "widget for failed state using possibly AppError within failed.error",
///           );
///
///   }
///
///
/// ```
/// The `.when` forces you to deal with all the four states explicitly, passing callbacks for
/// each state with destructured states.
/// /// Example:
/// ```dart
///
///   Widget build(context) {
///
///     final someRequestStatus = someStateManagement.desiredRequestStatus;
///
///     return someRequestStatus.when(
///               idle: () => "widget for idle state",
///               loading: () => "widget for loading state",
///               succeeded: (data) => "widget for succeeded state using possibly data within data",
///               failed: (error) => "widget for failed state using possibly AppError within error",
///           );
///
///   }
///
///
/// ```
///
/// and one also might want to not deal explicitly with all states diferently, so
/// there are the `.maybeMap`, and `.maybeWhen` methods where you need only expclitly to pass a
/// `orElse` callback.
///
/// Example:
/// ```dart
///
///   Widget build(context) {
///
///     final someRequestStatus = someStateManagement.desiredRequestStatus;
///
///     return someRequestStatus.maybeWhen(
///               orElse: () => "default widget to be displayed other wise the current state is not specified in other callbacks"
///               loading: () => "widget for loading state",
///               succeeded: (data) => "widget for succeeded state using possibly data within succeeded.data",
///           );
///
///   }
///
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

  bool get isIdle => this is Idle;
  bool get isLoading => this is Loading;
  bool get isSucceeded => this is Succeeded;
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
}
