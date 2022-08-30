import 'package:convenience_types/types/maybe.dart';
import 'package:flutter_test/flutter_test.dart';

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
