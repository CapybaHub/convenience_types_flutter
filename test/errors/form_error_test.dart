import 'package:convenience_types/errors/form_error.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FormError', () {
    test('Construction', () {
      const e = FormError(slug: 's', msg: 'm', stackTrace: 't');
      expect(e.slug, 's');
      expect(e.msg, 'm');
      expect(e.stackTrace, 't');
    });
  });
}
