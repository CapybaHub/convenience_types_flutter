import 'package:freezed_annotation/freezed_annotation.dart';

part 'no_params.freezed.dart';

/// A type representing "no parameters" for use cases or callbacks that take no arguments.
///
/// Similar to [Unit], but used as a parameter type (e.g. [UseCase]&lt;T, [NoParams]&gt;)
/// when the operation needs no input.
@freezed
class NoParams with _$NoParams {
  const NoParams._();

  /// The single value representing no parameters.
  const factory NoParams() = _NoParams;
}
