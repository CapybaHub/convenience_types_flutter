import 'package:convenience_types/errors/http_error.dart';
import 'package:convenience_types/types/maybe.dart';

/// Abstract base class for all application errors.
///
/// Provides a common interface for typed, structured error handling. All errors
/// carry a [slug] (machine-readable identifier), a [msg] (human-readable
/// message), and an optional [stackTrace].
///
/// Preset concrete subclasses cover the most common error domains:
/// - [HttpError] — HTTP request failures (network, status codes, etc.)
/// - [CacheError] — Local cache read/write failures
/// - [DeviceInfoError] — Device information retrieval failures
/// - [FormError] — Form validation and submission failures
/// - [StorageError] — Device storage access failures
///
/// General-purpose subclasses are also provided:
/// - [AppUnknownError] — Unexpected or unclassified errors
/// - [ParseError] — Data parsing or deserialization failures
/// - [EntityNotFitError] — Domain rule or constraint violations
/// - [FailedToShareError] — Content-sharing failures
/// - [TokenNotFoundError] — Authentication token not found
///
/// See also [ValueError] for value-validation errors, and the corresponding
/// [ParseException] / [CacheException] for thrown exception counterparts.
abstract class AppError {
  /// A machine-readable identifier for this error (e.g. `'user_not_found'`).
  final String slug;

  /// A human-readable description of this error.
  final String msg;

  /// The stack trace associated with this error, if available.
  final String stackTrace;

  /// An optional payload containing additional data associated with this error.
  final Object? payload;

  const AppError({
    this.slug = '',
    this.msg = '',
    this.stackTrace = '',
    this.payload,
  });

  @override
  bool operator ==(other) {
    return (other.runtimeType == runtimeType) &&
        (other is AppError) &&
        other.slug == slug;
  }

  @override
  int get hashCode => Object.hash(
        slug,
        msg,
        stackTrace,
        payload,
      );

  @override
  String toString() =>
      '[$runtimeType]: (slug: $slug, msg: $msg, stackTrace: $stackTrace, payload: $payload,)';

  /// If this error is an [HttpError]\<T>, returns [Just] with its typed
  /// response body; otherwise returns [Nothing].
  Maybe<T> maybeResponse<T>() =>
      this is HttpError<T> ? (this as HttpError<T>).response : const Nothing();
}

/// An unexpected or unclassified application error.
///
/// Use when no more specific [AppError] subclass applies.
class AppUnknownError extends AppError {
  const AppUnknownError({
    super.slug,
    super.msg,
    super.stackTrace,
    super.payload,
  });

  @override
  String toString() => '''[AppUnknownError]: {
          slug: $slug,
          msg: $msg,
          stackTrace: $stackTrace,
        }''';
}

/// An error that occurred while parsing or deserializing data.
class ParseError extends AppError {
  const ParseError({
    super.slug,
    super.msg,
    super.stackTrace,
    super.payload,
  });

  @override
  String toString() => '''[ParseError]: {
          slug: $slug,
          msg: $msg,
          stackTrace: $stackTrace,
        }''';
}

/// An error indicating a domain entity failed to satisfy a constraint or rule.
class EntityNotFitError extends AppError {
  const EntityNotFitError({
    super.slug,
    super.msg,
    super.stackTrace,
    super.payload,
  });

  @override
  String toString() => '''[EntityNotFitError]: {
          slug: $slug,
          msg: $msg,
          stackTrace: $stackTrace,
        }''';
}

/// An error indicating a content-sharing operation failed.
class FailedToShareError extends AppError {
  const FailedToShareError({
    super.slug,
    super.msg,
    super.stackTrace,
    super.payload,
  });

  @override
  String toString() => '''[FailedToShareError]: {
          slug: $slug,
          msg: $msg,
          stackTrace: $stackTrace,
        }''';
}

/// An error indicating no authentication token was found.
class TokenNotFoundError extends AppError {
  const TokenNotFoundError({
    super.slug,
    super.msg,
    super.stackTrace,
    super.payload,
  });

  @override
  String toString() => '''[NotFoundError]: {
          slug: $slug,
          msg: $msg,
          stackTrace: $stackTrace,
        }''';
}
