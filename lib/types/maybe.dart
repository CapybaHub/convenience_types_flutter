import 'dart:async';

import 'package:convenience_types/types/request_status.dart';
import 'package:convenience_types/types/result.dart';
import 'package:convenience_types/types/unit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'maybe.freezed.dart';

/// A type-safe, declarative way to model optional values.
///
/// [Maybe]\<T> is a union type with two variants:
/// - [Nothing] — no value (type-safe alternative to null)
/// - [Just]\<T> — a value of type T
///
/// Using [Maybe] instead of nullable types (T?) makes the "present or absent"
/// distinction explicit in the type system and forces handling both cases,
/// typically via pattern matching or the provided methods ([mapJust], [mapNothing],
/// [getOrElse]).
///
/// Example — pattern matching:
/// ```dart
/// Maybe<String> name = Just("test");
/// final display = switch (name) {
///   Nothing() => "",
///   Just(:final value) => value,
/// };
/// ```
///
/// Example — from nullable input:
/// ```dart
/// Maybe.from(null);   // Nothing()
/// Maybe.from("hi");   // Just("hi")
/// ```
///
/// Example — [Result] to [Maybe] (discard error, keep success):
/// ```dart
/// Maybe.fromResult(someResult);  // Just(data) or Nothing()
/// ```
@freezed
sealed class Maybe<T> with _$Maybe<T> {
  const Maybe._();

  /// No value present (type-safe alternative to null).
  const factory Maybe.nothing() = Nothing;

  /// A present value of type [T].
  const factory Maybe.just(T value) = Just<T>;

  /// Builds a [Maybe] from a nullable [input]: [Nothing] if null, [Just] otherwise.
  factory Maybe.from(T? input) {
    if (input == null) {
      return Nothing<T>();
    } else {
      return Just<T>(input);
    }
  }

  /// Converts a [Result] to a [Maybe]: [Success] → [Just], [Failure] → [Nothing].
  factory Maybe.fromResult(Result<T> input) {
    return input.handle(
      onSuccess: (data) => Just<T>(data),
      onFailure: (_) => Nothing<T>(),
    );
  }

  /// Converts a [RequestStatus] to a [Maybe]: [Succeeded] → [Just], otherwise [Nothing].
  factory Maybe.fromRequest(RequestStatus<T> input) {
    return switch (input) {
      Succeeded(:final data) => Just(data),
      _ => Nothing<T>(),
    };
  }

  /// If [Just], applies [combiner] to the value and returns the result; if [Nothing], returns [Nothing].
  Maybe<K> mapJust<K>(Maybe<K> Function(T) combiner) {
    return switch (this) {
      Nothing<T>() => Nothing<K>(),
      Just<T>(:final value) => combiner(value),
    };
  }

  /// Async version of [mapJust]: if [Just], runs [combiner] on the value; if [Nothing], returns [Nothing].
  FutureOr<Maybe<K>> mapAsyncJust<K>(FutureOr<Maybe<K>> Function(T) combiner) {
    return switch (this) {
      Nothing<T>() => Nothing<K>(),
      Just<T>(:final value) => combiner(value),
    };
  }

  /// If [Nothing], applies [combiner] and returns the result; if [Just], returns this [Maybe] unchanged.
  Maybe mapNothing<K>(Maybe<K> Function() combiner) {
    return switch (this) {
      Nothing<T>() => combiner(),
      Just<T>() => identity(this),
    };
  }

  /// Async version of [mapNothing]: if [Nothing], runs [combiner]; if [Just], returns this [Maybe] unchanged.
  FutureOr<Maybe> mapAsyncNothing<K>(FutureOr<Maybe<K>> Function() combiner) {
    return switch (this) {
      Nothing<T>() => combiner(),
      Just<T>() => identity(this),
    };
  }

  /// True if this is [Nothing].
  bool get isNothing => this is Nothing;

  /// True if this is [Just].
  bool get isJust => this is Just;

  /// Casts to [Nothing]; throws if this is [Just]. Prefer pattern matching when possible.
  Nothing get asNothing => this as Nothing;

  /// Casts to [Just]\<T>; throws if this is [Nothing]. Prefer pattern matching when possible.
  Just<T> get asJust => this as Just<T>;

  /// Returns the value inside [Just], or [fallback] when [Nothing] or when the inner value is null.
  dynamic getOrElse<K>(K fallback) {
    fallbackOrValue(T value) {
      if (value == null) {
        return fallback;
      } else {
        return value;
      }
    }

    return switch (this) {
      Nothing<T>() => fallback,
      Just<T>(:final value) => fallbackOrValue(value),
    };
  }
}

extension MaybeRecordX<K, J> on (Maybe<K>, Maybe<J>) {
  /// Combines this pair of [Maybe]s into a single [Maybe]\<T> by providing
  /// callbacks for each case: [firstJust], [secondJust], [bothJust], [bothNothing].
  /// Omitted callbacks yield [Nothing].
  ///
  /// Example:
  /// ```dart
  /// final combined = (maybeName, maybeCount).maybeCombine<String>(
  ///   bothJust: (name, count) => Just('$name: $count'),
  ///   firstJust: (name) => Just(name),
  ///   secondJust: (count) => Just(count.toString()),
  ///   bothNothing: () => Just('unknown'),
  /// );
  /// ```
  Maybe<T> maybeCombine<T>({
    /// When only the first [Maybe] is [Just].
    Maybe<T> Function(K)? firstJust,

    /// When only the second [Maybe] is [Just].
    Maybe<T> Function(J)? secondJust,

    /// When both are [Just].
    Maybe<T> Function(K, J)? bothJust,

    /// When both are [Nothing].
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

  /// Async version of [maybeCombine]: same cases, callbacks may return [FutureOr]<[Maybe]\<T>>.
  FutureOr<Maybe<T>> maybeAsyncCombine<T>({
    /// When only the first [Maybe] is [Just].
    FutureOr<Maybe<T>> Function(K)? firstJust,

    /// When only the second [Maybe] is [Just].
    FutureOr<Maybe<T>> Function(J)? secondJust,

    /// When both are [Just].
    FutureOr<Maybe<T>> Function(K, J)? bothJust,

    /// When both are [Nothing].
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
