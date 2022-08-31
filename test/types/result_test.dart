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
          Result<TestMapType> _combiner(String data) {
            return Success(TestMapType(data));
          }

          testResult.mapSuccess(_combiner).handle(
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
          Result<String> testResult = Failure(AppUnknownError());
          Result<TestMapType> _combiner(String data) {
            return Success(TestMapType(data));
          }

          expect(
            testResult.mapSuccess(_combiner),
            isA<Failure>(),
          );
        },
      );
    },
  );
}
