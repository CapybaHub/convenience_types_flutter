import 'package:convenience_types/errors/cache_error.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CacheError subclasses', () {
    test('FailedToCacheError', () {
      const e = FailedToCacheError(slug: 's', msg: 'm', stackTrace: 't');
      expect(e.slug, 's');
      expect(e.stackTrace, 't');
      expect(e.toString(), '[FailedToCacheError]: {slug: s, msg: m}');
    });

    test('FileAlreadyCachedError', () {
      const e = FileAlreadyCachedError(slug: 's', msg: 'm', stackTrace: 't');
      expect(e.slug, 's');
      expect(e.toString(), '[FileAlreadyCachedError]: {slug: s, msg: m}');
    });

    test('NotCachedError', () {
      const e = NotCachedError(slug: 's', msg: 'm', stackTrace: 't');
      expect(e.slug, 's');
      expect(e.toString(), '[NotCachedError]: {slug: s, msg: m}');
    });

    test('FailedToUnloadError', () {
      const e = FailedToUnloadError(slug: 's', msg: 'm', stackTrace: 't');
      expect(e.slug, 's');
      expect(e.toString(), '[FailedToUnloadError]: {slug: s, msg: m}');
    });
  });
}
