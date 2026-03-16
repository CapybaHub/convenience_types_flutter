import 'package:convenience_types/types/no_params.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NoParams', () {
    test('It should be equal to another NoParams', () {
      expect(const NoParams(), const NoParams());
      expect(const NoParams() == const NoParams(), true);
    });

    test('It should have the same hashCode', () {
      expect(const NoParams().hashCode, const NoParams().hashCode);
    });

    test('It should return a consistent toString', () {
      expect(const NoParams().toString(), 'NoParams()');
    });
  });
}
