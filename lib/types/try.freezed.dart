// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'try.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Try<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Try<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Try<$T>()';
  }
}

/// @nodoc
class $TryCopyWith<T, $Res> {
  $TryCopyWith(Try<T> _, $Res Function(Try<T>) __);
}

/// Adds pattern-matching-related methods to [Try].
extension TryPatterns<T> on Try<T> {
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
    TResult Function(TrySuccess<T> value)? success,
    TResult Function(TryFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case TrySuccess() when success != null:
        return success(_that);
      case TryFailure() when failure != null:
        return failure(_that);
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
    required TResult Function(TrySuccess<T> value) success,
    required TResult Function(TryFailure<T> value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case TrySuccess():
        return success(_that);
      case TryFailure():
        return failure(_that);
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
    TResult? Function(TrySuccess<T> value)? success,
    TResult? Function(TryFailure<T> value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case TrySuccess() when success != null:
        return success(_that);
      case TryFailure() when failure != null:
        return failure(_that);
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
    TResult Function(T value)? success,
    TResult Function(Object exception, StackTrace? stackTrace)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case TrySuccess() when success != null:
        return success(_that.value);
      case TryFailure() when failure != null:
        return failure(_that.exception, _that.stackTrace);
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
    required TResult Function(T value) success,
    required TResult Function(Object exception, StackTrace? stackTrace) failure,
  }) {
    final _that = this;
    switch (_that) {
      case TrySuccess():
        return success(_that.value);
      case TryFailure():
        return failure(_that.exception, _that.stackTrace);
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
    TResult? Function(T value)? success,
    TResult? Function(Object exception, StackTrace? stackTrace)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case TrySuccess() when success != null:
        return success(_that.value);
      case TryFailure() when failure != null:
        return failure(_that.exception, _that.stackTrace);
      case _:
        return null;
    }
  }
}

/// @nodoc

class TrySuccess<T> extends Try<T> {
  const TrySuccess(this.value) : super._();

  final T value;

  /// Create a copy of Try
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TrySuccessCopyWith<T, TrySuccess<T>> get copyWith =>
      _$TrySuccessCopyWithImpl<T, TrySuccess<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TrySuccess<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @override
  String toString() {
    return 'Try<$T>.success(value: $value)';
  }
}

/// @nodoc
abstract mixin class $TrySuccessCopyWith<T, $Res>
    implements $TryCopyWith<T, $Res> {
  factory $TrySuccessCopyWith(
          TrySuccess<T> value, $Res Function(TrySuccess<T>) _then) =
      _$TrySuccessCopyWithImpl;
  @useResult
  $Res call({T value});
}

/// @nodoc
class _$TrySuccessCopyWithImpl<T, $Res>
    implements $TrySuccessCopyWith<T, $Res> {
  _$TrySuccessCopyWithImpl(this._self, this._then);

  final TrySuccess<T> _self;
  final $Res Function(TrySuccess<T>) _then;

  /// Create a copy of Try
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = freezed,
  }) {
    return _then(TrySuccess<T>(
      freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class TryFailure<T> extends Try<T> {
  const TryFailure(this.exception, [this.stackTrace]) : super._();

  final Object exception;
  final StackTrace? stackTrace;

  /// Create a copy of Try
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TryFailureCopyWith<T, TryFailure<T>> get copyWith =>
      _$TryFailureCopyWithImpl<T, TryFailure<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TryFailure<T> &&
            const DeepCollectionEquality().equals(other.exception, exception) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(exception), stackTrace);

  @override
  String toString() {
    return 'Try<$T>.failure(exception: $exception, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class $TryFailureCopyWith<T, $Res>
    implements $TryCopyWith<T, $Res> {
  factory $TryFailureCopyWith(
          TryFailure<T> value, $Res Function(TryFailure<T>) _then) =
      _$TryFailureCopyWithImpl;
  @useResult
  $Res call({Object exception, StackTrace? stackTrace});
}

/// @nodoc
class _$TryFailureCopyWithImpl<T, $Res>
    implements $TryFailureCopyWith<T, $Res> {
  _$TryFailureCopyWithImpl(this._self, this._then);

  final TryFailure<T> _self;
  final $Res Function(TryFailure<T>) _then;

  /// Create a copy of Try
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? exception = null,
    Object? stackTrace = freezed,
  }) {
    return _then(TryFailure<T>(
      null == exception ? _self.exception : exception,
      freezed == stackTrace
          ? _self.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

// dart format on
