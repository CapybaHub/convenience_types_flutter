import 'app_error.dart';

class FormError extends AppError {
  FormError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}
