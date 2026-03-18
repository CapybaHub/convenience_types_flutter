import 'package:flutter_test/flutter_test.dart';
import 'package:convenience_types/types/either.dart';

void main() {
  group('Either', () {
    test('isLeft and isRight getters work properly', () {
      final left = Either<String, int>.left('error');
      final right = Either<String, int>.right(42);

      expect(left.isLeft, isTrue);
      expect(left.isRight, isFalse);
      
      expect(right.isLeft, isFalse);
      expect(right.isRight, isTrue);
    });

    test('fold works properly', () {
      final left = Either<String, int>.left('error');
      final right = Either<String, int>.right(42);

      expect(
        left.fold((l) => 'L: $l', (r) => 'R: $r'),
        equals('L: error'),
      );

      expect(
        right.fold((l) => 'L: $l', (r) => 'R: $r'),
        equals('R: 42'),
      );
    });

    test('mapRight works properly', () {
      final left = Either<String, int>.left('error');
      final right = Either<String, int>.right(42);

      expect(left.mapRight((r) => r * 2), equals(Either<String, int>.left('error')));
      expect(right.mapRight((r) => r * 2), equals(Either<String, int>.right(84)));
    });

    test('mapLeft works properly', () {
      final left = Either<String, int>.left('error');
      final right = Either<String, int>.right(42);

      expect(left.mapLeft((l) => '$l!'), equals(Either<String, int>.left('error!')));
      expect(right.mapLeft((l) => '$l!'), equals(Either<String, int>.right(42)));
    });
  });
}
