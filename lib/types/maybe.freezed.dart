// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maybe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
    TResult? Function()? nothing,
    TResult? Function(T value)? just,
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
    TResult? Function(Nothing<T> value)? nothing,
    TResult? Function(Just<T> value)? just,
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
      _$MaybeCopyWithImpl<T, $Res, Maybe<T>>;
}

/// @nodoc
class _$MaybeCopyWithImpl<T, $Res, $Val extends Maybe<T>>
    implements $MaybeCopyWith<T, $Res> {
  _$MaybeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NothingImplCopyWith<T, $Res> {
  factory _$$NothingImplCopyWith(
          _$NothingImpl<T> value, $Res Function(_$NothingImpl<T>) then) =
      __$$NothingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$NothingImplCopyWithImpl<T, $Res>
    extends _$MaybeCopyWithImpl<T, $Res, _$NothingImpl<T>>
    implements _$$NothingImplCopyWith<T, $Res> {
  __$$NothingImplCopyWithImpl(
      _$NothingImpl<T> _value, $Res Function(_$NothingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NothingImpl<T> extends Nothing<T> {
  const _$NothingImpl() : super._();

  @override
  String toString() {
    return 'Maybe<$T>.nothing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NothingImpl<T>);
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
    TResult? Function()? nothing,
    TResult? Function(T value)? just,
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
    TResult? Function(Nothing<T> value)? nothing,
    TResult? Function(Just<T> value)? just,
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
  const factory Nothing() = _$NothingImpl<T>;
  const Nothing._() : super._();
}

/// @nodoc
abstract class _$$JustImplCopyWith<T, $Res> {
  factory _$$JustImplCopyWith(
          _$JustImpl<T> value, $Res Function(_$JustImpl<T>) then) =
      __$$JustImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T value});
}

/// @nodoc
class __$$JustImplCopyWithImpl<T, $Res>
    extends _$MaybeCopyWithImpl<T, $Res, _$JustImpl<T>>
    implements _$$JustImplCopyWith<T, $Res> {
  __$$JustImplCopyWithImpl(
      _$JustImpl<T> _value, $Res Function(_$JustImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$JustImpl<T>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$JustImpl<T> extends Just<T> {
  const _$JustImpl(this.value) : super._();

  @override
  final T value;

  @override
  String toString() {
    return 'Maybe<$T>.just(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JustImpl<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JustImplCopyWith<T, _$JustImpl<T>> get copyWith =>
      __$$JustImplCopyWithImpl<T, _$JustImpl<T>>(this, _$identity);

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
    TResult? Function()? nothing,
    TResult? Function(T value)? just,
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
    TResult? Function(Nothing<T> value)? nothing,
    TResult? Function(Just<T> value)? just,
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
  const factory Just(final T value) = _$JustImpl<T>;
  const Just._() : super._();

  T get value;
  @JsonKey(ignore: true)
  _$$JustImplCopyWith<T, _$JustImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
