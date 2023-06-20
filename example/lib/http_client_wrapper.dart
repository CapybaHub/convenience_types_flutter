import 'package:convenience_types/errors/http_error.dart';
import 'package:convenience_types/types/result.dart';
import 'package:dio/dio.dart';

class HttpClientWrapper {
  const HttpClientWrapper(Dio httpClient) : _httpClient = httpClient;

  final Dio _httpClient;

  _handleErrors(
      HttpError error, DioException exception, StackTrace stackTrace) async {
    // Deal with errors as you like
  }

  Future<Result> delete({
    required String url,
    Map<String, dynamic> body = const {},
  }) async {
    try {
      final Response response = await _httpClient.delete(
        url,
        data: body,
      );
      return Success(response.data);
    } on DioException catch (exception, stackTrace) {
      final HttpError error = await parseHttpError(
        error: exception,
        stackTrace: stackTrace,
      );
      await _handleErrors(error, exception, stackTrace);

      return Failure(error);
    } catch (exception) {
      return Failure(
        HttpUnknownError(
          slug: exception.toString(),
        ),
      );
    }
  }

  Future<Result> get({
    required String url,
    Map<String, dynamic> queryParams = const {},
  }) async {
    try {
      final Response response = await _httpClient.get(
        url,
        queryParameters: queryParams,
      );

      return Success(response.data);
    } on DioException catch (exception, stackTrace) {
      final HttpError error = await parseHttpError(
        error: exception,
        stackTrace: stackTrace,
      );

      await _handleErrors(error, exception, stackTrace);

      return Failure(error);
    } catch (e) {
      return const Failure(
        HttpUnknownError(),
      );
    }
  }

  Future<Result> patch({
    required String url,
    Map<String, dynamic> body = const {},
  }) async {
    try {
      final Response response = await _httpClient.patch(
        url,
        data: body,
      );
      return Success(response.data);
    } on DioException catch (exception, stackTrace) {
      final HttpError error = await parseHttpError(
        error: exception,
        stackTrace: stackTrace,
      );
      await _handleErrors(error, exception, stackTrace);

      return Failure(error);
    } catch (exception) {
      return Failure(
        HttpUnknownError(
          slug: exception.toString(),
        ),
      );
    }
  }

  Future<Result> post({
    required String url,
    Map<String, dynamic> body = const {},
  }) async {
    try {
      final Response response = await _httpClient.post(
        url,
        data: body,
      );
      return Success(response.data);
    } on DioException catch (exception, stackTrace) {
      final HttpError error = await parseHttpError(
        error: exception,
        stackTrace: stackTrace,
      );
      await _handleErrors(error, exception, stackTrace);

      return Failure(error);
    } catch (exception) {
      return Failure(
        HttpUnknownError(
          slug: exception.toString(),
        ),
      );
    }
  }

  Future<Result> put({
    required String url,
    Map<String, dynamic> body = const {},
  }) async {
    try {
      final Response response = await _httpClient.put(
        url,
        data: body,
      );
      return Success(response.data);
    } on DioException catch (exception, stackTrace) {
      final HttpError error = await parseHttpError(
        error: exception,
        stackTrace: stackTrace,
      );
      await _handleErrors(error, exception, stackTrace);

      return Failure(error);
    } catch (exception) {
      return Failure(
        HttpUnknownError(
          slug: exception.toString(),
        ),
      );
    }
  }
}
