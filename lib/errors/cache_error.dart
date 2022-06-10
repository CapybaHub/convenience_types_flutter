import 'app_error.dart';

abstract class CacheError extends AppError {
  CacheError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}

class FailedToCacheError extends CacheError {
  FailedToCacheError({
    super.slug,
    super.msg,
    super.stackTrace,
  });

  @override
  String toString() => '[FailedToCacheError]: {slug: $slug, msg: $msg}';
}

class FileAlreadyCachedError extends CacheError {
  FileAlreadyCachedError({
    super.slug,
    super.msg,
    super.stackTrace,
  });

  @override
  String toString() => '[FileAlreadyCachedError]: {slug: $slug, msg: $msg}';
}

class NotCachedError extends CacheError {
  NotCachedError({
    super.slug,
    super.msg,
    super.stackTrace,
  });

  @override
  String toString() => '[NotCachedError]: {slug: $slug, msg: $msg}';
}

class FailedToUnloadError extends CacheError {
  FailedToUnloadError({
    super.slug,
    super.msg,
    super.stackTrace,
  });

  @override
  String toString() => '[FailedToUnloadError]: {slug: $slug, msg: $msg}';
}
