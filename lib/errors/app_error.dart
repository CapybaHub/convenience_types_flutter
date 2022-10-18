/// Abstract class to model errors on the application. As a presset of foreseen
/// specific errors there are some different implementations of this type. Namely:
/// [HttpError]  models errors related to http requests
/// [CacheError]  models cache errors
/// [DeviceInfoError]  models device's information gathering related errors
/// [FormError]  models form related errors
/// [StorageError]  models storage operations related errors
///
/// In addition to the [AppError], there are a presset of foreseen [Exceptions]
abstract class AppError {
  final String slug;
  final String msg;
  final String stackTrace;

  AppError({
    this.slug = '',
    this.msg = '',
    this.stackTrace = '',
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
      );

  @override
  String toString() =>
      '[$runtimeType]: (slug: $slug, msg: $msg, stackTrace: $stackTrace,)';
}

class AppUnknownError extends AppError {
  AppUnknownError({
    super.slug,
    super.msg,
    super.stackTrace,
  });

  @override
  String toString() => '''[AppUnknownError]: {
          slug: $slug,
          msg: $msg,
          stackTrace: $stackTrace,
        }''';
}

class ParseError extends AppError {
  ParseError({
    super.slug,
    super.msg,
    super.stackTrace,
  });

  @override
  String toString() => '''[ParseError]: {
          slug: $slug,
          msg: $msg,
          stackTrace: $stackTrace,
        }''';
}

class EntityNotFitError extends AppError {
  EntityNotFitError({
    super.slug,
    super.msg,
    super.stackTrace,
  });

  @override
  String toString() => '''[EntityNotFitError]: {
          slug: $slug,
          msg: $msg,
          stackTrace: $stackTrace,
        }''';
}

class FailedToShareError extends AppError {
  FailedToShareError({
    super.slug,
    super.msg,
    super.stackTrace,
  });

  @override
  String toString() => '''[FailedToShareError]: {
          slug: $slug,
          msg: $msg,
          stackTrace: $stackTrace,
        }''';
}

class TokenNotFoundError extends AppError {
  TokenNotFoundError({
    super.slug,
    super.msg,
    super.stackTrace,
  });

  @override
  String toString() => '''[NotFoundError]: {
          slug: $slug,
          msg: $msg,
          stackTrace: $stackTrace,
        }''';
}
