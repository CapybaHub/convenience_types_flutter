import 'package:convenience_types/errors/value_errors.dart';
import 'package:convenience_types/types/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ValueError subclasses', () {
    test('UnexpectedValueError', () {
      const result = Failure<String>(InvalidEmail(failedValue: 'x'));
      const e = UnexpectedValueError<String>(
        result,
        msg: 'm',
        slug: 's',
        stackTrace: 't',
      );

      expect(e.value, result);
      expect(e.slug, 's');
      expect(e.toString(), 'UnexpectedValueError: $result');
    });

    test('InvalidEmail', () {
      const e = InvalidEmail(failedValue: 'bad', slug: 's', msg: 'm');
      expect(e.failedValue, 'bad');
      expect(e.toString(), 'InvalidEmail: bad');
    });

    test('InvalidPassword', () {
      const e = InvalidPassword(failedValue: 'bad', slug: 's', msg: 'm');
      expect(e.failedValue, 'bad');
      expect(e.toString(), 'InvalidPassword: bad');
    });

    test('InvalidUserName', () {
      const e = InvalidUserName(failedValue: 'bad', slug: 's', msg: 'm');
      expect(e.failedValue, 'bad');
      expect(e.toString(), 'InvalidUserName: bad');
    });

    test('InvalidName', () {
      const e = InvalidName(failedValue: 'bad', slug: 's', msg: 'm');
      expect(e.failedValue, 'bad');
      expect(e.toString(), 'InvalidName: bad');
    });

    test('InvalidOTP', () {
      const e = InvalidOTP(failedValue: 'bad', slug: 's', msg: 'm');
      expect(e.failedValue, 'bad');
      expect(e.toString(), 'InvalidOTP: bad');
    });

    test('DescriptionTooShort', () {
      const e = DescriptionTooShort(failedValue: 'bad', slug: 's', msg: 'm');
      expect(e.failedValue, 'bad');
    });

    test('DescriptionTooLong', () {
      const e = DescriptionTooLong(failedValue: 'bad', slug: 's', msg: 'm');
      expect(e.failedValue, 'bad');
    });

    test('InsufficientDetail', () {
      const e = InsufficientDetail(failedValue: 'bad', slug: 's', msg: 'm');
      expect(e.failedValue, 'bad');
    });

    test('InvalidCharacters', () {
      const e = InvalidCharacters(failedValue: 'bad', slug: 's', msg: 'm');
      expect(e.failedValue, 'bad');
    });
  });
}
