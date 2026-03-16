import 'package:convenience_types/errors/storage_error.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StorageError subclasses', () {
    test('StorageUnknownError', () {
      const e = StorageUnknownError(slug: 's', msg: 'm', stackTrace: 't');
      expect(e.slug, 's');
      expect(e.msg, 'm');
      expect(e.stackTrace, 't');
    });

    test('StorageNotFoundError', () {
      const e = StorageNotFoundError(slug: 's', msg: 'm', stackTrace: 't');
      expect(e.slug, 's');
      expect(e.msg, 'm');
      expect(e.stackTrace, 't');
    });
  });
}
