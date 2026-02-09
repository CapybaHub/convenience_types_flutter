import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit.freezed.dart';

/// A type that represents the absence of a meaningful value.
///
/// [Unit] has exactly one value—[Unit()]—and carries no data. It is useful when
/// you need a type-safe way to express "no value" or "success with nothing to
/// return", such as:
///
/// - [Result]<[Unit]> for operations that succeed but return nothing (e.g. delete, logout)
/// - Callbacks or functions that take a single argument you want to ignore
/// - Generic code that requires a concrete type instead of [void]
///
/// Example with [Result]:
/// ```dart
/// Future<Result<Unit>> deleteItem(String id) async {
///   await api.delete(id);
///   return Result.success(Unit());
/// }
/// ```
///
/// Example with pattern matching:
/// ```dart
/// void onResult(Result<Unit> result) {
///   result.handle(
///     onSuccess: (_) => showMessage('Done'),
///     onFailure: (e) => showError(e),
///   );
/// }
/// ```
@Freezed()
abstract class Unit with _$Unit {
  const Unit._();

  /// The single value of [Unit], representing "no meaningful value".
  const factory Unit() = _Unit;
}

/// The identity function: returns [value] unchanged.
///
/// Useful in generic code or when you need to pass a "do nothing" transformation
/// (e.g. `list.map(id)` to clone a list, or as a default combiner).
T id<T>(T value) => value;
