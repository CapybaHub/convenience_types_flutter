import 'package:convenience_types/errors/app_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_status.freezed.dart';

@freezed
class RequestStatus<ResultType> with _$RequestStatus<ResultType> {
  const RequestStatus._();
  const factory RequestStatus.idle() = Idle;
  const factory RequestStatus.loading() = Loading;
  const factory RequestStatus.succeeded(ResultType data) =
      Succeeded<ResultType>;
  const factory RequestStatus.failed(AppError error) = Failed;

  bool get isIdle => this is Idle;
  bool get isLoading => this is Loading;
  bool get isSucceeded => this is Succeeded;
  bool get isFailed => this is Failed;

  Idle get asIdle => this as Idle;
  Loading get asLoading => this as Loading;
  Succeeded get asSucceeded => this as Succeeded;
  Failed get asFailed => this as Failed;

  ResultType? get data => maybeWhen(
        succeeded: (data) => data,
        orElse: () => null,
      );

  AppError? get error => maybeWhen(
        failed: (error) => error,
        orElse: () => null,
      );
}
