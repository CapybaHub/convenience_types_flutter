import 'package:convenience_types/errors/default_error_messages.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DefaultErrorMessages constants', () {
    test('Are non-empty strings', () {
      expect(DefaultErrorMessages.unknownError.isNotEmpty, true);
      expect(DefaultErrorMessages.cacheError.isNotEmpty, true);
      expect(DefaultErrorMessages.shareError.isNotEmpty, true);
      expect(DefaultErrorMessages.storageError.isNotEmpty, true);
      expect(DefaultErrorMessages.deviceError.isNotEmpty, true);
      expect(DefaultErrorMessages.noInternetConnectionError.isNotEmpty, true);
      expect(DefaultErrorMessages.waitCurrentRequest.isNotEmpty, true);
    });
  });
}
