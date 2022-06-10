// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Result<ResultType> {}

/// @nodoc
abstract class $ResultCopyWith<ResultType, $Res> {
  factory $ResultCopyWith(
          Result<ResultType> value, $Res Function(Result<ResultType>) then) =
      _$ResultCopyWithImpl<ResultType, $Res>;
}

/// @nodoc
class _$ResultCopyWithImpl<ResultType, $Res>
    implements $ResultCopyWith<ResultType, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  final Result<ResultType> _value;
  // ignore: unused_field
  final $Res Function(Result<ResultType>) _then;
}

/// @nodoc
abstract class _$$SuccessCopyWith<ResultType, $Res> {
  factory _$$SuccessCopyWith(_$Success<ResultType> value,
          $Res Function(_$Success<ResultType>) then) =
      __$$SuccessCopyWithImpl<ResultType, $Res>;
  $Res call({ResultType data});
}

/// @nodoc
class __$$SuccessCopyWithImpl<ResultType, $Res>
    extends _$ResultCopyWithImpl<ResultType, $Res>
    implements _$$SuccessCopyWith<ResultType, $Res> {
  __$$SuccessCopyWithImpl(
      _$Success<ResultType> _value, $Res Function(_$Success<ResultType>) _then)
      : super(_value, (v) => _then(v as _$Success<ResultType>));

  @override
  _$Success<ResultType> get _value => super._value as _$Success<ResultType>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$Success<ResultType>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ResultType,
    ));
  }
}

/// @nodoc

class _$Success<ResultType> extends Success<ResultType> {
  const _$Success(this.data) : super._();

  @override
  final ResultType data;

  @override
  String toString() {
    return 'Result<$ResultType>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Success<ResultType> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$SuccessCopyWith<ResultType, _$Success<ResultType>> get copyWith =>
      __$$SuccessCopyWithImpl<ResultType, _$Success<ResultType>>(
          this, _$identity);
}

abstract class Success<ResultType> extends Result<ResultType> {
  const factory Success(final ResultType data) = _$Success<ResultType>;
  const Success._() : super._();

  ResultType get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$SuccessCopyWith<ResultType, _$Success<ResultType>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureCopyWith<ResultType, $Res> {
  factory _$$FailureCopyWith(_$Failure<ResultType> value,
          $Res Function(_$Failure<ResultType>) then) =
      __$$FailureCopyWithImpl<ResultType, $Res>;
  $Res call({AppError error});
}

/// @nodoc
class __$$FailureCopyWithImpl<ResultType, $Res>
    extends _$ResultCopyWithImpl<ResultType, $Res>
    implements _$$FailureCopyWith<ResultType, $Res> {
  __$$FailureCopyWithImpl(
      _$Failure<ResultType> _value, $Res Function(_$Failure<ResultType>) _then)
      : super(_value, (v) => _then(v as _$Failure<ResultType>));

  @override
  _$Failure<ResultType> get _value => super._value as _$Failure<ResultType>;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$Failure<ResultType>(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError,
    ));
  }
}

/// @nodoc

class _$Failure<ResultType> extends Failure<ResultType> {
  const _$Failure(this.error) : super._();

  @override
  final AppError error;

  @override
  String toString() {
    return 'Result<$ResultType>.failure(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Failure<ResultType> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$FailureCopyWith<ResultType, _$Failure<ResultType>> get copyWith =>
      __$$FailureCopyWithImpl<ResultType, _$Failure<ResultType>>(
          this, _$identity);
}

abstract class Failure<ResultType> extends Result<ResultType> {
  const factory Failure(final AppError error) = _$Failure<ResultType>;
  const Failure._() : super._();

  AppError get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$FailureCopyWith<ResultType, _$Failure<ResultType>> get copyWith =>
      throw _privateConstructorUsedError;
}
