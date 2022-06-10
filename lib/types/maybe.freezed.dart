// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'maybe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Maybe<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nothing,
    required TResult Function(T value) just,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? nothing,
    TResult Function(T value)? just,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nothing,
    TResult Function(T value)? just,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Nothing<T> value) nothing,
    required TResult Function(Just<T> value) just,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Nothing<T> value)? nothing,
    TResult Function(Just<T> value)? just,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Nothing<T> value)? nothing,
    TResult Function(Just<T> value)? just,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaybeCopyWith<T, $Res> {
  factory $MaybeCopyWith(Maybe<T> value, $Res Function(Maybe<T>) then) =
      _$MaybeCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$MaybeCopyWithImpl<T, $Res> implements $MaybeCopyWith<T, $Res> {
  _$MaybeCopyWithImpl(this._value, this._then);

  final Maybe<T> _value;
  // ignore: unused_field
  final $Res Function(Maybe<T>) _then;
}

/// @nodoc
abstract class _$$NothingCopyWith<T, $Res> {
  factory _$$NothingCopyWith(
          _$Nothing<T> value, $Res Function(_$Nothing<T>) then) =
      __$$NothingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$NothingCopyWithImpl<T, $Res> extends _$MaybeCopyWithImpl<T, $Res>
    implements _$$NothingCopyWith<T, $Res> {
  __$$NothingCopyWithImpl(
      _$Nothing<T> _value, $Res Function(_$Nothing<T>) _then)
      : super(_value, (v) => _then(v as _$Nothing<T>));

  @override
  _$Nothing<T> get _value => super._value as _$Nothing<T>;
}

/// @nodoc

class _$Nothing<T> extends Nothing<T> {
  const _$Nothing() : super._();

  @override
  String toString() {
    return 'Maybe<$T>.nothing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Nothing<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nothing,
    required TResult Function(T value) just,
  }) {
    return nothing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? nothing,
    TResult Function(T value)? just,
  }) {
    return nothing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nothing,
    TResult Function(T value)? just,
    required TResult orElse(),
  }) {
    if (nothing != null) {
      return nothing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Nothing<T> value) nothing,
    required TResult Function(Just<T> value) just,
  }) {
    return nothing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Nothing<T> value)? nothing,
    TResult Function(Just<T> value)? just,
  }) {
    return nothing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Nothing<T> value)? nothing,
    TResult Function(Just<T> value)? just,
    required TResult orElse(),
  }) {
    if (nothing != null) {
      return nothing(this);
    }
    return orElse();
  }
}

abstract class Nothing<T> extends Maybe<T> {
  const factory Nothing() = _$Nothing<T>;
  const Nothing._() : super._();
}

/// @nodoc
abstract class _$$JustCopyWith<T, $Res> {
  factory _$$JustCopyWith(_$Just<T> value, $Res Function(_$Just<T>) then) =
      __$$JustCopyWithImpl<T, $Res>;
  $Res call({T value});
}

/// @nodoc
class __$$JustCopyWithImpl<T, $Res> extends _$MaybeCopyWithImpl<T, $Res>
    implements _$$JustCopyWith<T, $Res> {
  __$$JustCopyWithImpl(_$Just<T> _value, $Res Function(_$Just<T>) _then)
      : super(_value, (v) => _then(v as _$Just<T>));

  @override
  _$Just<T> get _value => super._value as _$Just<T>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$Just<T>(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$Just<T> extends Just<T> {
  const _$Just(this.value) : super._();

  @override
  final T value;

  @override
  String toString() {
    return 'Maybe<$T>.just(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Just<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$JustCopyWith<T, _$Just<T>> get copyWith =>
      __$$JustCopyWithImpl<T, _$Just<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nothing,
    required TResult Function(T value) just,
  }) {
    return just(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? nothing,
    TResult Function(T value)? just,
  }) {
    return just?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nothing,
    TResult Function(T value)? just,
    required TResult orElse(),
  }) {
    if (just != null) {
      return just(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Nothing<T> value) nothing,
    required TResult Function(Just<T> value) just,
  }) {
    return just(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Nothing<T> value)? nothing,
    TResult Function(Just<T> value)? just,
  }) {
    return just?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Nothing<T> value)? nothing,
    TResult Function(Just<T> value)? just,
    required TResult orElse(),
  }) {
    if (just != null) {
      return just(this);
    }
    return orElse();
  }
}

abstract class Just<T> extends Maybe<T> {
  const factory Just(final T value) = _$Just<T>;
  const Just._() : super._();

  T get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$JustCopyWith<T, _$Just<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
