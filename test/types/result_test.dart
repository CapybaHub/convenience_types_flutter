import 'package:convenience_types/errors/app_error.dart';
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
      Result testSuccess = Failure(AppUnknownError());

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
          TestMapType combiner(String data) {
            return TestMapType(data);
          }

          expect(testResult.mapSuccess(combiner), isA<TestMapType>());
          expect(testResult.mapSuccess(combiner)?.data, 'test');
        },
      );

      test(
        'It should return the result of orElse, if this is a Failure and a orElse is passed',
        () {
          Result<String> testResult = Failure(AppUnknownError());
          TestMapType combiner(String data) {
            return TestMapType(data);
          }

          TestMapType orElse(AppError error) {
            return TestMapType('error');
          }

          expect(
            testResult.mapSuccess(combiner, orElse: orElse),
            isA<TestMapType>(),
          );

          expect(
            testResult.mapSuccess(combiner, orElse: orElse)?.data,
            'error',
          );
        },
      );

      test(
        'It should return the null, if this is a Failure and no orElse is passed',
        () {
          Result<String> testResult = Failure(AppUnknownError());
          TestMapType combiner(String data) {
            return TestMapType(data);
          }

          expect(
            testResult.mapSuccess(combiner),
            null,
          );
        },
      );
    },
  );
}
