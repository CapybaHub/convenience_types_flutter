// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

/// Adds pattern-matching-related methods to [Maybe].
extension MaybePatterns<T> on Maybe<T> {
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
    TResult Function(Nothing<T> value)? nothing,
    TResult Function(Just<T> value)? just,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Nothing() when nothing != null:
        return nothing(_that);
      case Just() when just != null:
        return just(_that);
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
    required TResult Function(Nothing<T> value) nothing,
    required TResult Function(Just<T> value) just,
  }) {
    final _that = this;
    switch (_that) {
      case Nothing():
        return nothing(_that);
      case Just():
        return just(_that);
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
    TResult? Function(Nothing<T> value)? nothing,
    TResult? Function(Just<T> value)? just,
  }) {
    final _that = this;
    switch (_that) {
      case Nothing() when nothing != null:
        return nothing(_that);
      case Just() when just != null:
        return just(_that);
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
    TResult Function()? nothing,
    TResult Function(T value)? just,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Nothing() when nothing != null:
        return nothing();
      case Just() when just != null:
        return just(_that.value);
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
    required TResult Function() nothing,
    required TResult Function(T value) just,
  }) {
    final _that = this;
    switch (_that) {
      case Nothing():
        return nothing();
      case Just():
        return just(_that.value);
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
    TResult? Function()? nothing,
    TResult? Function(T value)? just,
  }) {
    final _that = this;
    switch (_that) {
      case Nothing() when nothing != null:
        return nothing();
      case Just() when just != null:
        return just(_that.value);
      case _:
        return null;
    }
  }
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
