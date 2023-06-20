// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestStatus<ResultType> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(ResultType data) succeeded,
    required TResult Function(AppError error) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(ResultType data)? succeeded,
    TResult? Function(AppError error)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(ResultType data)? succeeded,
    TResult Function(AppError error)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<ResultType> value) idle,
    required TResult Function(Loading<ResultType> value) loading,
    required TResult Function(Succeeded<ResultType> value) succeeded,
    required TResult Function(Failed<ResultType> value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<ResultType> value)? idle,
    TResult? Function(Loading<ResultType> value)? loading,
    TResult? Function(Succeeded<ResultType> value)? succeeded,
    TResult? Function(Failed<ResultType> value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<ResultType> value)? idle,
    TResult Function(Loading<ResultType> value)? loading,
    TResult Function(Succeeded<ResultType> value)? succeeded,
    TResult Function(Failed<ResultType> value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestStatusCopyWith<ResultType, $Res> {
  factory $RequestStatusCopyWith(RequestStatus<ResultType> value,
          $Res Function(RequestStatus<ResultType>) then) =
      _$RequestStatusCopyWithImpl<ResultType, $Res, RequestStatus<ResultType>>;
}

/// @nodoc
class _$RequestStatusCopyWithImpl<ResultType, $Res,
        $Val extends RequestStatus<ResultType>>
    implements $RequestStatusCopyWith<ResultType, $Res> {
  _$RequestStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IdleCopyWith<ResultType, $Res> {
  factory _$$IdleCopyWith(
          _$Idle<ResultType> value, $Res Function(_$Idle<ResultType>) then) =
      __$$IdleCopyWithImpl<ResultType, $Res>;
}

/// @nodoc
class __$$IdleCopyWithImpl<ResultType, $Res>
    extends _$RequestStatusCopyWithImpl<ResultType, $Res, _$Idle<ResultType>>
    implements _$$IdleCopyWith<ResultType, $Res> {
  __$$IdleCopyWithImpl(
      _$Idle<ResultType> _value, $Res Function(_$Idle<ResultType>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Idle<ResultType> extends Idle<ResultType> {
  const _$Idle() : super._();

  @override
  String toString() {
    return 'RequestStatus<$ResultType>.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Idle<ResultType>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(ResultType data) succeeded,
    required TResult Function(AppError error) failed,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(ResultType data)? succeeded,
    TResult? Function(AppError error)? failed,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(ResultType data)? succeeded,
    TResult Function(AppError error)? failed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<ResultType> value) idle,
    required TResult Function(Loading<ResultType> value) loading,
    required TResult Function(Succeeded<ResultType> value) succeeded,
    required TResult Function(Failed<ResultType> value) failed,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<ResultType> value)? idle,
    TResult? Function(Loading<ResultType> value)? loading,
    TResult? Function(Succeeded<ResultType> value)? succeeded,
    TResult? Function(Failed<ResultType> value)? failed,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<ResultType> value)? idle,
    TResult Function(Loading<ResultType> value)? loading,
    TResult Function(Succeeded<ResultType> value)? succeeded,
    TResult Function(Failed<ResultType> value)? failed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle<ResultType> extends RequestStatus<ResultType> {
  const factory Idle() = _$Idle<ResultType>;
  const Idle._() : super._();
}

/// @nodoc
abstract class _$$LoadingCopyWith<ResultType, $Res> {
  factory _$$LoadingCopyWith(_$Loading<ResultType> value,
          $Res Function(_$Loading<ResultType>) then) =
      __$$LoadingCopyWithImpl<ResultType, $Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<ResultType, $Res>
    extends _$RequestStatusCopyWithImpl<ResultType, $Res, _$Loading<ResultType>>
    implements _$$LoadingCopyWith<ResultType, $Res> {
  __$$LoadingCopyWithImpl(
      _$Loading<ResultType> _value, $Res Function(_$Loading<ResultType>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Loading<ResultType> extends Loading<ResultType> {
  const _$Loading() : super._();

  @override
  String toString() {
    return 'RequestStatus<$ResultType>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading<ResultType>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(ResultType data) succeeded,
    required TResult Function(AppError error) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(ResultType data)? succeeded,
    TResult? Function(AppError error)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(ResultType data)? succeeded,
    TResult Function(AppError error)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<ResultType> value) idle,
    required TResult Function(Loading<ResultType> value) loading,
    required TResult Function(Succeeded<ResultType> value) succeeded,
    required TResult Function(Failed<ResultType> value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<ResultType> value)? idle,
    TResult? Function(Loading<ResultType> value)? loading,
    TResult? Function(Succeeded<ResultType> value)? succeeded,
    TResult? Function(Failed<ResultType> value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<ResultType> value)? idle,
    TResult Function(Loading<ResultType> value)? loading,
    TResult Function(Succeeded<ResultType> value)? succeeded,
    TResult Function(Failed<ResultType> value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<ResultType> extends RequestStatus<ResultType> {
  const factory Loading() = _$Loading<ResultType>;
  const Loading._() : super._();
}

/// @nodoc
abstract class _$$SucceededCopyWith<ResultType, $Res> {
  factory _$$SucceededCopyWith(_$Succeeded<ResultType> value,
          $Res Function(_$Succeeded<ResultType>) then) =
      __$$SucceededCopyWithImpl<ResultType, $Res>;
  @useResult
  $Res call({ResultType data});
}

/// @nodoc
class __$$SucceededCopyWithImpl<ResultType, $Res>
    extends _$RequestStatusCopyWithImpl<ResultType, $Res,
        _$Succeeded<ResultType>>
    implements _$$SucceededCopyWith<ResultType, $Res> {
  __$$SucceededCopyWithImpl(_$Succeeded<ResultType> _value,
      $Res Function(_$Succeeded<ResultType>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$Succeeded<ResultType>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ResultType,
    ));
  }
}

/// @nodoc

class _$Succeeded<ResultType> extends Succeeded<ResultType> {
  const _$Succeeded(this.data) : super._();

  @override
  final ResultType data;

  @override
  String toString() {
    return 'RequestStatus<$ResultType>.succeeded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Succeeded<ResultType> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SucceededCopyWith<ResultType, _$Succeeded<ResultType>> get copyWith =>
      __$$SucceededCopyWithImpl<ResultType, _$Succeeded<ResultType>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(ResultType data) succeeded,
    required TResult Function(AppError error) failed,
  }) {
    return succeeded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(ResultType data)? succeeded,
    TResult? Function(AppError error)? failed,
  }) {
    return succeeded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(ResultType data)? succeeded,
    TResult Function(AppError error)? failed,
    required TResult orElse(),
  }) {
    if (succeeded != null) {
      return succeeded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<ResultType> value) idle,
    required TResult Function(Loading<ResultType> value) loading,
    required TResult Function(Succeeded<ResultType> value) succeeded,
    required TResult Function(Failed<ResultType> value) failed,
  }) {
    return succeeded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<ResultType> value)? idle,
    TResult? Function(Loading<ResultType> value)? loading,
    TResult? Function(Succeeded<ResultType> value)? succeeded,
    TResult? Function(Failed<ResultType> value)? failed,
  }) {
    return succeeded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<ResultType> value)? idle,
    TResult Function(Loading<ResultType> value)? loading,
    TResult Function(Succeeded<ResultType> value)? succeeded,
    TResult Function(Failed<ResultType> value)? failed,
    required TResult orElse(),
  }) {
    if (succeeded != null) {
      return succeeded(this);
    }
    return orElse();
  }
}

abstract class Succeeded<ResultType> extends RequestStatus<ResultType> {
  const factory Succeeded(final ResultType data) = _$Succeeded<ResultType>;
  const Succeeded._() : super._();

  ResultType get data;
  @JsonKey(ignore: true)
  _$$SucceededCopyWith<ResultType, _$Succeeded<ResultType>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedCopyWith<ResultType, $Res> {
  factory _$$FailedCopyWith(_$Failed<ResultType> value,
          $Res Function(_$Failed<ResultType>) then) =
      __$$FailedCopyWithImpl<ResultType, $Res>;
  @useResult
  $Res call({AppError error});
}

/// @nodoc
class __$$FailedCopyWithImpl<ResultType, $Res>
    extends _$RequestStatusCopyWithImpl<ResultType, $Res, _$Failed<ResultType>>
    implements _$$FailedCopyWith<ResultType, $Res> {
  __$$FailedCopyWithImpl(
      _$Failed<ResultType> _value, $Res Function(_$Failed<ResultType>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$Failed<ResultType>(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError,
    ));
  }
}

/// @nodoc

class _$Failed<ResultType> extends Failed<ResultType> {
  const _$Failed(this.error) : super._();

  @override
  final AppError error;

  @override
  String toString() {
    return 'RequestStatus<$ResultType>.failed(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Failed<ResultType> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedCopyWith<ResultType, _$Failed<ResultType>> get copyWith =>
      __$$FailedCopyWithImpl<ResultType, _$Failed<ResultType>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(ResultType data) succeeded,
    required TResult Function(AppError error) failed,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(ResultType data)? succeeded,
    TResult? Function(AppError error)? failed,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(ResultType data)? succeeded,
    TResult Function(AppError error)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<ResultType> value) idle,
    required TResult Function(Loading<ResultType> value) loading,
    required TResult Function(Succeeded<ResultType> value) succeeded,
    required TResult Function(Failed<ResultType> value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<ResultType> value)? idle,
    TResult? Function(Loading<ResultType> value)? loading,
    TResult? Function(Succeeded<ResultType> value)? succeeded,
    TResult? Function(Failed<ResultType> value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<ResultType> value)? idle,
    TResult Function(Loading<ResultType> value)? loading,
    TResult Function(Succeeded<ResultType> value)? succeeded,
    TResult Function(Failed<ResultType> value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class Failed<ResultType> extends RequestStatus<ResultType> {
  const factory Failed(final AppError error) = _$Failed<ResultType>;
  const Failed._() : super._();

  AppError get error;
  @JsonKey(ignore: true)
  _$$FailedCopyWith<ResultType, _$Failed<ResultType>> get copyWith =>
      throw _privateConstructorUsedError;
}
