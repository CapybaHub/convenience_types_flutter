// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'either.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Either<L, R> {
  Object? get value;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Either<L, R> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @override
  String toString() {
    return 'Either<$L, $R>(value: $value)';
  }
}

/// @nodoc
class $EitherCopyWith<L, R, $Res> {
  $EitherCopyWith(Either<L, R> _, $Res Function(Either<L, R>) __);
}

/// Adds pattern-matching-related methods to [Either].
extension EitherPatterns<L, R> on Either<L, R> {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Left<L, R> value)? left,
    TResult Function(Right<L, R> value)? right,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Left() when left != null:
        return left(_that);
      case Right() when right != null:
        return right(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(Left<L, R> value) left,
    required TResult Function(Right<L, R> value) right,
  }) {
    final _that = this;
    switch (_that) {
      case Left():
        return left(_that);
      case Right():
        return right(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Left<L, R> value)? left,
    TResult? Function(Right<L, R> value)? right,
  }) {
    final _that = this;
    switch (_that) {
      case Left() when left != null:
        return left(_that);
      case Right() when right != null:
        return right(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(L value)? left,
    TResult Function(R value)? right,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Left() when left != null:
        return left(_that.value);
      case Right() when right != null:
        return right(_that.value);
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
  TResult when<TResult extends Object?>({
    required TResult Function(L value) left,
    required TResult Function(R value) right,
  }) {
    final _that = this;
    switch (_that) {
      case Left():
        return left(_that.value);
      case Right():
        return right(_that.value);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(L value)? left,
    TResult? Function(R value)? right,
  }) {
    final _that = this;
    switch (_that) {
      case Left() when left != null:
        return left(_that.value);
      case Right() when right != null:
        return right(_that.value);
      case _:
        return null;
    }
  }
}

/// @nodoc

class Left<L, R> extends Either<L, R> {
  const Left(this.value) : super._();

  @override
  final L value;

  /// Create a copy of Either
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LeftCopyWith<L, R, Left<L, R>> get copyWith =>
      _$LeftCopyWithImpl<L, R, Left<L, R>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Left<L, R> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @override
  String toString() {
    return 'Either<$L, $R>.left(value: $value)';
  }
}

/// @nodoc
abstract mixin class $LeftCopyWith<L, R, $Res>
    implements $EitherCopyWith<L, R, $Res> {
  factory $LeftCopyWith(Left<L, R> value, $Res Function(Left<L, R>) _then) =
      _$LeftCopyWithImpl;
  @useResult
  $Res call({L value});
}

/// @nodoc
class _$LeftCopyWithImpl<L, R, $Res> implements $LeftCopyWith<L, R, $Res> {
  _$LeftCopyWithImpl(this._self, this._then);

  final Left<L, R> _self;
  final $Res Function(Left<L, R>) _then;

  /// Create a copy of Either
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = freezed,
  }) {
    return _then(Left<L, R>(
      freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as L,
    ));
  }
}

/// @nodoc

class Right<L, R> extends Either<L, R> {
  const Right(this.value) : super._();

  @override
  final R value;

  /// Create a copy of Either
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RightCopyWith<L, R, Right<L, R>> get copyWith =>
      _$RightCopyWithImpl<L, R, Right<L, R>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Right<L, R> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @override
  String toString() {
    return 'Either<$L, $R>.right(value: $value)';
  }
}

/// @nodoc
abstract mixin class $RightCopyWith<L, R, $Res>
    implements $EitherCopyWith<L, R, $Res> {
  factory $RightCopyWith(Right<L, R> value, $Res Function(Right<L, R>) _then) =
      _$RightCopyWithImpl;
  @useResult
  $Res call({R value});
}

/// @nodoc
class _$RightCopyWithImpl<L, R, $Res> implements $RightCopyWith<L, R, $Res> {
  _$RightCopyWithImpl(this._self, this._then);

  final Right<L, R> _self;
  final $Res Function(Right<L, R>) _then;

  /// Create a copy of Either
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = freezed,
  }) {
    return _then(Right<L, R>(
      freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as R,
    ));
  }
}

// dart format on
