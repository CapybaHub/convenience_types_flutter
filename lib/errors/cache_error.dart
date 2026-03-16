import 'app_error.dart';

/// Abstract base for cache-related errors.
///
/// Extend this class to represent specific failure modes when reading from or
/// writing to a local cache. Concrete subclasses include [FailedToCacheError],
/// [FileAlreadyCachedError], [NotCachedError], and [FailedToUnloadError].
abstract class CacheError extends AppError {
  const CacheError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}

/// An error arising from a failed attempt to cache data.
class FailedToCacheError extends CacheError {
  const FailedToCacheError({
    super.slug,
    super.msg,
    super.stackTrace,
  });

  @override
  String toString() => '[FailedToCacheError]: {slug: $slug, msg: $msg}';
}

/// An error arising from attempting to cache data that is already cached.
class FileAlreadyCachedError extends CacheError {
  const FileAlreadyCachedError({
    super.slug,
    super.msg,
    super.stackTrace,
  });

  @override
  String toString() => '[FileAlreadyCachedError]: {slug: $slug, msg: $msg}';
}

/// An error arising from trying to retrieve data that has not been cached yet.
class NotCachedError extends CacheError {
  const NotCachedError({
    super.slug,
    super.msg,
    super.stackTrace,
  });

  @override
  String toString() => '[NotCachedError]: {slug: $slug, msg: $msg}';
}

/// An error arising from a failed attempt to delete a cached entry.
class FailedToUnloadError extends CacheError {
  const FailedToUnloadError({
    super.slug,
    super.msg,
    super.stackTrace,
  });

  @override
  String toString() => '[FailedToUnloadError]: {slug: $slug, msg: $msg}';
}
