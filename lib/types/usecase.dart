import 'package:convenience_types/types/types.dart';

/// Base type for a use case: a single async operation that takes [Params] and returns [Result]&lt;[T]&gt;.
///
/// Use [NoParams] for use cases that take no input (e.g. `UseCase<T, NoParams>`).
abstract class UseCase<T, Params> {
  const UseCase();

  /// Executes the use case with [params]; returns a [Future] of [Result]&lt;[T]&gt;.
  Future<Result<T>> call(Params params);
}
