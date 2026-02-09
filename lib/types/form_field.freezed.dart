// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FormField<T> {
  /// Property representing the name of this [FormField] in a possible json request body
  String get name;

  /// Property representing the value of this [FormField] in a possible json request body
  Maybe<T> get field;

  /// Create a copy of FormField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormFieldCopyWith<T, FormField<T>> get copyWith =>
      _$FormFieldCopyWithImpl<T, FormField<T>>(
          this as FormField<T>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormField<T> &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.field, field) || other.field == field));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, field);

  @override
  String toString() {
    return 'FormField<$T>(name: $name, field: $field)';
  }
}

/// @nodoc
abstract mixin class $FormFieldCopyWith<T, $Res> {
  factory $FormFieldCopyWith(
          FormField<T> value, $Res Function(FormField<T>) _then) =
      _$FormFieldCopyWithImpl;
  @useResult
  $Res call({String name, Maybe<T> field});

  $MaybeCopyWith<T, $Res> get field;
}

/// @nodoc
class _$FormFieldCopyWithImpl<T, $Res> implements $FormFieldCopyWith<T, $Res> {
  _$FormFieldCopyWithImpl(this._self, this._then);

  final FormField<T> _self;
  final $Res Function(FormField<T>) _then;

  /// Create a copy of FormField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? field = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      field: null == field
          ? _self.field
          : field // ignore: cast_nullable_to_non_nullable
              as Maybe<T>,
    ));
  }

  /// Create a copy of FormField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaybeCopyWith<T, $Res> get field {
    return $MaybeCopyWith<T, $Res>(_self.field, (value) {
      return _then(_self.copyWith(field: value));
    });
  }
}

/// Adds pattern-matching-related methods to [FormField].
extension FormFieldPatterns<T> on FormField<T> {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FormField<T> value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FormField() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FormField<T> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FormField():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FormField<T> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FormField() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String name, Maybe<T> field)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FormField() when $default != null:
        return $default(_that.name, _that.field);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String name, Maybe<T> field) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FormField():
        return $default(_that.name, _that.field);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String name, Maybe<T> field)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FormField() when $default != null:
        return $default(_that.name, _that.field);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FormField<T> extends FormField<T> {
  const _FormField({required this.name, this.field = const Nothing()})
      : super._();

  /// Property representing the name of this [FormField] in a possible json request body
  @override
  final String name;

  /// Property representing the value of this [FormField] in a possible json request body
  @override
  @JsonKey()
  final Maybe<T> field;

  /// Create a copy of FormField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FormFieldCopyWith<T, _FormField<T>> get copyWith =>
      __$FormFieldCopyWithImpl<T, _FormField<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FormField<T> &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.field, field) || other.field == field));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, field);

  @override
  String toString() {
    return 'FormField<$T>(name: $name, field: $field)';
  }
}

/// @nodoc
abstract mixin class _$FormFieldCopyWith<T, $Res>
    implements $FormFieldCopyWith<T, $Res> {
  factory _$FormFieldCopyWith(
          _FormField<T> value, $Res Function(_FormField<T>) _then) =
      __$FormFieldCopyWithImpl;
  @override
  @useResult
  $Res call({String name, Maybe<T> field});

  @override
  $MaybeCopyWith<T, $Res> get field;
}

/// @nodoc
class __$FormFieldCopyWithImpl<T, $Res>
    implements _$FormFieldCopyWith<T, $Res> {
  __$FormFieldCopyWithImpl(this._self, this._then);

  final _FormField<T> _self;
  final $Res Function(_FormField<T>) _then;

  /// Create a copy of FormField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? field = null,
  }) {
    return _then(_FormField<T>(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      field: null == field
          ? _self.field
          : field // ignore: cast_nullable_to_non_nullable
              as Maybe<T>,
    ));
  }

  /// Create a copy of FormField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaybeCopyWith<T, $Res> get field {
    return $MaybeCopyWith<T, $Res>(_self.field, (value) {
      return _then(_self.copyWith(field: value));
    });
  }
}

// dart format on
