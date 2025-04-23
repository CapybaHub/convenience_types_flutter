// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maybe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Maybe<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Maybe<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Maybe<$T>()';
  }
}

/// @nodoc
class $MaybeCopyWith<T, $Res> {
  $MaybeCopyWith(Maybe<T> _, $Res Function(Maybe<T>) __);
}

/// @nodoc

class Nothing<T> extends Maybe<T> {
  const Nothing() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Nothing<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Maybe<$T>.nothing()';
  }
}

/// @nodoc

class Just<T> extends Maybe<T> {
  const Just(this.value) : super._();

  final T value;

  /// Create a copy of Maybe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JustCopyWith<T, Just<T>> get copyWith =>
      _$JustCopyWithImpl<T, Just<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Just<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @override
  String toString() {
    return 'Maybe<$T>.just(value: $value)';
  }
}

/// @nodoc
abstract mixin class $JustCopyWith<T, $Res> implements $MaybeCopyWith<T, $Res> {
  factory $JustCopyWith(Just<T> value, $Res Function(Just<T>) _then) =
      _$JustCopyWithImpl;
  @useResult
  $Res call({T value});
}

/// @nodoc
class _$JustCopyWithImpl<T, $Res> implements $JustCopyWith<T, $Res> {
  _$JustCopyWithImpl(this._self, this._then);

  final Just<T> _self;
  final $Res Function(Just<T>) _then;

  /// Create a copy of Maybe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = freezed,
  }) {
    return _then(Just<T>(
      freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

// dart format on
