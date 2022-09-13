import 'app_error.dart';

/// Abstract class to model errors on the application. As a presset of foreseen
/// specific errors there are some different implementations of this type.
/// [StorageError] models errors related to storage operations
abstract class StorageError extends AppError {
  StorageError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}

/// [StorageUnknownError] models unknown or unexpected storage related errors
class StorageUnknownError extends StorageError {
  StorageUnknownError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}

/// [StorageNotFoundError] models the error of not finding device's storage

class StorageNotFoundError extends StorageError {
  StorageNotFoundError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}
