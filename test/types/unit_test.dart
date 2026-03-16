import 'package:convenience_types/types/unit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Unit', () {
    test('It should be equal to another Unit', () {
      expect(const Unit(), const Unit());
      expect(const Unit() == const Unit(), true);
    });

    test('It should have the same hashCode', () {
      expect(const Unit().hashCode, const Unit().hashCode);
    });

    test('It should return a consistent toString', () {
      expect(const Unit().toString(), 'Unit()');
    });
  });

  group('identity', () {
    test('It should return the exact same integer value', () {
      expect(identity(42), 42);
    });

    test('It should return the exact same string value', () {
      expect(identity('test'), 'test');
    });

    test('It should return the exact same object reference', () {
      final obj = Object();
      expect(identical(identity(obj), obj), true);
    });
  });
}
