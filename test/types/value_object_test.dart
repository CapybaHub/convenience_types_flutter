import 'package:convenience_types/errors/value_errors.dart';
import 'package:convenience_types/types/result.dart';
import 'package:convenience_types/types/unit.dart';
import 'package:convenience_types/types/value_object.dart';
import 'package:flutter_test/flutter_test.dart';

class _TestValidValueObject extends ValueObject<String> {
  @override
  final Result<String> value;

  const _TestValidValueObject(this.value);
}

class _TestInvalidValueObject extends ValueObject<String> {
  @override
  final Result<String> value;

  const _TestInvalidValueObject(this.value);
}

void main() {
  group('ValueObject', () {
    const validValue = _TestValidValueObject(Success('test'));
    const invalidValue =
        _TestInvalidValueObject(Failure(InvalidEmail(failedValue: 'bad')));

    group('isValid', () {
      test('It should return true when value is Success', () {
        expect(validValue.isValid(), true);
      });

      test('It should return false when value is Failure', () {
        expect(invalidValue.isValid(), false);
      });
    });

    group('getOrCrash', () {
      test('It should return the internal value when Success', () {
        expect(validValue.getOrCrash(), 'test');
      });

      test('It should throw UnexpectedValueError when Failure', () {
        expect(
          () => invalidValue.getOrCrash(),
          throwsA(isA<UnexpectedValueError<String>>()),
        );
      });
    });

    group('failureOrUnit', () {
      test('It should return Success(Unit) when Success', () {
        expect(validValue.failureOrUnit, const Success(Unit()));
      });

      test('It should return the same Failure when Failure', () {
        expect(
          invalidValue.failureOrUnit,
          const Failure<Unit>(InvalidEmail(failedValue: 'bad')),
        );
      });
    });

    group('Equality and HashCode', () {
      test('It should be equal to another instance with the same value', () {
        const val1 = _TestValidValueObject(Success('test'));
        const val2 = _TestValidValueObject(Success('test'));

        expect(val1, val2);
        expect(val1 == val2, true);
        expect(val1.hashCode, val2.hashCode);
      });

      test('It should not be equal to an instance with a different value', () {
        const val1 = _TestValidValueObject(Success('test'));
        const val2 = _TestValidValueObject(Success('test2'));

        expect(val1 == val2, false);
        expect(val1.hashCode == val2.hashCode, false);
      });
    });

    group('toString', () {
      test('It should include the inner value inside Value()', () {
        expect(validValue.toString(), 'Value(${const Success('test')})');
      });
    });
  });
}
