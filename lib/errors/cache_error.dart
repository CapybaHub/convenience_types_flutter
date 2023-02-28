import 'app_error.dart';

/// Abstract class to model errors on the application. As a presset of foreseen
/// specific errors there are some different implementations of this type.
/// [CacheError] models cache errors
abstract class CacheError extends AppError {
  const CacheError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}

/// [FailedToCacheError] models failure in the action of caching an info
class FailedToCacheError extends CacheError {
  const FailedToCacheError({
    super.slug,
    super.msg,
    super.stackTrace,
  });

  @override
  String toString() => '[FailedToCacheError]: {slug: $slug, msg: $msg}';
}

/// [FileAlreadyCachedError] models failure araised from trying to cache an already cached file
class FileAlreadyCachedError extends CacheError {
  const FileAlreadyCachedError({
    super.slug,
    super.msg,
    super.stackTrace,
  });

  @override
  String toString() => '[FileAlreadyCachedError]: {slug: $slug, msg: $msg}';
}

/// [NotCachedError] models failure araised from trying retrieve a file not yet cached
class NotCachedError extends CacheError {
  const NotCachedError({
    super.slug,
    super.msg,
    super.stackTrace,
  });

  @override
  String toString() => '[NotCachedError]: {slug: $slug, msg: $msg}';
}

/// [FailedToUnloadError] models failure araised from trying to delete a cached file
class FailedToUnloadError extends CacheError {
  const FailedToUnloadError({
    super.slug,
    super.msg,
    super.stackTrace,
  });

  @override
  String toString() => '[FailedToUnloadError]: {slug: $slug, msg: $msg}';
}
