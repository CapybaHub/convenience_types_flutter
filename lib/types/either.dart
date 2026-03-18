import 'package:freezed_annotation/freezed_annotation.dart';

part 'either.freezed.dart';

/// A type that represents a value of one of two possible types (a disjoint union).
/// Instances of [Either] are either an instance of [Left] or [Right].
///
/// By convention, [Left] is used for failure and [Right] is used for success.
@Freezed()
sealed class Either<L, R> with _$Either<L, R> {
  const Either._();

  /// Represents the left side of the disjoint union (by convention, an error).
  const factory Either.left(L value) = Left;

  /// Represents the right side of the disjoint union (by convention, a success).
  const factory Either.right(R value) = Right;

  /// True if this is [Left].
  bool get isLeft => this is Left;

  /// True if this is [Right].
  bool get isRight => this is Right;

  /// Folds the Either into a single value, applying [onLeft] if this is [Left],
  /// and [onRight] if this is [Right].
  T fold<T>(
    T Function(L left) onLeft,
    T Function(R right) onRight,
  ) {
    if (this is Left) {
      return onLeft((this as Left<L, R>).value);
    } else {
      return onRight((this as Right<L, R>).value);
    }
  }

  /// Maps the right value, leaving the left value unchanged.
  Either<L, R2> mapRight<R2>(R2 Function(R right) combiner) {
    return fold(
      (left) => Left<L, R2>(left),
      (right) => Right<L, R2>(combiner(right)),
    );
  }

  /// Maps the left value, leaving the right value unchanged.
  Either<L2, R> mapLeft<L2>(L2 Function(L left) combiner) {
    return fold(
      (left) => Left<L2, R>(combiner(left)),
      (right) => Right<L2, R>(right),
    );
  }
}
