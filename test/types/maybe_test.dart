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
    'Test value getter',
    () {
      test(
        'It should return the value when its a Just',
        () {
          const bool mockValue = true;
          Maybe testJust = const Just(mockValue);

          expect(testJust.value, mockValue);
          expect(testJust.value, isA<bool>());
        },
      );

      test(
        'It should return null when its a Nothing',
        () {
          Maybe testJust = const Nothing();

          expect(testJust.value, null);
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
