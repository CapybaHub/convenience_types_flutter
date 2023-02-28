import 'package:convenience_types/errors/app_error.dart';
import 'package:convenience_types/types/maybe.dart';
import 'package:convenience_types/types/request_status.dart';
import 'package:convenience_types/types/result.dart';
import 'package:flutter_test/flutter_test.dart';

class TestMapType {
  dynamic data;

  TestMapType(this.data);
}

void main() {
  group(
    'Test cast cases',
    () {
      test(
        'It should throw an exception if you try to cast a Just into a Nothing',
        () {
          Maybe testJust = const Just(true);

          try {
            testJust.asNothing;
            fail('It shouldnt get here');
          } catch (e) {
            expect(e, isA<TypeError>());
          }
        },
      );

      test(
        'It should throw an exception if you try to cast a Nothing into a Just',
        () {
          Maybe testNothing = const Nothing();

          try {
            testNothing.asJust;
            fail('It shouldnt get here');
          } catch (e) {
            expect(e, isA<TypeError>());
          }
        },
      );
    },
  );

  group(
    "Maybe.from",
    () {
      test(
        'It should return a nothing if the inputed value is null',
        () {
          Maybe testMaybe = Maybe.from(null);

          testMaybe.when(
            nothing: () => expect(true, true),
            just: (_) => fail("unexpected just"),
          );
        },
      );

      test(
        'It should return a Just if the inputed value is not null',
        () {
          expect(Maybe.from(1), const Just(1));
        },
      );
    },
  );

  group(
    'Maybe.fromResult',
    () {
      test(
        'It should return a Just if the input is a Success',
        () {
          Success<bool> testResult = const Success(true);

          Maybe<bool> testMaybe = Maybe.fromResult(testResult);

          expect(testMaybe, const Just(true));
        },
      );

      test(
        'It should return a Nothing if the input is a Failure',
        () {
          Failure<bool> testResult = const Failure(AppUnknownError());

          Maybe<bool> testMaybe = Maybe.fromResult(testResult);

          expect(testMaybe, const Nothing<bool>());
        },
      );
    },
  );

  group(
    'Maybe.fromRequest',
    () {
      test(
        'It should return a Just if the input is a Succeeded',
        () {
          RequestStatus<bool> testRequest = const Succeeded(true);

          Maybe<bool> testMaybe = Maybe.fromRequest(testRequest);

          expect(testMaybe, const Just(true));
        },
      );

      test(
        'It should return a Nothing if the input is a Idle',
        () {
          RequestStatus<bool> testRequest = const Idle();

          Maybe<bool> testMaybe = Maybe.fromRequest(testRequest);

          expect(testMaybe, const Nothing<bool>());
        },
      );

      test(
        'It should return a Nothing if the input is a Loading',
        () {
          RequestStatus<bool> testRequest = const Loading();

          Maybe<bool> testMaybe = Maybe.fromRequest(testRequest);

          expect(testMaybe, const Nothing<bool>());
        },
      );

      test(
        'It should return a Nothing if the input is a Failed',
        () {
          RequestStatus<bool> testRequest = const Failed(AppUnknownError());

          Maybe<bool> testMaybe = Maybe.fromRequest(testRequest);

          expect(testMaybe, const Nothing<bool>());
        },
      );
    },
  );

  group(
    'mapJust',
    () {
      test(
        'It should return the result of the combiner method passing the value inside this, if this is Just',
        () {
          Maybe<String> testMaybe = const Just('test');
          Maybe<TestMapType> combiner(String value) {
            return Just(TestMapType(value));
          }

          testMaybe.mapJust(combiner).when(
                nothing: () => fail("unexpected Nothing"),
                just: (combined) {
                  expect(combined, isA<TestMapType>());
                  expect(combined.data, 'test');
                },
              );
        },
      );

      test(
        'It should return Nothing, if this is Nothing',
        () {
          Maybe<String> testMaybe = const Nothing();
          Maybe<TestMapType> combiner(String value) {
            return Just(TestMapType(value));
          }

          expect(testMaybe.mapJust<TestMapType>(combiner),
              const Nothing<TestMapType>());
        },
      );
    },
  );

  group(
    'Test getOrElse method',
    () {
      test(
        'It should return the value when its a Just with a value',
        () {
          const bool mockValue = true;
          Maybe testJust = const Just(mockValue);

          expect(testJust.getOrElse(false), mockValue);
        },
      );

      test(
        'It should return the fallback value when its a Just with a null value',
        () {
          Maybe testJust = const Just(null);

          expect(testJust.getOrElse(false), false);
        },
      );

      test(
        'It should return the fallback value when its a Nothing',
        () {
          Maybe testJust = const Nothing();

          expect(testJust.getOrElse(false), false);
        },
      );
    },
  );
}
