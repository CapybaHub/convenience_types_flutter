import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import 'app_error.dart';

/// Abstract class to model errors on the application. As a presset of foreseen
/// specific errors there are some different implementations of this type.
/// [HttpError] models errors related to http requests
abstract class HttpError extends AppError {
  final int code;

  const HttpError({
    super.slug,
    super.msg,
    super.stackTrace,
    this.code = -2,
  });

  @override
  String toString() =>
      '[$runtimeType]: (slug: $slug, msg: $msg, stackTrace: $stackTrace, code: $code)';
}

/// [HttpNetworkError] models errors related to network connection
class HttpNetworkError extends HttpError {
  const HttpNetworkError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}

/// [HttpUnknownError] models unknown http errors

class HttpUnknownError extends HttpError {
  const HttpUnknownError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}

/// [HttpNetworkError] models http errors with `status 400`
class HttpBadRequestError extends HttpError {
  final Map<String, dynamic> errors;

  String get msgDev => errors['msg_dev'] ?? '';

  const HttpBadRequestError({
    super.slug,
    super.msg,
    super.stackTrace,
    this.errors = const {},
  }) : super(
          code: 400,
        );
}

/// [HttpUnauthorizedError] models http errors with `status 401`

class HttpUnauthorizedError extends HttpError {
  const HttpUnauthorizedError({
    super.slug,
    super.msg,
    super.stackTrace,
  }) : super(
          code: 401,
        );
}

/// [HttpForbiddenError] models http errors with `status 403`
class HttpForbiddenError extends HttpError {
  const HttpForbiddenError({
    super.slug,
    super.msg,
    super.stackTrace,
  }) : super(
          code: 403,
        );
}

/// [HttpNotFoundError] models http errors with `status 404`

class HttpNotFoundError extends HttpError {
  const HttpNotFoundError({
    super.slug,
    super.msg,
    super.stackTrace,
  }) : super(
          code: 404,
        );
}

/// [HttpGoneError] models http errors with `status 410`
class HttpGoneError extends HttpError {
  const HttpGoneError({
    super.slug,
    super.msg,
    super.stackTrace,
  }) : super(
          code: 410,
        );
}

/// [UnprocessableEntityError] models http errors with `status 422`

class UnprocessableEntityError extends HttpError {
  final Map<String, dynamic> errors;

  String get msgDev => errors['msg_dev'] ?? '';

  const UnprocessableEntityError({
    super.slug,
    super.msg,
    super.stackTrace,
    this.errors = const {},
  }) : super(
          code: 422,
        );
}

/// [HttpInternalServerError] models http errors with `status 500`
class HttpInternalServerError extends HttpError {
  const HttpInternalServerError({
    super.slug,
    super.msg,
    super.stackTrace,
  }) : super(
          code: 500,
        );
}

/// [NoInternetConnectionError] models errors related with failure in
/// communication associated with failure of internet connection
class NoInternetConnectionError extends HttpError {
  const NoInternetConnectionError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}

Future<HttpError> parseHttpError({
  required DioError error,
  required StackTrace stackTrace,
  String Function({required DioError error})? handleErrorMessage,
  String defaultErrorMessage =
      "Algo inesperado aconteceu. Tente novamente mais tarde.",
}) async {
  try {
    String msg = defaultErrorMessage;

    if (handleErrorMessage != null) {
      msg = handleErrorMessage(error: error);
    } else {
      if (error.response != null &&
          error.response?.headers.value('Content-Type') == 'application/json' &&
          (error.response?.data is Map) &&
          error.response?.data.containsKey('msg')) {
        msg = error.response?.data["msg"];
      }
    }

    if (error.type == DioErrorType.badResponse) {
      switch (error.response?.statusCode) {
        case 400:
          return HttpBadRequestError(
            slug: stackTrace.toString(),
            msg: msg,
            errors: error.response?.data,
          );
        case 401:
          return HttpUnauthorizedError(
            slug: stackTrace.toString(),
            msg: msg,
          );
        case 403:
          return HttpForbiddenError(
            slug: stackTrace.toString(),
            msg: msg,
          );
        case 404:
          return HttpNotFoundError(
            slug: stackTrace.toString(),
            msg: msg,
          );
        case 410:
          return HttpGoneError(
            slug: stackTrace.toString(),
            msg: msg,
          );
        case 422:
          return UnprocessableEntityError(
            slug: stackTrace.toString(),
            msg: msg,
            errors: error.response?.data,
          );
        case 500:
          return HttpInternalServerError(
            slug: stackTrace.toString(),
            msg: msg,
          );
        default:
          return HttpUnknownError(
            slug: stackTrace.toString(),
            msg: msg,
          );
      }
    } else if (error.type == DioErrorType.connectionTimeout ||
        error.type == DioErrorType.receiveTimeout ||
        error.type == DioErrorType.sendTimeout ||
        error.type == DioErrorType.unknown) {
      return await parseSocketException(error);
    } else {
      return const HttpUnknownError();
    }
  } catch (e) {
    return HttpUnknownError(slug: e.toString());
  }
}

Future<HttpError> parseSocketException(exception) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if (connectivityResult == ConnectivityResult.none) {
    return const NoInternetConnectionError();
  } else {
    return HttpNetworkError(
      slug: exception.toString(),
    );
  }
}
