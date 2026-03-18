import 'package:flutter_test/flutter_test.dart';
import 'package:convenience_types/types/maybe.dart';
import 'package:convenience_types/types/result.dart';
import 'package:convenience_types/util/iterable_extensions.dart';
import 'package:convenience_types/errors/app_error.dart';

void main() {
  group('Iterable Extensions for Maybe', () {
    test('sequence returns Just detailed list if all Just', () {
      final iter = [const Just(1), const Just(2), const Just(3)];
      final seq = iter.sequence();
      
      expect(seq.isJust, isTrue);
      expect((seq as Just<List<int>>).value, equals([1, 2, 3]));
    });

    test('sequence returns Nothing if any is Nothing', () {
      final iter = [const Just(1), const Nothing<int>(), const Just(3)];
      final seq = iter.sequence();
      
      expect(seq.isNothing, isTrue);
    });

    test('traverseMaybe works correctly', () {
      final inputs = [1, 2, 3];
      final res1 = inputs.traverseMaybe((i) => Just(i * 2));
      
      expect(res1.isJust, isTrue);
      expect((res1 as Just).value, equals([2, 4, 6]));

      final res2 = inputs.traverseMaybe((i) => i == 2 ? const Nothing<int>() : Just(i * 2));
      expect(res2.isNothing, isTrue);
    });

    test('values and nothings getters work correctly', () {
      final iter = [const Just(1), const Nothing<int>(), const Just(3)];
      expect(iter.values, equals([1, 3]));
      expect(iter.nothings.length, equals(1));
    });
  });

  group('Iterable Extensions for Result', () {
    test('sequence returns Success if all Success', () {
      final iter = [const Success<int>(1), const Success<int>(2), const Success<int>(3)];
      final seq = iter.sequence();
      
      expect(seq.isSuccess, isTrue);
      expect((seq as Success<List<int>>).data, equals([1, 2, 3]));
    });

    test('sequence returns first Failure if any fails', () {
      final error1 = const AppUnknownError(slug: 'e1');
      final error2 = const AppUnknownError(slug: 'e2');
      
      final iter = [
        const Success<int>(1),
        Failure<int>(error1),
        const Success<int>(3),
        Failure<int>(error2),
      ];
      final seq = iter.sequence();
      
      expect(seq.isFailure, isTrue);
      expect((seq as Failure<List<int>>).error, equals(error1));
    });

    test('traverseResult works correctly', () {
      final inputs = [1, 2, 3];
      final res1 = inputs.traverseResult((i) => Success<int>(i * 2));
      
      expect(res1.isSuccess, isTrue);
      expect((res1 as Success).data, equals([2, 4, 6]));

      final error = const AppUnknownError(slug: 'e');
      final res2 = inputs.traverseResult((i) => i == 2 ? Failure<int>(error) : Success<int>(i * 2));
      expect(res2.isFailure, isTrue);
      expect((res2 as Failure).error, equals(error));
    });

    test('successes and failures getters work correctly', () {
      final error = const AppUnknownError(slug: 'e');
      final iter = [const Success<int>(1), Failure<int>(error), const Success<int>(3)];
      expect(iter.successes, equals([1, 3]));
      expect(iter.failures, equals([error]));
    });
  });
}
