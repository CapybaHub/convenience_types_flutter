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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$IdleImplCopyWith<ResultType, $Res> {
  factory _$$IdleImplCopyWith(_$IdleImpl<ResultType> value,
          $Res Function(_$IdleImpl<ResultType>) then) =
      __$$IdleImplCopyWithImpl<ResultType, $Res>;
}

/// @nodoc
class __$$IdleImplCopyWithImpl<ResultType, $Res>
    extends _$RequestStatusCopyWithImpl<ResultType, $Res,
        _$IdleImpl<ResultType>>
    implements _$$IdleImplCopyWith<ResultType, $Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl<ResultType> _value,
      $Res Function(_$IdleImpl<ResultType>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IdleImpl<ResultType> extends Idle<ResultType> {
  const _$IdleImpl() : super._();

  @override
  String toString() {
    return 'RequestStatus<$ResultType>.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdleImpl<ResultType>);
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
  const factory Idle() = _$IdleImpl<ResultType>;
  const Idle._() : super._();
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<ResultType, $Res> {
  factory _$$LoadingImplCopyWith(_$LoadingImpl<ResultType> value,
          $Res Function(_$LoadingImpl<ResultType>) then) =
      __$$LoadingImplCopyWithImpl<ResultType, $Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<ResultType, $Res>
    extends _$RequestStatusCopyWithImpl<ResultType, $Res,
        _$LoadingImpl<ResultType>>
    implements _$$LoadingImplCopyWith<ResultType, $Res> {
  __$$LoadingImplCopyWithImpl(_$LoadingImpl<ResultType> _value,
      $Res Function(_$LoadingImpl<ResultType>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl<ResultType> extends Loading<ResultType> {
  const _$LoadingImpl() : super._();

  @override
  String toString() {
    return 'RequestStatus<$ResultType>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl<ResultType>);
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
  const factory Loading() = _$LoadingImpl<ResultType>;
  const Loading._() : super._();
}

/// @nodoc
abstract class _$$SucceededImplCopyWith<ResultType, $Res> {
  factory _$$SucceededImplCopyWith(_$SucceededImpl<ResultType> value,
          $Res Function(_$SucceededImpl<ResultType>) then) =
      __$$SucceededImplCopyWithImpl<ResultType, $Res>;
  @useResult
  $Res call({ResultType data});
}

/// @nodoc
class __$$SucceededImplCopyWithImpl<ResultType, $Res>
    extends _$RequestStatusCopyWithImpl<ResultType, $Res,
        _$SucceededImpl<ResultType>>
    implements _$$SucceededImplCopyWith<ResultType, $Res> {
  __$$SucceededImplCopyWithImpl(_$SucceededImpl<ResultType> _value,
      $Res Function(_$SucceededImpl<ResultType>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SucceededImpl<ResultType>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ResultType,
    ));
  }
}

/// @nodoc

class _$SucceededImpl<ResultType> extends Succeeded<ResultType> {
  const _$SucceededImpl(this.data) : super._();

  @override
  final ResultType data;

  @override
  String toString() {
    return 'RequestStatus<$ResultType>.succeeded(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SucceededImpl<ResultType> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SucceededImplCopyWith<ResultType, _$SucceededImpl<ResultType>>
      get copyWith => __$$SucceededImplCopyWithImpl<ResultType,
          _$SucceededImpl<ResultType>>(this, _$identity);

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
  const factory Succeeded(final ResultType data) = _$SucceededImpl<ResultType>;
  const Succeeded._() : super._();

  ResultType get data;
  @JsonKey(ignore: true)
  _$$SucceededImplCopyWith<ResultType, _$SucceededImpl<ResultType>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<ResultType, $Res> {
  factory _$$FailedImplCopyWith(_$FailedImpl<ResultType> value,
          $Res Function(_$FailedImpl<ResultType>) then) =
      __$$FailedImplCopyWithImpl<ResultType, $Res>;
  @useResult
  $Res call({AppError error});
}

/// @nodoc
class __$$FailedImplCopyWithImpl<ResultType, $Res>
    extends _$RequestStatusCopyWithImpl<ResultType, $Res,
        _$FailedImpl<ResultType>>
    implements _$$FailedImplCopyWith<ResultType, $Res> {
  __$$FailedImplCopyWithImpl(_$FailedImpl<ResultType> _value,
      $Res Function(_$FailedImpl<ResultType>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FailedImpl<ResultType>(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError,
    ));
  }
}

/// @nodoc

class _$FailedImpl<ResultType> extends Failed<ResultType> {
  const _$FailedImpl(this.error) : super._();

  @override
  final AppError error;

  @override
  String toString() {
    return 'RequestStatus<$ResultType>.failed(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedImpl<ResultType> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedImplCopyWith<ResultType, _$FailedImpl<ResultType>> get copyWith =>
      __$$FailedImplCopyWithImpl<ResultType, _$FailedImpl<ResultType>>(
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
  const factory Failed(final AppError error) = _$FailedImpl<ResultType>;
  const Failed._() : super._();

  AppError get error;
  @JsonKey(ignore: true)
  _$$FailedImplCopyWith<ResultType, _$FailedImpl<ResultType>> get copyWith =>
      throw _privateConstructorUsedError;
}
