import 'package:convenience_types/errors/device_info_error.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DeviceInfoError subclasses', () {
    test('DeviceInfoUnknownError', () {
      const e = DeviceInfoUnknownError(slug: 's', msg: 'm', stackTrace: 't');
      expect(e.slug, 's');
      expect(e.msg, 'm');
      expect(e.stackTrace, 't');
    });

    test('DeviceInfoNotFoundError', () {
      const e = DeviceInfoNotFoundError(slug: 's', msg: 'm', stackTrace: 't');
      expect(e.slug, 's');
      expect(e.msg, 'm');
      expect(e.stackTrace, 't');
    });
  });
}
