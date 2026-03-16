import 'package:convenience_types/errors/app_error.dart';
import 'package:convenience_types/types/maybe.dart';
import 'package:convenience_types/types/result.dart';
import 'package:flutter_test/flutter_test.dart';

class TestMapType {
  dynamic data;

  TestMapType(this.data);
}

void main() {
  test(
    'it Should throw an exception if you try to cast a Success into a Failure',
    () {
      Result testSuccess = const Success(true);

      try {
        testSuccess.asFailure;
        fail('It shouldnt get here');
      } catch (e) {
        expect(e, isA<TypeError>());
      }
    },
  );

  test(
    'it Should throw an exception if you try to cast a Failure into a Success',
    () {
      Result testSuccess = const Failure(AppUnknownError());

      try {
        testSuccess.asSuccess;
        fail('It shouldnt get here');
      } catch (e) {
        expect(e, isA<TypeError>());
      }
    },
  );

  group(
    'mapSuccess',
    () {
      test(
        'It should return the result of the combiner passing the data inside Result, if this is a Success',
        () {
          Result<String> testResult = const Success('test');
          Result<TestMapType> combiner(String data) {
            return Success(TestMapType(data));
          }

          testResult.mapSuccess(combiner).handle(
            onSuccess: (data) {
              expect(data, isA<TestMapType>());
              expect(data.data, 'test');
            },
            onFailure: (error) {
              fail('unexpected failure');
            },
          );
        },
      );

      test(
        'It should return Failure, if this is a Failure',
        () {
          Result<String> testResult = const Failure(AppUnknownError());
          Result<TestMapType> combiner(String data) {
            return Success(TestMapType(data));
          }

          expect(
            testResult.mapSuccess(combiner),
            isA<Failure>(),
          );
        },
      );
    },
  );

  group(
    'get maybeData',
    () {
      test(
        'it should return Just if this is a Success',
        () {
          Result<bool> testResult = const Success(true);

          expect(testResult.maybeData, const Just(true));
        },
      );

      test(
        'it should return Nothing if this is a Failure',
        () {
          Result<bool> testResult = const Failure(AppUnknownError());

          expect(testResult.maybeData, const Nothing<bool>());
        },
      );
    },
  );

  group(
    'mapAsyncSuccess',
    () {
      test(
        'It should return Failure, if this is a Failure',
        () {
          Result<String> testResult = const Failure(AppUnknownError());
          Future<Result<TestMapType>> combiner(String data) async {
            return Success(TestMapType(data));
          }

          expect(
            testResult.mapAsyncSuccess(combiner),
            isA<Failure>(),
          );
        },
      );

      test(
        'It should return the result of the combiner passing the data inside Result, if this is a Success',
        () async {
          Result<String> testResult = const Success('test');
          Future<Result<TestMapType>> combiner(String data) async {
            return Success(TestMapType(data));
          }

          (await testResult.mapAsyncSuccess(combiner)).handle(
            onSuccess: (data) {
              expect(data, isA<TestMapType>());
              expect(data.data, 'test');
            },
            onFailure: (error) {
              fail('unexpected failure');
            },
          );
        },
      );
    },
  );

  group('isSuccess and isFailure', () {
    test('isSuccess is true for Success and false for Failure', () {
      expect(const Success(true).isSuccess, true);
      expect(const Failure(AppUnknownError()).isSuccess, false);
    });
    test('isFailure is true for Failure and false for Success', () {
      expect(const Failure(AppUnknownError()).isFailure, true);
      expect(const Success(true).isFailure, false);
    });
  });

  group('handle', () {
    test('Calls onSuccess and returns its result when Success', () {
      final res = const Success(42).handle(
        onSuccess: (data) => data * 2,
        onFailure: (_) => 0,
      );
      expect(res, 84);
    });
    test('Calls onFailure and returns its result when Failure', () {
      final res = const Failure(AppUnknownError()).handle(
        onSuccess: (data) => 1,
        onFailure: (_) => 0,
      );
      expect(res, 0);
    });
  });

  group('mapFailure', () {
    test('Returns the same result when Success', () {
      final res = const Success<String>('a').mapFailure((_) => const Success('b'));
      expect(res, const Success('a'));
    });
    test('Applies combiner when Failure', () {
      final res = const Failure<String>(AppUnknownError()).mapFailure((_) => const Success('b'));
      expect(res, const Success('b'));
    });
  });

  group('mapAsyncFailure', () {
    test('Returns the same result when Success', () async {
      final res = await const Success<String>('a').mapAsyncFailure((_) async => const Success('b'));
      expect(res, const Success('a'));
    });
    test('Applies combiner when Failure', () async {
      final res = await const Failure<String>(AppUnknownError()).mapAsyncFailure((_) async => const Success('b'));
      expect(res, const Success('b'));
    });
  });
}

