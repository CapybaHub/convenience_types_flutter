import 'package:convenience_types/types/maybe.dart';
import 'package:convenience_types/types/result.dart';
import 'package:convenience_types/errors/app_error.dart';

/// Extension for `Iterable<Maybe<T>>`
extension MaybeIterableExtension<T> on Iterable<Maybe<T>> {
  /// Transforms an `Iterable<Maybe<T>>` into a `Maybe<List<T>>`.
  ///
  /// Returns [Just]\([List]\<T>) if all elements are [Just].
  /// Returns [Nothing] if any element is [Nothing].
  Maybe<List<T>> sequence() {
    final list = <T>[];
    for (final maybe in this) {
      if (maybe is Nothing) {
        return Nothing<List<T>>();
      }
      list.add((maybe as Just<T>).value);
    }
    return Just(list);
  }

  /// Returns all values from [Just] elements, discarding [Nothing]s.
  Iterable<T> get values => whereType<Just<T>>().map((j) => j.value);

  /// Returns all [Nothing] elements from the iterable.
  Iterable<Nothing<T>> get nothings => whereType<Nothing<T>>();
}

/// Extension for `Iterable<Result<T>>`
extension ResultIterableExtension<T> on Iterable<Result<T>> {
  /// Transforms an `Iterable<Result<T>>` into a `Result<List<T>>`.
  ///
  /// Returns [Success]\([List]\<T>) if all elements are [Success].
  /// Returns the first [Failure] encountered if any element fails.
  Result<List<T>> sequence() {
    final list = <T>[];
    for (final result in this) {
      if (result is Failure) {
        return Failure<List<T>>((result as Failure).error);
      }
      list.add((result as Success<T>).data);
    }
    return Success(list);
  }

  /// Returns all data from [Success] elements, discarding [Failure]s.
  Iterable<T> get successes => whereType<Success<T>>().map((s) => s.data);

  /// Returns all errors from [Failure] elements, discarding [Success]es.
  Iterable<AppError> get failures => whereType<Failure<T>>().map((f) => f.error);
}

extension IterableTraverseMaybeExtension<T> on Iterable<T> {
  /// Maps each element to a `Maybe<R>` using [combiner], and sequences the results.
  Maybe<List<R>> traverseMaybe<R>(Maybe<R> Function(T) combiner) {
    return map(combiner).sequence();
  }
}

extension IterableTraverseResultExtension<T> on Iterable<T> {
  /// Maps each element to a `Result<R>` using [combiner], and sequences the results.
  Result<List<R>> traverseResult<R>(Result<R> Function(T) combiner) {
    return map(combiner).sequence();
  }
}
