import 'package:convenience_types/types/maybe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_field.freezed.dart';

/// When providing data to a form and then passing it forward, for instance,
/// in a request body, one problem that is common here is the need of dealing
/// with the cases where the field is not filled, and than one might need to
/// treat every possible resulting Map (json) separetily, either passing the not
/// filled field with no value or not passing it at all. <br>
///
/// The generic sealed data class
/// ```dart
/// FormField<Type>
/// ```
/// is a convenience type that models, as the name already points,
/// a field in a Form, and uses the convention of not passing not filled fields to the resulting `Map`.
/// But here we are already passing the [name] of the field
/// in its possible Map (json) position, and the actual [field] data is a `Maybe<Type>`.
/// <br>
/// `FormField`s are usually used in a `Form` defined class, and with the usage of
/// our convenience mixin `FormUtils`, one should have everything it needs to have
/// form validation, and `toJson` method. It might introduce some verbose api, to
/// deal with, but the convenience of dealing with the most critical parts, like
/// validating and passing the `Form` information through, makes the usage of our
/// `FormField`s worthwhile.
/// <br>
///  example (using `freezed` to create the `Form` class):
/// ```dart
///  @freezed
///  abstract class FormExampleWithFreezed with _$FormExampleWithFreezed, FormUtils {
///    const FormExampleWithFreezed._();
///    const factory FormExampleWithFreezed({
///      @Default(FormField(name: 'firstFieldJsonName'))
///          FormField<String> firstField,
///      @Default(FormField(name: 'secondFieldJsonName'))
///          FormField<String> secondField,
///    }) = _FormExampleWithFreezed;
///
///    Result<String> get firstFieldValidation => validateField(
///          field: firstField.field,
///          validators: <String? Function(String)>[
///            // list of validators to first field
///          ],
///        );
///
///    Result<String> get secondFieldValidation => validateField(
///          field: secondField.field,
///          validators: <String? Function(String)>[
///            // list of validators to second field
///          ],
///        );
///
///    Map<String, dynamic> toJson() => fieldsToJson([
///          firstField,
///          secondField,
///        ]);
///  }
///
/// ```
///  Just to point out that the usage of a freezed class is not required to enjoy the advantages
///  of the `FormField` type, we present another example(not using
/// `freezed`):
///
/// ```dart
/// class FormExample with FormUtils {
///   final FormField<String> firstField;
///   final FormField<String> secondField;
///
///   const FormExample({
///     required this.firstField,
///     required this.secondField,
///   });
///
///   Result<String> get firstFieldValidation => validateField(
///         field: firstField.field,
///         validators: <String? Function(String)>[
///           // list of validators to first field
///         ],
///       );
///
///   Result<String> get secondFieldValidation => validateField(
///         field: secondField.field,
///         validators: <String? Function(String)>[
///           // list of validators to second field
///         ],
///       );
///
///   Map<String, dynamic> toJson() => fieldsToJson([
///         firstField,
///         secondField,
///       ]);
/// }
/// ```
///
/// Using a `Form` class as presented, one has a safe way to pass the values of
/// the field to a request body with easy. <br>
/// Example:
/// ```dart
///   request.body = formExampleInstance.toJson(),
/// ```

@freezed
abstract class FormField<T> with _$FormField<T> {
  const FormField._();
  const factory FormField({
    /// Property representing the name of this [FormField] in a possible json request body
    required String name,

    /// Property representing the value of this [FormField] in a possible json request body
    @Default(Nothing()) Maybe<T> field,
  }) = _FormField<T>;

  /// A method to help casting a FormField from a type T into a type K.
  FormField<K> castInto<K>({
    required Maybe<K> Function(T) combiner,
  }) =>
      FormField<K>(name: name, field: field.mapJust<K>(combiner));
}
