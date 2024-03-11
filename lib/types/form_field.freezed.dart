// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FormField<T> {
  /// Property representing the name of this [FormField] in a possible json request body
  String get name => throw _privateConstructorUsedError;

  /// Property representing the value of this [FormField] in a possible json request body
  Maybe<T> get field => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormFieldCopyWith<T, FormField<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormFieldCopyWith<T, $Res> {
  factory $FormFieldCopyWith(
          FormField<T> value, $Res Function(FormField<T>) then) =
      _$FormFieldCopyWithImpl<T, $Res, FormField<T>>;
  @useResult
  $Res call({String name, Maybe<T> field});

  $MaybeCopyWith<T, $Res> get field;
}

/// @nodoc
class _$FormFieldCopyWithImpl<T, $Res, $Val extends FormField<T>>
    implements $FormFieldCopyWith<T, $Res> {
  _$FormFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? field = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as Maybe<T>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MaybeCopyWith<T, $Res> get field {
    return $MaybeCopyWith<T, $Res>(_value.field, (value) {
      return _then(_value.copyWith(field: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FormFieldImplCopyWith<T, $Res>
    implements $FormFieldCopyWith<T, $Res> {
  factory _$$FormFieldImplCopyWith(
          _$FormFieldImpl<T> value, $Res Function(_$FormFieldImpl<T>) then) =
      __$$FormFieldImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String name, Maybe<T> field});

  @override
  $MaybeCopyWith<T, $Res> get field;
}

/// @nodoc
class __$$FormFieldImplCopyWithImpl<T, $Res>
    extends _$FormFieldCopyWithImpl<T, $Res, _$FormFieldImpl<T>>
    implements _$$FormFieldImplCopyWith<T, $Res> {
  __$$FormFieldImplCopyWithImpl(
      _$FormFieldImpl<T> _value, $Res Function(_$FormFieldImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? field = null,
  }) {
    return _then(_$FormFieldImpl<T>(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as Maybe<T>,
    ));
  }
}

/// @nodoc

class _$FormFieldImpl<T> extends _FormField<T> {
  const _$FormFieldImpl({required this.name, this.field = const Nothing()})
      : super._();

  /// Property representing the name of this [FormField] in a possible json request body
  @override
  final String name;

  /// Property representing the value of this [FormField] in a possible json request body
  @override
  @JsonKey()
  final Maybe<T> field;

  @override
  String toString() {
    return 'FormField<$T>(name: $name, field: $field)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormFieldImpl<T> &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.field, field) || other.field == field));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, field);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormFieldImplCopyWith<T, _$FormFieldImpl<T>> get copyWith =>
      __$$FormFieldImplCopyWithImpl<T, _$FormFieldImpl<T>>(this, _$identity);
}

abstract class _FormField<T> extends FormField<T> {
  const factory _FormField({required final String name, final Maybe<T> field}) =
      _$FormFieldImpl<T>;
  const _FormField._() : super._();

  @override

  /// Property representing the name of this [FormField] in a possible json request body
  String get name;
  @override

  /// Property representing the value of this [FormField] in a possible json request body
  Maybe<T> get field;
  @override
  @JsonKey(ignore: true)
  _$$FormFieldImplCopyWith<T, _$FormFieldImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
