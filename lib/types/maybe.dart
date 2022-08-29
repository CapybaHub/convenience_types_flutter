import 'package:freezed_annotation/freezed_annotation.dart';

part 'maybe.freezed.dart';

/// Dealing with optional values ​​in ui has always been verbose and unsafe.
/// So the
/// ```dart
/// Maybe<T>
/// ```
/// generic union type is a convinience type to model
/// and help safelly deal with any optional value outcomes.
///
/// Where we can have two types that will represent the state of a value that can be null. The [Nothing], representing when it has no value, and the [Just], when it has a value.
///
/// The approach is declarative, so in order to deal with the states of [Maybe], one
/// should use one of the unions methods.
/// The `.map` forces you to deal with all the two states explicitly, passing callbacks for
/// each state with undestructured states.
///
/// Example:
/// ```dart
///
///
///     Maybe<String> someMaybeValue = Just("test");
///
///     final debugValue = someMaybeValue.map(
///         nothing: (_) => "",
///         just: (data) => data.value,
///     );
///
///     print(debugValue); // test
///
///
///
/// ```
/// The `.when` forces you to deal with all the two states explicitly, passing callbacks for
/// each state with destructured states.
///
/// Example:
/// ```dart
///
///     Maybe<String> someMaybeValue = Nothing();
///
///     final debugValue = someMaybeValue.map(
///         nothing: () => "test",
///         just: (data) => data,
///     );
///
///     print(debugValue); // test
///
///
/// ```
/// and one also might want to not deal explicitly with all states diferently, so
/// there are the `.maybeMap`, and `.maybeWhen` methods where you need only expclitly to pass a
/// `orElse` callback. But I would say that it is not so useful in this case since we only have two states to be treated.
///
/// Example:
/// ```dart
///
///     Maybe<String> someMaybeValue = Just("test");
///
///     final debugValue = someMaybeValue.maybeWhen(
///         just: (data) => data,
///         orElse() => "",
///     );
///
///     print(debugValue); // test
///
///
/// ```
///
/// So, `Maybe` provides a safe and declarative way to always deal with the two possible states of a optional value.
@freezed
class Maybe<T> with _$Maybe<T> {
  const Maybe._();

  /// Type representing the [Nothing] state of a value, which would be equivalent to having a null value
  const factory Maybe.nothing() = Nothing;

  /// Type representing the [Just] state of a value, which would be equivalent to having a value
  const factory Maybe.just(T value) = Just<T>;

  bool get isNothing => this is Nothing;
  bool get isJust => this is Just;

  /// Cast [this] into a [Nothing], and throw an exception if the cast fails!
  /// `It might be tempting to just cast the Maybe into the desired type, but it's `
  /// `strongly advised to not do that indiscriminately`. Although, it might be convenient to have
  /// this cast sometimes. Use it wisely!
  Nothing get asNothing => this as Nothing;

  /// Cast [this] into a [Just], and throw an exception if the cast fails!
  /// `It might be tempting to just cast the Maybe into the desired type, but it's `
  /// `strongly advised to not do that indiscriminately`. Although, it might be convenient to have
  /// this cast sometimes. Use it wisely!
  Just<T> get asJust => this as Just<T>;

  /// The [getOrElse] method which receives a parameter to return as a
  /// fallback value, when the value is a [Nothing], or there is
  /// no value in the [Just].
  getOrElse(fallback) {
    return map(
      nothing: (_) => fallback,
      just: (just) => just.value ?? fallback,
    );
  }
}
