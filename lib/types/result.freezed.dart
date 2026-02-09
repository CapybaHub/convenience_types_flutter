// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Result<ResultType> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Result<ResultType>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Result<$ResultType>()';
  }
}

/// @nodoc
class $ResultCopyWith<ResultType, $Res> {
  $ResultCopyWith(Result<ResultType> _, $Res Function(Result<ResultType>) __);
}

/// Adds pattern-matching-related methods to [Result].
extension ResultPatterns<ResultType> on Result<ResultType> {
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
    TResult Function(Success<ResultType> value)? success,
    TResult Function(Failure<ResultType> value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Success() when success != null:
        return success(_that);
      case Failure() when failure != null:
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
    required TResult Function(Success<ResultType> value) success,
    required TResult Function(Failure<ResultType> value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case Success():
        return success(_that);
      case Failure():
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
    TResult? Function(Success<ResultType> value)? success,
    TResult? Function(Failure<ResultType> value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case Success() when success != null:
        return success(_that);
      case Failure() when failure != null:
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
    TResult Function(ResultType data)? success,
    TResult Function(AppError error)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Success() when success != null:
        return success(_that.data);
      case Failure() when failure != null:
        return failure(_that.error);
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
    required TResult Function(ResultType data) success,
    required TResult Function(AppError error) failure,
  }) {
    final _that = this;
    switch (_that) {
      case Success():
        return success(_that.data);
      case Failure():
        return failure(_that.error);
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
    TResult? Function(ResultType data)? success,
    TResult? Function(AppError error)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case Success() when success != null:
        return success(_that.data);
      case Failure() when failure != null:
        return failure(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class Success<ResultType> extends Result<ResultType> {
  const Success(this.data) : super._();

  final ResultType data;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessCopyWith<ResultType, Success<ResultType>> get copyWith =>
      _$SuccessCopyWithImpl<ResultType, Success<ResultType>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Success<ResultType> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'Result<$ResultType>.success(data: $data)';
  }
}

/// @nodoc
abstract mixin class $SuccessCopyWith<ResultType, $Res>
    implements $ResultCopyWith<ResultType, $Res> {
  factory $SuccessCopyWith(
          Success<ResultType> value, $Res Function(Success<ResultType>) _then) =
      _$SuccessCopyWithImpl;
  @useResult
  $Res call({ResultType data});
}

/// @nodoc
class _$SuccessCopyWithImpl<ResultType, $Res>
    implements $SuccessCopyWith<ResultType, $Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success<ResultType> _self;
  final $Res Function(Success<ResultType>) _then;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(Success<ResultType>(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as ResultType,
    ));
  }
}

/// @nodoc

class Failure<ResultType> extends Result<ResultType> {
  const Failure(this.error) : super._();

  final AppError error;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FailureCopyWith<ResultType, Failure<ResultType>> get copyWith =>
      _$FailureCopyWithImpl<ResultType, Failure<ResultType>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Failure<ResultType> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'Result<$ResultType>.failure(error: $error)';
  }
}

/// @nodoc
abstract mixin class $FailureCopyWith<ResultType, $Res>
    implements $ResultCopyWith<ResultType, $Res> {
  factory $FailureCopyWith(
          Failure<ResultType> value, $Res Function(Failure<ResultType>) _then) =
      _$FailureCopyWithImpl;
  @useResult
  $Res call({AppError error});
}

/// @nodoc
class _$FailureCopyWithImpl<ResultType, $Res>
    implements $FailureCopyWith<ResultType, $Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure<ResultType> _self;
  final $Res Function(Failure<ResultType>) _then;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(Failure<ResultType>(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError,
    ));
  }
}

// dart format on
