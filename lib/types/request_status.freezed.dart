// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequestStatus<ResultType> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RequestStatus<ResultType>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RequestStatus<$ResultType>()';
  }
}

/// @nodoc
class $RequestStatusCopyWith<ResultType, $Res> {
  $RequestStatusCopyWith(
      RequestStatus<ResultType> _, $Res Function(RequestStatus<ResultType>) __);
}

/// Adds pattern-matching-related methods to [RequestStatus].
extension RequestStatusPatterns<ResultType> on RequestStatus<ResultType> {
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
    TResult Function(Idle<ResultType> value)? idle,
    TResult Function(Loading<ResultType> value)? loading,
    TResult Function(Succeeded<ResultType> value)? succeeded,
    TResult Function(Failed<ResultType> value)? failed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Idle() when idle != null:
        return idle(_that);
      case Loading() when loading != null:
        return loading(_that);
      case Succeeded() when succeeded != null:
        return succeeded(_that);
      case Failed() when failed != null:
        return failed(_that);
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
    required TResult Function(Idle<ResultType> value) idle,
    required TResult Function(Loading<ResultType> value) loading,
    required TResult Function(Succeeded<ResultType> value) succeeded,
    required TResult Function(Failed<ResultType> value) failed,
  }) {
    final _that = this;
    switch (_that) {
      case Idle():
        return idle(_that);
      case Loading():
        return loading(_that);
      case Succeeded():
        return succeeded(_that);
      case Failed():
        return failed(_that);
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
    TResult? Function(Idle<ResultType> value)? idle,
    TResult? Function(Loading<ResultType> value)? loading,
    TResult? Function(Succeeded<ResultType> value)? succeeded,
    TResult? Function(Failed<ResultType> value)? failed,
  }) {
    final _that = this;
    switch (_that) {
      case Idle() when idle != null:
        return idle(_that);
      case Loading() when loading != null:
        return loading(_that);
      case Succeeded() when succeeded != null:
        return succeeded(_that);
      case Failed() when failed != null:
        return failed(_that);
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
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(ResultType data)? succeeded,
    TResult Function(AppError error)? failed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Idle() when idle != null:
        return idle();
      case Loading() when loading != null:
        return loading();
      case Succeeded() when succeeded != null:
        return succeeded(_that.data);
      case Failed() when failed != null:
        return failed(_that.error);
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
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(ResultType data) succeeded,
    required TResult Function(AppError error) failed,
  }) {
    final _that = this;
    switch (_that) {
      case Idle():
        return idle();
      case Loading():
        return loading();
      case Succeeded():
        return succeeded(_that.data);
      case Failed():
        return failed(_that.error);
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
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(ResultType data)? succeeded,
    TResult? Function(AppError error)? failed,
  }) {
    final _that = this;
    switch (_that) {
      case Idle() when idle != null:
        return idle();
      case Loading() when loading != null:
        return loading();
      case Succeeded() when succeeded != null:
        return succeeded(_that.data);
      case Failed() when failed != null:
        return failed(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class Idle<ResultType> extends RequestStatus<ResultType> {
  const Idle() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Idle<ResultType>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RequestStatus<$ResultType>.idle()';
  }
}

/// @nodoc

class Loading<ResultType> extends RequestStatus<ResultType> {
  const Loading() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Loading<ResultType>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RequestStatus<$ResultType>.loading()';
  }
}

/// @nodoc

class Succeeded<ResultType> extends RequestStatus<ResultType> {
  const Succeeded(this.data) : super._();

  final ResultType data;

  /// Create a copy of RequestStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SucceededCopyWith<ResultType, Succeeded<ResultType>> get copyWith =>
      _$SucceededCopyWithImpl<ResultType, Succeeded<ResultType>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Succeeded<ResultType> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'RequestStatus<$ResultType>.succeeded(data: $data)';
  }
}

/// @nodoc
abstract mixin class $SucceededCopyWith<ResultType, $Res>
    implements $RequestStatusCopyWith<ResultType, $Res> {
  factory $SucceededCopyWith(Succeeded<ResultType> value,
      $Res Function(Succeeded<ResultType>) _then) = _$SucceededCopyWithImpl;
  @useResult
  $Res call({ResultType data});
}

/// @nodoc
class _$SucceededCopyWithImpl<ResultType, $Res>
    implements $SucceededCopyWith<ResultType, $Res> {
  _$SucceededCopyWithImpl(this._self, this._then);

  final Succeeded<ResultType> _self;
  final $Res Function(Succeeded<ResultType>) _then;

  /// Create a copy of RequestStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(Succeeded<ResultType>(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as ResultType,
    ));
  }
}

/// @nodoc

class Failed<ResultType> extends RequestStatus<ResultType> {
  const Failed(this.error) : super._();

  final AppError error;

  /// Create a copy of RequestStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FailedCopyWith<ResultType, Failed<ResultType>> get copyWith =>
      _$FailedCopyWithImpl<ResultType, Failed<ResultType>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Failed<ResultType> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'RequestStatus<$ResultType>.failed(error: $error)';
  }
}

/// @nodoc
abstract mixin class $FailedCopyWith<ResultType, $Res>
    implements $RequestStatusCopyWith<ResultType, $Res> {
  factory $FailedCopyWith(
          Failed<ResultType> value, $Res Function(Failed<ResultType>) _then) =
      _$FailedCopyWithImpl;
  @useResult
  $Res call({AppError error});
}

/// @nodoc
class _$FailedCopyWithImpl<ResultType, $Res>
    implements $FailedCopyWith<ResultType, $Res> {
  _$FailedCopyWithImpl(this._self, this._then);

  final Failed<ResultType> _self;
  final $Res Function(Failed<ResultType>) _then;

  /// Create a copy of RequestStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(Failed<ResultType>(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError,
    ));
  }
}

// dart format on
