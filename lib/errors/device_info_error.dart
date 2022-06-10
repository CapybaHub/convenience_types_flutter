import 'app_error.dart';

abstract class DeviceInfoError extends AppError {
  DeviceInfoError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}

class DeviceInfoUnknownError extends DeviceInfoError {
  DeviceInfoUnknownError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}

class DeviceInfoNotFoundError extends DeviceInfoError {
  DeviceInfoNotFoundError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}
