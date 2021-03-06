import 'package:convenience_types/errors/app_error.dart';
import 'package:convenience_types/types/result.dart';
import 'package:flutter_test/flutter_test.dart';

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
}
