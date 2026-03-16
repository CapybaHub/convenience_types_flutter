import 'app_error.dart';

/// Abstract base for errors that occur while gathering device information.
///
/// Concrete subclasses include [DeviceInfoUnknownError] and
/// [DeviceInfoNotFoundError].
abstract class DeviceInfoError extends AppError {
  const DeviceInfoError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}

/// An error indicating that the device information returned was unknown or malformed.
class DeviceInfoUnknownError extends DeviceInfoError {
  const DeviceInfoUnknownError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}

/// An error indicating that the requested device information could not be found.
class DeviceInfoNotFoundError extends DeviceInfoError {
  const DeviceInfoNotFoundError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}
