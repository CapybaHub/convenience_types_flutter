import 'package:convenience_types/errors/app_error.dart';
import 'package:convenience_types/errors/http_error.dart';
import 'package:convenience_types/types/maybe.dart';
import 'package:flutter_test/flutter_test.dart';

class _TestAppError extends AppError {
  const _TestAppError({super.slug, super.msg, super.stackTrace});
}

void main() {
  group('AppError base class', () {
    test('== operator compares by slug and runtimeType', () {
      const e1 = _TestAppError(slug: 'error-1', msg: 'A');
      const e2 = _TestAppError(slug: 'error-1', msg: 'B');
      const e3 = _TestAppError(slug: 'error-2', msg: 'A');
      const eOther = AppUnknownError(slug: 'error-1');

      expect(e1 == e2, true); // Same slug, same type
      expect(e1 == e3, false); // Different slug
      expect(e1 == eOther, false); // Different type
    });

    test('hashCode is consistent with ==', () {
      const e1 = _TestAppError(slug: 'error-1', msg: 'A');
      const e2 = _TestAppError(slug: 'error-1', msg: 'B');

      expect(e1.hashCode == e2.hashCode, false); // Hash uses msg/stackTrace too
      expect(
        e1.hashCode,
        const _TestAppError(slug: 'error-1', msg: 'A').hashCode,
      );
    });

    test('toString includes slug, msg, and stackTrace', () {
      const e = _TestAppError(slug: 'my-slug', msg: 'my-msg', stackTrace: 'st');
      expect(
        e.toString(),
        '[_TestAppError]: (slug: my-slug, msg: my-msg, stackTrace: st,)',
      );
    });

    group('maybeResponse', () {
      test('Returns Nothing for non-HttpError', () {
        const e = _TestAppError();
        expect(e.maybeResponse<String>(), isA<Nothing>());
      });

      test('Returns Just with response when error is an HttpError', () {
        const httpError = HttpNotFoundError<String>(response: Just('data'));
        expect(httpError.maybeResponse<String>(), const Just('data'));
      });
    });
  });

  group('Concrete generic AppError subclasses', () {
    test('AppUnknownError', () {
      const e = AppUnknownError(slug: 's', msg: 'm', stackTrace: 't');
      expect(e.slug, 's');
      expect(e.toString().contains('[AppUnknownError]'), true);
      expect(e.toString().contains('slug: s'), true);
    });

    test('ParseError', () {
      const e = ParseError(slug: 's', msg: 'm', stackTrace: 't');
      expect(e.slug, 's');
      expect(e.toString().contains('[ParseError]'), true);
    });

    test('EntityNotFitError', () {
      const e = EntityNotFitError(slug: 's', msg: 'm', stackTrace: 't');
      expect(e.slug, 's');
      expect(e.toString().contains('[EntityNotFitError]'), true);
    });

    test('FailedToShareError', () {
      const e = FailedToShareError(slug: 's', msg: 'm', stackTrace: 't');
      expect(e.slug, 's');
      expect(e.toString().contains('[FailedToShareError]'), true);
    });

    test('TokenNotFoundError', () {
      const e = TokenNotFoundError(slug: 's', msg: 'm', stackTrace: 't');
      expect(e.slug, 's');
      expect(e.toString().contains('[NotFoundError]'), true);
    });
  });
}
