import 'package:convenience_types/errors/value_errors.dart';
import 'package:convenience_types/types/result.dart';
import 'package:convenience_types/types/unit.dart';
import 'package:flutter/foundation.dart';

/// Base type for domain value objects whose validity is represented by [Result]&lt;[T]&gt;.
///
/// Subclasses expose [value] (a [Result]); [isValid] is true when [value] is [Success].
/// Use [getOrCrash] to obtain the value or throw [UnexpectedValueError] on failure.
/// [failureOrUnit] converts [value] to [Result]&lt;[Unit]&gt; (success → [Unit], failure → same [Failure]).
@immutable
abstract class ValueObject<T> {
  const ValueObject();

  /// The result of validating this value object; [Success] when valid.
  Result<T> get value;

  /// True when [value] is [Success].
  bool isValid() => value.isSuccess;

  /// Returns the value when [Success]; throws [UnexpectedValueError] when [Failure].
  T getOrCrash() => value.handle(
        onSuccess: identity,
        onFailure: (error) {
          throw UnexpectedValueError<T>(
            value,
            msg: error.msg,
            slug: error.slug,
            stackTrace: error.stackTrace,
          );
        },
      );

  /// [Success]([Unit]) when [value] is [Success]; otherwise the same [Failure] as [value].
  Result<Unit> get failureOrUnit {
    return value.handle(
      onSuccess: (_) => Success(Unit()),
      onFailure: (error) => Failure(error),
    );
  }

  @override
  bool operator ==(covariant Object other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
