import 'package:flutter_test/flutter_test.dart';
import 'package:convenience_types/types/try.dart';

void main() {
  group('Try', () {
    test('isSuccess and isFailure getters work properly', () {
      final success = Try<int>.success(42);
      final failure = Try<int>.failure(Exception('oops'));

      expect(success.isSuccess, isTrue);
      expect(success.isFailure, isFalse);

      expect(failure.isSuccess, isFalse);
      expect(failure.isFailure, isTrue);
    });

    test('guard works properly', () {
      final success = Try.guard(() => 42);
      final failure = Try.guard(() => throw Exception('guard error'));

      expect(success.isSuccess, isTrue);
      expect(success.fold((e, s) => null, (v) => v), equals(42));

      expect(failure.isFailure, isTrue);
      expect(failure.fold((e, s) => e.toString(), (v) => ''), equals('Exception: guard error'));
    });

    test('map works properly', () {
      final success = Try<int>.success(42);
      final failure = Try<int>.failure(Exception('oops'));

      final mappedSuccess = success.map((v) => v * 2);
      expect(mappedSuccess.fold((e, s) => 0, (v) => v), equals(84));

      final mappedFailure = failure.map((v) => v * 2);
      expect(mappedFailure.isFailure, isTrue);
    });

    test('getOrElse works properly', () {
      final success = Try<int>.success(42);
      final failure = Try<int>.failure(Exception('oops'));

      expect(success.getOrElse((e, s) => 0), equals(42));
      expect(failure.getOrElse((e, s) => 0), equals(0));
    });
  });
}
