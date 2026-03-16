import 'package:convenience_types/errors/app_error.dart';
import 'package:convenience_types/types/result.dart';

/// Base error type for value validation failures (e.g. invalid email, password).
abstract class ValueError extends AppError {
  const ValueError({super.msg, super.slug, super.stackTrace});
}

/// Thrown when a [ValueObject] is read via [ValueObject.getOrCrash] and its [Result] is [Failure].
///
/// Holds the failing [value] ([Result]\<T>) and optional [msg], [slug], [stackTrace].
class UnexpectedValueError<T> extends ValueError {
  final Result<T> value;

  const UnexpectedValueError(
    this.value, {
    super.msg,
    super.slug,
    super.stackTrace,
  });

  @override
  String toString() => 'UnexpectedValueError: $value';
}

/// Email failed validation.
class InvalidEmail extends ValueError {
  /// The value that failed email validation.
  final String failedValue;

  const InvalidEmail({
    required this.failedValue,
    super.msg,
    super.slug,
    super.stackTrace,
  });

  @override
  String toString() => 'InvalidEmail: $failedValue';
}

/// Password failed validation.
class InvalidPassword extends ValueError {
  /// The value that failed password validation.
  final String failedValue;

  const InvalidPassword({
    required this.failedValue,
    super.msg,
    super.slug,
    super.stackTrace,
  });

  @override
  String toString() => 'InvalidPassword: $failedValue';
}

/// User name failed validation.
class InvalidUserName extends ValueError {
  /// The value that failed username validation.
  final String failedValue;

  const InvalidUserName({
    required this.failedValue,
    super.msg,
    super.slug,
    super.stackTrace,
  });

  @override
  String toString() => 'InvalidUserName: $failedValue';
}

/// Name failed validation.
class InvalidName extends ValueError {
  /// The value that failed name validation.
  final String failedValue;

  const InvalidName({
    required this.failedValue,
    super.msg,
    super.slug,
    super.stackTrace,
  });

  @override
  String toString() => 'InvalidName: $failedValue';
}

/// OTP (one-time password) failed validation.
class InvalidOTP extends ValueError {
  /// The value that failed OTP validation.
  final String failedValue;

  const InvalidOTP({
    required this.failedValue,
    super.msg,
    super.slug,
    super.stackTrace,
  });

  @override
  String toString() => 'InvalidOTP: $failedValue';
}

/// Description length below minimum.
class DescriptionTooShort extends ValueError {
  /// The value whose length was too short.
  final String failedValue;

  const DescriptionTooShort({
    required this.failedValue,
    super.msg,
    super.slug,
    super.stackTrace,
  });
}

/// Description length above maximum.
class DescriptionTooLong extends ValueError {
  /// The value whose length was too long.
  final String failedValue;

  const DescriptionTooLong({
    required this.failedValue,
    super.msg,
    super.slug,
    super.stackTrace,
  });
}

/// Detail/content insufficient for validation.
class InsufficientDetail extends ValueError {
  /// The value that provided insufficient detail.
  final String failedValue;

  const InsufficientDetail({
    required this.failedValue,
    super.msg,
    super.slug,
    super.stackTrace,
  });
}

/// Value contains disallowed characters.
class InvalidCharacters extends ValueError {
  /// The value that contained invalid characters.
  final String failedValue;

  const InvalidCharacters({
    required this.failedValue,
    super.msg,
    super.slug,
    super.stackTrace,
  });
}
