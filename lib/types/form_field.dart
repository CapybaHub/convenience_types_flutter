import 'package:convenience_types/types/maybe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_field.freezed.dart';

@freezed
class FormField<T> with _$FormField<T> {
  const factory FormField({
    required String name,
    @Default(Nothing()) Maybe<T> field,
  }) = _FormField<T>;
}
