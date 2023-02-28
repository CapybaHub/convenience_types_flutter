import 'package:convenience_types/errors/app_error.dart';
import 'package:convenience_types/types/maybe.dart';
import 'package:convenience_types/types/request_status.dart';
import 'package:convenience_types/types/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'casts',
    () {
      test(
        'It shouldnt throw an exception if you try to cast an Idle to an Idle',
        () {
          RequestStatus testRequestStatus = const Idle();

          try {
            RequestStatus casted = testRequestStatus.asIdle;

            expect(testRequestStatus, casted);
          } catch (e) {
            fail('It shouldnt get here');
          }
        },
      );

      test(
        'It should throw an exception if you try to cast an Idle to a Loading',
        () {
          RequestStatus testRequestStatus = const Idle();

          try {
            testRequestStatus.asLoading;
            fail('It shouldnt get here');
          } catch (e) {
            expect(e, isA<TypeError>());
          }
        },
      );

      test(
        'It should throw an exception if you try to cast an Idle to a Success',
        () {
          RequestStatus testRequestStatus = const Idle();

          try {
            testRequestStatus.asSucceeded;
            fail('It shouldnt get here');
          } catch (e) {
            expect(e, isA<TypeError>());
          }
        },
      );

      test(
        'It should throw an exception if you try to cast an Idle to a Failed',
        () {
          RequestStatus testRequestStatus = const Idle();

          try {
            testRequestStatus.asFailed;
            fail('It shouldnt get here');
          } catch (e) {
            expect(e, isA<TypeError>());
          }
        },
      );

      test(
        'It should throw an exception if you try to cast a Loading to a Idle',
        () {
          RequestStatus testRequestStatus = const Loading();

          try {
            testRequestStatus.asIdle;
            fail('It shouldnt get here');
          } catch (e) {
            expect(e, isA<TypeError>());
          }
        },
      );

      test(
        'It shouldnt throw an exception if you try to cast a Loading to a Loading',
        () {
          RequestStatus testRequestStatus = const Loading();

          try {
            RequestStatus casted = testRequestStatus.asLoading;

            expect(testRequestStatus, casted);
          } catch (e) {
            fail('It shouldnt get here');
          }
        },
      );

      test(
        'It should throw an exception if you try to cast a Loading to a Succeeded',
        () {
          RequestStatus testRequestStatus = const Loading();

          try {
            testRequestStatus.asSucceeded;
            fail('It shouldnt get here');
          } catch (e) {
            expect(e, isA<TypeError>());
          }
        },
      );

      test(
        'It should throw an exception if you try to cast a Loading to a Failed',
        () {
          RequestStatus testRequestStatus = const Loading();

          try {
            testRequestStatus.asFailed;
            fail('It shouldnt get here');
          } catch (e) {
            expect(e, isA<TypeError>());
          }
        },
      );

      test(
        'It should throw an exception if you try to cast a Succeeded to an Idle',
        () {
          RequestStatus testRequestStatus = const Succeeded(true);

          try {
            testRequestStatus.asIdle;
            fail('It shouldnt get here');
          } catch (e) {
            expect(e, isA<TypeError>());
          }
        },
      );

      test(
        'It should throw an exception if you try to cast a Succeeded to a Loading',
        () {
          RequestStatus testRequestStatus = const Succeeded(true);

          try {
            testRequestStatus.asLoading;
            fail('It shouldnt get here');
          } catch (e) {
            expect(e, isA<TypeError>());
          }
        },
      );

      test(
        'It shouldnt throw an exception if you try to cast a Succeeded to a Succeeded',
        () {
          RequestStatus testRequestStatus = const Succeeded(true);

          try {
            RequestStatus casted = testRequestStatus.asSucceeded;

            expect(testRequestStatus, casted);
          } catch (e) {
            fail('It shouldnt get here');
          }
        },
      );

      test(
        'It should throw an exception if you try to cast a Succeeded to a Failed',
        () {
          RequestStatus testRequestStatus = const Succeeded(true);

          try {
            testRequestStatus.asFailed;
            fail('It shouldnt get here');
          } catch (e) {
            expect(e, isA<TypeError>());
          }
        },
      );

      test(
        'It should throw an exception if you try to cast a Failed to an Idle',
        () {
          RequestStatus testRequestStatus = const Failed(AppUnknownError());

          try {
            testRequestStatus.asIdle;
            fail('It shouldnt get here');
          } catch (e) {
            expect(e, isA<TypeError>());
          }
        },
      );

      test(
        'It should throw an exception if you try to cast a Failed to a Loading',
        () {
          RequestStatus testRequestStatus = const Failed(AppUnknownError());

          try {
            testRequestStatus.asLoading;
            fail('It shouldnt get here');
          } catch (e) {
            expect(e, isA<TypeError>());
          }
        },
      );

      test(
        'It should throw an exception if you try to cast a Failed to a Succeeded',
        () {
          RequestStatus testRequestStatus = const Failed(AppUnknownError());

          try {
            testRequestStatus.asSucceeded;
            fail('It shouldnt get here');
          } catch (e) {
            expect(e, isA<TypeError>());
          }
        },
      );

      test(
        'It shouldnt throw an exception if you try to cast a Failed to a Failed',
        () {
          RequestStatus testRequestStatus = const Failed(AppUnknownError());

          try {
            RequestStatus casted = testRequestStatus.asFailed;

            expect(testRequestStatus, casted);
          } catch (e) {
            fail('It shouldnt get here');
          }
        },
      );
    },
  );

  group(
    'RequestStatus.fromResult',
    () {
      test(
        'It should return a Failed if the input is a Failure',
        () {
          Result<bool> testResult = const Failure(AppUnknownError());

          expect(
            RequestStatus.fromResult(testResult),
            const Failed<bool>(AppUnknownError()),
          );
        },
      );

      test(
        'It should return a Succeeded if the input is a Success',
        () {
          Result<bool> testResult = const Success(true);

          expect(
            RequestStatus.fromResult(testResult),
            const Succeeded(true),
          );
        },
      );
    },
  );

  group(
    'get maybeData',
    () {
      test(
        'it should return a Just if the request status is Succeeded',
        () {
          RequestStatus<bool> testRequestStatus = const Succeeded(true);

          expect(testRequestStatus.maybeData, const Just(true));
        },
      );

      test(
        'it should return a Nothing if the request status is Idle',
        () {
          RequestStatus<bool> testRequestStatus = const Idle();

          expect(testRequestStatus.maybeData, const Nothing<bool>());
        },
      );

      test(
        'it should return a Nothing if the request status is Loading',
        () {
          RequestStatus<bool> testRequestStatus = const Loading();

          expect(testRequestStatus.maybeData, const Nothing<bool>());
        },
      );

      test(
        'it should return a Nothing if the request status is Failed',
        () {
          RequestStatus<bool> testRequestStatus =
              const Failed(AppUnknownError());

          expect(testRequestStatus.maybeData, const Nothing<bool>());
        },
      );
    },
  );
}
