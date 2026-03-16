import 'dart:convert';
import 'package:convenience_types/errors/http_error.dart';
import 'package:convenience_types/types/maybe.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// --- Mocks ---
class MockDioException extends Mock implements DioException {}

class MockRequestOptions extends Mock implements RequestOptions {}

class MockResponse<T> extends Mock implements Response<T> {}

class MockHeaders extends Mock implements Headers {}

void main() {
  group('HttpError concrete subclasses', () {
    test('HttpNetworkError', () {
      const e = HttpNetworkError(slug: 's', msg: 'm', stackTrace: 't');
      expect(e.code, -2); // Default
    });

    test('HttpUnknownError', () {
      const e = HttpUnknownError(slug: 's', msg: 'm', stackTrace: 't');
      expect(e.code, -2);
    });

    test('HttpBadRequestError', () {
      const e = HttpBadRequestError(
        slug: 's',
        msg: 'm',
        errors: {'msg_dev': 'dev issue'},
      );
      expect(e.code, 400);
      expect(e.msgDev, 'dev issue');
    });

    test('HttpUnauthorizedError', () {
      const e = HttpUnauthorizedError();
      expect(e.code, 401);
    });

    test('HttpForbiddenError', () {
      const e = HttpForbiddenError();
      expect(e.code, 403);
    });

    test('HttpNotFoundError', () {
      const e = HttpNotFoundError();
      expect(e.code, 404);
    });

    test('HttpGoneError', () {
      const e = HttpGoneError();
      expect(e.code, 410);
    });

    test('UnprocessableEntityError', () {
      const e = UnprocessableEntityError(
        errors: {'msg_dev': 'validation failed'},
      );
      expect(e.code, 422);
      expect(e.msgDev, 'validation failed');
    });

    test('HttpInternalServerError', () {
      const e = HttpInternalServerError();
      expect(e.code, 500);
    });

    test('NoInternetConnectionError', () {
      const e = NoInternetConnectionError();
      expect(e.code, -2);
    });
  });

  group('parseHttpError mapping', () {
    late MockDioException mockDioException;
    late MockRequestOptions mockRequestOptions;

    setUp(() {
      mockDioException = MockDioException();
      mockRequestOptions = MockRequestOptions();
      when(() => mockDioException.requestOptions).thenReturn(mockRequestOptions);
      when(() => mockRequestOptions.path).thenReturn('/api/test');
      when(() => mockDioException.message).thenReturn(null);
      when(() => mockDioException.stackTrace).thenReturn(StackTrace.empty);
    });

    Future<void> runStatusTest(int statusCode, Type expectedTypeError) async {
      final mockResponse = MockResponse<dynamic>();
      when(() => mockResponse.statusCode).thenReturn(statusCode);
      when(() => mockResponse.data).thenReturn({'msg': 'error msg'});

      final mockHeaders = MockHeaders();
      when(() => mockResponse.headers).thenReturn(mockHeaders);
      when(() => mockHeaders.value('Content-Type')).thenReturn('application/json');

      when(() => mockDioException.type).thenReturn(DioExceptionType.badResponse);
      when(() => mockDioException.response).thenReturn(mockResponse);

      final result = await parseHttpError(error: mockDioException);

      expect(result.runtimeType.toString(), startsWith(expectedTypeError.toString()));
      expect(result.msg, 'error msg');
      expect(result.slug, '/api/test');
    }

    test('Maps HTTP 400 to HttpBadRequestError', () => runStatusTest(400, HttpBadRequestError));
    test('Maps HTTP 401 to HttpUnauthorizedError', () => runStatusTest(401, HttpUnauthorizedError));
    test('Maps HTTP 403 to HttpForbiddenError', () => runStatusTest(403, HttpForbiddenError));
    test('Maps HTTP 404 to HttpNotFoundError', () => runStatusTest(404, HttpNotFoundError));
    test('Maps HTTP 410 to HttpGoneError', () => runStatusTest(410, HttpGoneError));
    test('Maps HTTP 422 to UnprocessableEntityError', () => runStatusTest(422, UnprocessableEntityError));
    test('Maps HTTP 500 to HttpInternalServerError', () => runStatusTest(500, HttpInternalServerError));
    test('Maps unhandled status code to HttpUnknownError', () => runStatusTest(418, HttpUnknownError));

    test('Uses defaultErrorMessage when response has no msg', () async {
      final mockResponse = MockResponse<dynamic>();
      when(() => mockResponse.statusCode).thenReturn(404);
      when(() => mockResponse.data).thenReturn({}); // Empty resp

      final mockHeaders = MockHeaders();
      when(() => mockResponse.headers).thenReturn(mockHeaders);
      when(() => mockHeaders.value('Content-Type')).thenReturn('application/json');

      when(() => mockDioException.type).thenReturn(DioExceptionType.badResponse);
      when(() => mockDioException.response).thenReturn(mockResponse);

      final result = await parseHttpError(
        error: mockDioException,
        defaultErrorMessage: 'fallback',
      );

      expect(result.msg, 'fallback');
      expect(result.runtimeType.toString(), startsWith('HttpNotFoundError'));
    });

    test('Uses handleErrorMessage callback when provided', () async {
      final mockResponse = MockResponse<dynamic>();
      when(() => mockResponse.statusCode).thenReturn(400);
      when(() => mockResponse.data).thenReturn(<String, dynamic>{});

      final mockHeaders = MockHeaders();
      when(() => mockResponse.headers).thenReturn(mockHeaders);
      when(() => mockHeaders.value('Content-Type')).thenReturn('application/json');

      when(() => mockDioException.type).thenReturn(DioExceptionType.badResponse);
      when(() => mockDioException.response).thenReturn(mockResponse);

      final result = await parseHttpError(
        error: mockDioException,
        handleErrorMessage: ({required error}) => 'custom msg',
      );

      expect(result.msg, 'custom msg');
    });

    test('Maps response data using errorResponseSerializer', () async {
      final mockResponse = MockResponse<dynamic>();
      when(() => mockResponse.statusCode).thenReturn(400);
      when(() => mockResponse.data).thenReturn('{"foo":"bar"}');
      when(() => mockResponse.headers).thenReturn(MockHeaders());

      when(() => mockDioException.type).thenReturn(DioExceptionType.badResponse);
      when(() => mockDioException.response).thenReturn(mockResponse);

      final result = await parseHttpError<Map<String, dynamic>>(
        error: mockDioException,
        errorResponseSerializer: (data) => jsonDecode(data as String) as Map<String, dynamic>,
      );

      expect((result.response as Just<Map<String, dynamic>>).value['foo'], 'bar');
    });
  });

  group('parseSocketException logic', () {
    test('parseHttpError catches errors and falls back to HttpUnknownError', () async {
      final mockError = MockDioException();
      when(() => mockError.requestOptions).thenThrow(Exception('Simulated error'));
      when(() => mockError.message).thenReturn(null);
      
      final result = await parseHttpError(
        error: mockError,
        defaultErrorMessage: 'caught',
      );
      expect(result, isA<HttpUnknownError>());
      expect(result.msg, 'caught');
    });
  });
}
