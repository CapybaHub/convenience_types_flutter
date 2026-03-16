import 'app_error.dart';

/// Abstract base for storage-related errors.
///
/// Extend this class to represent specific failure modes when accessing or
/// managing device storage. Concrete subclasses include [StorageUnknownError]
/// and [StorageNotFoundError].
abstract class StorageError extends AppError {
  const StorageError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}

/// An unknown or unexpected storage-related error.
class StorageUnknownError extends StorageError {
  const StorageUnknownError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}

/// An error indicating that the device storage could not be found.

class StorageNotFoundError extends StorageError {
  const StorageNotFoundError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}
