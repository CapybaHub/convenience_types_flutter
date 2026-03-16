import 'app_error.dart';

/// An error that occurred while validating or submitting a form.
///
/// Produced by [FormUtils.validateField] when a field fails one or more
/// validators. The [AppError.msg] field carries the first validator error
/// message.
class FormError extends AppError {
  const FormError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}
