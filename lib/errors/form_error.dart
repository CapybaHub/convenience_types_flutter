import 'app_error.dart';

/// [FormError] models any error that might happen while operating with a form
class FormError extends AppError {
  const FormError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}
