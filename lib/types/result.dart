import 'package:convenience_types/errors/app_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@Freezed(
  map: FreezedMapOptions(
    map: false,
    mapOrNull: false,
    maybeMap: false,
  ),
  when: FreezedWhenOptions(
    maybeWhen: false,
    when: false,
    whenOrNull: false,
  ),
)
class Result<ResultType> with _$Result<ResultType> {
  const Result._();
  const factory Result.success(ResultType data) = Success<ResultType>;
  const factory Result.failure(AppError error) = Failure;

  bool get isSuccess => this is Success;
  bool get isFailure => this is Failure;

  Success<ResultType> get asSuccess => this as Success<ResultType>;
  Failure<AppError> get asFailure => this as Failure<AppError>;

  T handle<T>({
    required T Function(ResultType data) onSuccess,
    required T Function(AppError error) onFailure,
  }) {
    if (this is Success) {
      return onSuccess((this as Success).data);
    } else {
      return onFailure((this as Failure).error);
    }
  }
}
