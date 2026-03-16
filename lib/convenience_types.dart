/// Convenience types, errors, and utilities commonly used across Flutter projects.
///
/// Import this single library to access the full public API:
///
/// **Types** — [Result], [Maybe], [Unit], [RequestStatus], [FormField],
/// [SizingInformation], [NoParams], [ValueObject], [UseCase]
///
/// **Errors** — [AppError] and its subclasses ([HttpError], [CacheError],
/// [StorageError], [FormError], [DeviceInfoError]), plus [ValueError] and its
/// preset subclasses ([InvalidEmail], [InvalidPassword], etc.)
///
/// **Utilities** — [FormUtils] mixin, [SeedTestStateMixin],
/// [identity] function, [Validator] typedef, [parseHttpError]
library;

export 'package:convenience_types/types/types.dart';
export 'package:convenience_types/errors/errors.dart';
export 'package:convenience_types/util/utils.dart';
