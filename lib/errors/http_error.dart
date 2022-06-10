import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import 'app_error.dart';

abstract class HttpError extends AppError {
  final int code;

  HttpError({
    super.slug,
    super.msg,
    super.stackTrace,
    this.code = -2,
  });

  @override
  String toString() =>
      '[$runtimeType]: (slug: $slug, msg: $msg, stackTrace: $stackTrace, code: $code)';
}

class HttpNetworkError extends HttpError {
  HttpNetworkError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}

class HttpUnknownError extends HttpError {
  HttpUnknownError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}

class HttpBadRequestError extends HttpError {
  final Map<String, dynamic> errors;

  @override
  String get msg => errors['msg'] ?? '';

  String get msgDev => errors['msg_dev'] ?? '';

  HttpBadRequestError({
    super.slug,
    super.msg,
    super.stackTrace,
    this.errors = const {},
  }) : super(
          code: 400,
        );
}

class HttpUnauthorizedError extends HttpError {
  HttpUnauthorizedError({
    super.slug,
    super.msg,
    super.stackTrace,
  }) : super(
          code: 401,
        );
}

class HttpForbiddenError extends HttpError {
  HttpForbiddenError({
    super.slug,
    super.msg,
    super.stackTrace,
  }) : super(
          code: 403,
        );
}

class HttpNotFoundError extends HttpError {
  HttpNotFoundError({
    super.slug,
    super.msg,
    super.stackTrace,
  }) : super(
          code: 404,
        );
}

class HttpGoneError extends HttpError {
  HttpGoneError({
    super.slug,
    super.msg,
    super.stackTrace,
  }) : super(
          code: 410,
        );
}

class UnprocessableEntityError extends HttpError {
  final Map<String, dynamic> errors;

  @override
  String get msg => errors['msg'] ?? '';

  String get msgDev => errors['msg_dev'] ?? '';

  UnprocessableEntityError({
    super.slug,
    super.msg,
    super.stackTrace,
    this.errors = const {},
  }) : super(
          code: 422,
        );
}

class HttpInternalServerError extends HttpError {
  HttpInternalServerError({
    super.slug,
    super.msg,
    super.stackTrace,
  }) : super(
          code: 500,
        );
}

class NoInternetConnectionError extends HttpError {
  NoInternetConnectionError({
    super.slug,
    super.msg,
    super.stackTrace,
  });
}

Future<HttpError> parseHttpError(DioError error, StackTrace stackTrace) async {
  try {
    late String msg;

    if (error.response != null &&
        error.response?.headers.value('Content-Type') == 'application/json' &&
        (error.response?.data as Map).containsKey('msg')) {
      msg = error.response?.data["msg"];
    } else {
      msg = "Algo inesperado aconteceu. Tente novamente mais tarde.";
    }

    if (error.type == DioErrorType.response) {
      switch (error.response?.statusCode) {
        case 400:
          return HttpBadRequestError(
            slug: msg,
            msg: msg,
            errors: error.response?.data,
          );
        case 401:
          return HttpUnauthorizedError(
            slug: msg,
            msg: msg,
          );
        case 403:
          return HttpForbiddenError(
            slug: msg,
            msg: msg,
          );
        case 404:
          return HttpNotFoundError(
            slug: msg,
            msg: msg,
          );
        case 410:
          return HttpGoneError(
            slug: msg,
            msg: msg,
          );
        case 422:
          return UnprocessableEntityError(
            slug: msg,
            msg: msg,
            errors: error.response?.data,
          );
        case 500:
          return HttpInternalServerError(
            slug: error.message,
          );
        default:
          return HttpUnknownError();
      }
    } else if (error.type == DioErrorType.connectTimeout ||
        error.type == DioErrorType.receiveTimeout ||
        error.type == DioErrorType.sendTimeout ||
        error.type == DioErrorType.other) {
      return await parseSocketException(error);
    } else {
      return HttpUnknownError();
    }
  } catch (e) {
    return HttpUnknownError(slug: e.toString());
  }
}

Future<HttpError> parseSocketException(exception) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if (connectivityResult == ConnectivityResult.none) {
    return NoInternetConnectionError();
  } else {
    return HttpNetworkError(
      slug: exception.toString(),
    );
  }
}
