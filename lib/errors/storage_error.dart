import 'app_error.dart';

abstract class StorageError extends AppError {
  StorageError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}

class StorageUnknownError extends StorageError {
  StorageUnknownError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}

class StorageNotFoundError extends StorageError {
  StorageNotFoundError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}
