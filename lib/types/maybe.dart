import 'dart:async';

import 'package:convenience_types/types/request_status.dart';
import 'package:convenience_types/types/result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'maybe.freezed.dart';

/// Dealing with optional values ​​in ui has always been verbose and unsafe.
/// So the
/// ```dart
/// Maybe<T>
/// ```
/// generic union type is a convenience type to model
/// and help safelly deal with any optional value outcomes.
///
/// Where we can have two types that will represent the state of a value that can be null. The [Nothing], representing when it has no value, and the [Just], when it has a value.
///
/// The approach is declarative, so in order to deal with the states of [Maybe], one
/// should use one of the dart patern matching.
/// ///
/// Example:
/// ```dart
///
///
///     Maybe<String> someMaybeValue = Just("test");
///
///     final debugValue = switch(someMaybeValue) {
///         Nothing() => "",
///         Just(:final value) => value,
///     };
///
///     print(debugValue); // test
///
///
///
/// ```
///
///
/// So, `Maybe` provides a safe and declarative way to always deal with the two possible states of a optional value.
@freezed
sealed class Maybe<T> with _$Maybe<T> {
  const Maybe._();

  /// Type representing the [Nothing] state of a value, which would be equivalent to having a null value
  const factory Maybe.nothing() = Nothing;

  /// Type representing the [Just] state of a value, which would be equivalent to having a value
  const factory Maybe.just(T value) = Just<T>;

  /// Factory for helping building a [Maybe] from a nullable input. It produces a [Nothing] if the input is null, and a [Just] otherwise
  factory Maybe.from(T? input) {
    if (input == null) {
      return Nothing<T>();
    } else {
      return Just<T>(input);
    }
  }

  /// Factory for helping building a [Maybe] from a [Result] input. It produces a [Nothing] if the input is [Failure], and a [Just] if the input is [Success]
  factory Maybe.fromResult(Result<T> input) {
    return input.handle(
      onSuccess: (data) => Just<T>(data),
      onFailure: (_) => Nothing<T>(),
    );
  }

  /// Factory for helping building a [Maybe] from a [RequestStatus] input. It produces a [Just] if the input is [Succeeded], and a [Nothing] otherwise
  factory Maybe.fromRequest(RequestStatus<T> input) {
    return switch (input) {
      Succeeded(:final data) => Just(data),
      _ => Nothing<T>(),
    };
  }

  /// A method to chain access to data held by the [Maybe]. If `this` is [Nothing] returns [Nothing], if `this` is [Just], returns the result of the `combiner` method over the `value` inside [Just]
  Maybe<K> mapJust<K>(Maybe<K> Function(T) combiner) {
    return switch (this) {
      Nothing<T>() => Nothing<K>(),
      Just<T>(:final value) => combiner(value),
    };
  }

  /// A Method to chain async access to data held by the [Maybe]. If `this` is [Nothing] returns [Nothing], if `this` is [Just], returns the result of the `combiner` method over the `value` inside [Just]
  FutureOr<Maybe<K>> mapAsyncJust<K>(FutureOr<Maybe<K>> Function(T) combiner) {
    return switch (this) {
      Nothing<T>() => Nothing<K>(),
      Just<T>(:final value) => combiner(value),
    };
  }

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
  Type getOrElse<Type>(Type fallback) {
    fallbackOrValue(T value) {
      if (value == null) {
        return fallback;
      } else {
        return value is Type ? value as Type : fallback;
      }
    }

    return switch (this) {
      Nothing<T>() => fallback,
      Just<T>(:final value) => fallbackOrValue(value),
    };
  }
}

extension MaybeRecordX<K, J> on (Maybe<K>, Maybe<J>) {
  /// Use it to combine two different Maybe's into a new one. Input `firstJust` to map case where only the first value is [Just], `secondJust` to map case where only the second value is [Just], `bothJust` to map case where both first and second value are [Just] and `bothNothing` to map case where both are [Nothing]
  /// Example:
  /// ```dart
  ///
  ///     Maybe<Number> combined = (testString, testInt).maybeCombine<Number>(
  ///       bothJust: (val, number) => Just(Number(val, number, '$number$val',)),
  ///       firstJust: (val) => Just(Number(val, -1, '-1$val',)),
  ///       secondJust: (number) => Just(Number('not a trivia', number, 'NonTrivia',)),
  ///       bothNothing: () => Just(Number('not a trivia', -1, 'NonTrivia',)),
  ///     );
  ///
  ///
  /// ```
  Maybe<T> maybeCombine<T>({
    /// Used to map case where only the first value is [Just]
    Maybe<T> Function(K)? firstJust,

    /// Used to map case where only the second value is [Just]
    Maybe<T> Function(J)? secondJust,

    /// Used to map case where both values are [Just]
    Maybe<T> Function(K, J)? bothJust,

    /// Used to map case where both values are [Nothing]
    Maybe<T> Function()? bothNothing,
  }) {
    return switch ($1) {
      Nothing<K>() => switch ($2) {
          Nothing<J>() => bothNothing != null ? bothNothing() : Nothing<T>(),
          Just<J>(:final value) =>
            secondJust != null ? secondJust(value) : Nothing<T>(),
        },
      Just<K>(:final value) => switch ($2) {
          Nothing<J>() => firstJust != null ? firstJust(value) : Nothing<T>(),
          Just<J>(:final value) =>
            bothJust != null ? bothJust($1.asJust.value, value) : Nothing<T>(),
        },
    };
  }

  /// Use it to asynchronously combine two different Maybe's into a new one. Input `firstJust` to map case where only the first value is [Just], `secondJust` to map case where only the second value is [Just], `bothJust` to map case where both first and second value are [Just] and `bothNothing` to map case where both are [Nothing]
  /// Example:
  /// ```dart
  ///
  ///     Maybe<Number> combined = await (testString, testInt).maybeAsyncCombine<Number>(
  ///       bothJust: (val, number) async => await ...,
  ///       firstJust: (val) async => await ...,
  ///       secondJust: (number) async => await ...,
  ///       bothNothing: () async => await ....,
  ///     );
  ///
  ///
  /// ```
  FutureOr<Maybe<T>> maybeAsyncCombine<T>({
    /// Used to map case where only the first value is [Just]
    FutureOr<Maybe<T>> Function(K)? firstJust,

    /// Used to map case where only the second value is [Just]
    FutureOr<Maybe<T>> Function(J)? secondJust,

    /// Used to map case where both values are [Just]
    FutureOr<Maybe<T>> Function(K, J)? bothJust,

    /// Used to map case where both values are [Nothing]
    FutureOr<Maybe<T>> Function()? bothNothing,
  }) {
    return switch ($1) {
      Nothing<K>() => switch ($2) {
          Nothing<J>() => bothNothing != null ? bothNothing() : Nothing<T>(),
          Just<J>(:final value) =>
            secondJust != null ? secondJust(value) : Nothing<T>(),
        },
      Just<K>(:final value) => switch ($2) {
          Nothing<J>() => firstJust != null ? firstJust(value) : Nothing<T>(),
          Just<J>(:final value) =>
            bothJust != null ? bothJust($1.asJust.value, value) : Nothing<T>(),
        },
    };
  }
}
