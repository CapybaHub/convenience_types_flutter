import 'package:convenience_types/errors/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Exceptions', () {
    test('ParseException', () {
      final e = ParseException('bad json');
      expect(e.exception, 'bad json');
      expect(e.toString().contains('bad json'), true);
    });

    test('CacheException', () {
      final e = CacheException('disk full');
      expect(e.exception, 'disk full');
      expect(e.toString().contains('disk full'), true);
    });
  });
}
