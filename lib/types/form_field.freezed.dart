// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'form_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormField<T> {
  String get name => throw _privateConstructorUsedError;
  Maybe<T> get field => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormFieldCopyWith<T, FormField<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormFieldCopyWith<T, $Res> {
  factory $FormFieldCopyWith(
          FormField<T> value, $Res Function(FormField<T>) then) =
      _$FormFieldCopyWithImpl<T, $Res>;
  $Res call({String name, Maybe<T> field});

  $MaybeCopyWith<T, $Res> get field;
}

/// @nodoc
class _$FormFieldCopyWithImpl<T, $Res> implements $FormFieldCopyWith<T, $Res> {
  _$FormFieldCopyWithImpl(this._value, this._then);

  final FormField<T> _value;
  // ignore: unused_field
  final $Res Function(FormField<T>) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? field = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      field: field == freezed
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as Maybe<T>,
    ));
  }

  @override
  $MaybeCopyWith<T, $Res> get field {
    return $MaybeCopyWith<T, $Res>(_value.field, (value) {
      return _then(_value.copyWith(field: value));
    });
  }
}

/// @nodoc
abstract class _$$_FormFieldCopyWith<T, $Res>
    implements $FormFieldCopyWith<T, $Res> {
  factory _$$_FormFieldCopyWith(
          _$_FormField<T> value, $Res Function(_$_FormField<T>) then) =
      __$$_FormFieldCopyWithImpl<T, $Res>;
  @override
  $Res call({String name, Maybe<T> field});

  @override
  $MaybeCopyWith<T, $Res> get field;
}

/// @nodoc
class __$$_FormFieldCopyWithImpl<T, $Res>
    extends _$FormFieldCopyWithImpl<T, $Res>
    implements _$$_FormFieldCopyWith<T, $Res> {
  __$$_FormFieldCopyWithImpl(
      _$_FormField<T> _value, $Res Function(_$_FormField<T>) _then)
      : super(_value, (v) => _then(v as _$_FormField<T>));

  @override
  _$_FormField<T> get _value => super._value as _$_FormField<T>;

  @override
  $Res call({
    Object? name = freezed,
    Object? field = freezed,
  }) {
    return _then(_$_FormField<T>(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      field: field == freezed
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as Maybe<T>,
    ));
  }
}

/// @nodoc

class _$_FormField<T> implements _FormField<T> {
  const _$_FormField({required this.name, this.field = const Nothing()});

  @override
  final String name;
  @override
  @JsonKey()
  final Maybe<T> field;

  @override
  String toString() {
    return 'FormField<$T>(name: $name, field: $field)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormField<T> &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.field, field));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(field));

  @JsonKey(ignore: true)
  @override
  _$$_FormFieldCopyWith<T, _$_FormField<T>> get copyWith =>
      __$$_FormFieldCopyWithImpl<T, _$_FormField<T>>(this, _$identity);
}

abstract class _FormField<T> implements FormField<T> {
  const factory _FormField({required final String name, final Maybe<T> field}) =
      _$_FormField<T>;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  Maybe<T> get field => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FormFieldCopyWith<T, _$_FormField<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
