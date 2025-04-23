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

          var _ = switch (testMaybe) {
            Nothing() => expect(true, true),
            Just() => fail("unexpected just"),
          };
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

          var _ = switch (testMaybe.mapJust(combiner)) {
            Nothing() => fail("unexpected Nothing"),
            Just() => (combined) {
                expect(combined, isA<TestMapType>());
                expect(combined.data, 'test');
              },
          };
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

  group(
    'mapAsyncJust',
    () {
      test(
        'It should return Nothing if this is Nothing',
        () {
          Maybe testNothing = const Nothing();

          expect(
            testNothing.mapAsyncJust((_) => const Just(true)),
            const Nothing<bool>(),
          );
        },
      );

      test(
        'It should return the result of the combiner method passing value if this is just',
        () async {
          Maybe<bool> testJust = const Just(true);
          Future<Maybe<String>> combiner(bool val) async {
            return Just(val.toString());
          }

          expect(
            await testJust.mapAsyncJust<String>(combiner),
            const Just('true'),
          );
        },
      );
    },
  );

  group(
    'maybeCombine',
    () {
      Maybe<String> firstJust(int val) => Just(val.toString());
      Maybe<String> secondJust(bool val) => Just(val.toString());
      Maybe<String> bothJust(int number, bool val) =>
          Just('$number${val.toString()}');
      Maybe<String> bothNothing() => const Just('bothNothing');

      test(
        'It should return Nothing if both are Just but no method is passed',
        () {
          var testRecord = (const Just(1), const Just(true));
          expect(
            testRecord.maybeCombine(),
            const Nothing(),
          );
        },
      );

      test(
        'It should return the result of bothJust method if both are Just and bothJust is not null',
        () {
          var testRecord = (const Just(1), const Just(true));
          expect(
            testRecord.maybeCombine(bothJust: bothJust),
            const Just('1true'),
          );
        },
      );

      test(
        'It should return the result of firstJust method if only first value is Just and firstJust is not null',
        () {
          var testRecord = (const Just(1), const Nothing());
          expect(
            testRecord.maybeCombine(firstJust: firstJust),
            const Just('1'),
          );
        },
      );

      test(
        'It should return the result of secondJust method if only second value is Just and secondJust is not null',
        () {
          var testRecord = (const Nothing(), const Just(true));
          expect(
            testRecord.maybeCombine(secondJust: secondJust),
            const Just('true'),
          );
        },
      );

      test(
        'It should return the result of bothJust method if both values are Nothing and bothNothing is not null',
        () {
          var testRecord = (const Nothing(), const Nothing());
          expect(
            testRecord.maybeCombine(bothNothing: bothNothing),
            const Just('bothNothing'),
          );
        },
      );
    },
  );
}
