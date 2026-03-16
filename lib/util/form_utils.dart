import 'package:convenience_types/errors/form_error.dart';
import 'package:convenience_types/types/form_field.dart';
import 'package:convenience_types/types/maybe.dart';
import 'package:convenience_types/types/result.dart';

/// A validation function for a form field of type [T].
///
/// Returns a non-null error message string when validation fails, or `null`
/// when the value is valid. Used with [FormUtils.validateField].
typedef Validator<T> = String? Function(T);

/// Mixin for form classes that provides convenient field validation and JSON
/// serialization.
///
/// Mix this into a form class alongside your [FormField] definitions, then
/// call [validateField] for per-field validation and [fieldsToJson] to
/// serialize only the filled fields into a `Map`.
mixin class FormUtils {
  /// Method to help validate a [FormField<T>] providing its value represented by its `Maybe<T>`, and
  /// a `List<Validator<T>>`, returning a `Result<String>` with possible error message.
  Result<String> validateField<T>({
    required Maybe<T> field,
    required List<Validator<T>> validators,
  }) {
    List<String> errorMsgs = [];

    if (field case Just<T>(:final value)) {
      for (final validator in validators) {
        final error = validator(value);
        if (error != null) {
          errorMsgs.add(error);
        }
      }
    }

    return errorMsgs.isEmpty
        ? const Success('')
        : Failure(
            FormError(
              msg: errorMsgs.first,
            ),
          );
  }

  /// Method to help in the task of passing the provided `List<FormField>` to its `Map<String, dynamic>` representation,
  /// that is useful when it comes to pass the `Form` data through, for instance, a request body
  Map<String, dynamic> fieldsToJson(List<FormField> fields) {
    final data = <String, dynamic>{};

    int index = 0;
    while (index < fields.length) {
      var _ = switch (fields[index].field) {
        Nothing() => null,
        Just(:final value) => data[fields[index].name] = value,
      };

      index++;
    }

    return data;
  }
}
