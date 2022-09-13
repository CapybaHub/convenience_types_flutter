import 'app_error.dart';

/// Abstract class to model errors on the application. As a presset of foreseen
/// specific errors there are some different implementations of this type.
/// [DeviceInfoError] models device's information gathering related errors
abstract class DeviceInfoError extends AppError {
  DeviceInfoError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}

/// [DeviceInfoError] models device's information gathering error related
/// to device info unknown or malformed
class DeviceInfoUnknownError extends DeviceInfoError {
  DeviceInfoUnknownError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}

/// [DeviceInfoError] models device's information gathering error related
/// to device info not found
class DeviceInfoNotFoundError extends DeviceInfoError {
  DeviceInfoNotFoundError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}
