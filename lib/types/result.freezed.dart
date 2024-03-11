// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Result<ResultType> {}

/// @nodoc
abstract class $ResultCopyWith<ResultType, $Res> {
  factory $ResultCopyWith(
          Result<ResultType> value, $Res Function(Result<ResultType>) then) =
      _$ResultCopyWithImpl<ResultType, $Res, Result<ResultType>>;
}

/// @nodoc
class _$ResultCopyWithImpl<ResultType, $Res, $Val extends Result<ResultType>>
    implements $ResultCopyWith<ResultType, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<ResultType, $Res> {
  factory _$$SuccessImplCopyWith(_$SuccessImpl<ResultType> value,
          $Res Function(_$SuccessImpl<ResultType>) then) =
      __$$SuccessImplCopyWithImpl<ResultType, $Res>;
  @useResult
  $Res call({ResultType data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<ResultType, $Res>
    extends _$ResultCopyWithImpl<ResultType, $Res, _$SuccessImpl<ResultType>>
    implements _$$SuccessImplCopyWith<ResultType, $Res> {
  __$$SuccessImplCopyWithImpl(_$SuccessImpl<ResultType> _value,
      $Res Function(_$SuccessImpl<ResultType>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessImpl<ResultType>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ResultType,
    ));
  }
}

/// @nodoc

class _$SuccessImpl<ResultType> extends Success<ResultType> {
  const _$SuccessImpl(this.data) : super._();

  @override
  final ResultType data;

  @override
  String toString() {
    return 'Result<$ResultType>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl<ResultType> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<ResultType, _$SuccessImpl<ResultType>> get copyWith =>
      __$$SuccessImplCopyWithImpl<ResultType, _$SuccessImpl<ResultType>>(
          this, _$identity);
}

abstract class Success<ResultType> extends Result<ResultType> {
  const factory Success(final ResultType data) = _$SuccessImpl<ResultType>;
  const Success._() : super._();

  ResultType get data;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<ResultType, _$SuccessImpl<ResultType>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<ResultType, $Res> {
  factory _$$FailureImplCopyWith(_$FailureImpl<ResultType> value,
          $Res Function(_$FailureImpl<ResultType>) then) =
      __$$FailureImplCopyWithImpl<ResultType, $Res>;
  @useResult
  $Res call({AppError error});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<ResultType, $Res>
    extends _$ResultCopyWithImpl<ResultType, $Res, _$FailureImpl<ResultType>>
    implements _$$FailureImplCopyWith<ResultType, $Res> {
  __$$FailureImplCopyWithImpl(_$FailureImpl<ResultType> _value,
      $Res Function(_$FailureImpl<ResultType>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FailureImpl<ResultType>(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError,
    ));
  }
}

/// @nodoc

class _$FailureImpl<ResultType> extends Failure<ResultType> {
  const _$FailureImpl(this.error) : super._();

  @override
  final AppError error;

  @override
  String toString() {
    return 'Result<$ResultType>.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl<ResultType> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<ResultType, _$FailureImpl<ResultType>> get copyWith =>
      __$$FailureImplCopyWithImpl<ResultType, _$FailureImpl<ResultType>>(
          this, _$identity);
}

abstract class Failure<ResultType> extends Result<ResultType> {
  const factory Failure(final AppError error) = _$FailureImpl<ResultType>;
  const Failure._() : super._();

  AppError get error;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<ResultType, _$FailureImpl<ResultType>> get copyWith =>
      throw _privateConstructorUsedError;
}
