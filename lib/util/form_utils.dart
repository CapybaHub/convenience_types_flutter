import 'package:convenience_types/errors/form_error.dart';
import 'package:convenience_types/types/form_field.dart';
import 'package:convenience_types/types/maybe.dart';
import 'package:convenience_types/types/result.dart';

typedef Validator<T> = String? Function(T);

/// Class used as a dart `Mixin` to a `Form` class, providing methods to conviniently
/// deal with validation and serialization of fields.
///
mixin class FormUtils {
  /// Method to help validate a [FormField<T>] providing its value represented by its `Maybe<T>`, and
  /// a `List<Validator<T>>`, returning a `Result<String>` with possible error message.
  Result<String> validateField<T>({
    required Maybe<T> field,
    required List<Validator<T>> validators,
  }) {
    List<String> errorMsgs = [];

    for (Function validator in validators) {
      String? error = validator(switch (field) {
        Nothing<T>() => '',
        Just<T>(:final value) => value != null ? value.toString() : '',
      });
      if (error != null) errorMsgs.add(error);
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
