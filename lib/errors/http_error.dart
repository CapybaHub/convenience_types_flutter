import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:convenience_types/types/maybe.dart';
import 'package:dio/dio.dart';

import 'app_error.dart';

/// Abstract base for HTTP request errors.
///
/// Carries the HTTP status [code] and an optional typed [response] body
/// (as [Maybe]\<T>). Concrete subclasses map to specific failure modes:
/// [HttpNetworkError], [HttpUnknownError], [HttpBadRequestError] (400),
/// [HttpUnauthorizedError] (401), [HttpForbiddenError] (403),
/// [HttpNotFoundError] (404), [HttpGoneError] (410),
/// [UnprocessableEntityError] (422), [HttpInternalServerError] (500),
/// and [NoInternetConnectionError].
///
/// Use [parseHttpError] to automatically map a [DioException] to the
/// appropriate subclass.
abstract class HttpError<T> extends AppError {
  /// The HTTP status code associated with this error (default `-2` when unknown).
  final int code;

  /// The optional typed response body returned alongside this error.
  final Maybe<T> response;

  const HttpError({
    super.slug,
    super.msg,
    super.stackTrace,
    this.code = -2,
    this.response = const Nothing(),
  });

  @override
  String toString() =>
      '[$runtimeType]: (slug: $slug, msg: $msg, stackTrace: $stackTrace, code: $code, response: $response,)';
}

/// [HttpNetworkError] models errors related to network connection
class HttpNetworkError<T> extends HttpError<T> {
  const HttpNetworkError({
    super.slug,
    super.msg,
    super.stackTrace,
    super.response,
  });
}

/// [HttpUnknownError] models unknown http errors

class HttpUnknownError<T> extends HttpError<T> {
  const HttpUnknownError({
    super.slug,
    super.msg,
    super.stackTrace,
    super.response,
  });
}

/// An HTTP 400 Bad Request error.
class HttpBadRequestError<T> extends HttpError<T> {
  /// Structured validation errors returned by the server.
  final Map<String, dynamic> errors;

  /// Developer-facing message from the server's `msg_dev` field, if present.
  String get msgDev => errors['msg_dev'] ?? '';

  const HttpBadRequestError({
    super.slug,
    super.msg,
    super.stackTrace,
    super.response,
    this.errors = const {},
  }) : super(
          code: 400,
        );
}

/// [HttpUnauthorizedError] models http errors with `status 401`

class HttpUnauthorizedError<T> extends HttpError<T> {
  const HttpUnauthorizedError({
    super.slug,
    super.msg,
    super.stackTrace,
    super.response,
  }) : super(
          code: 401,
        );
}

/// [HttpForbiddenError] models http errors with `status 403`
class HttpForbiddenError<T> extends HttpError<T> {
  const HttpForbiddenError({
    super.slug,
    super.msg,
    super.stackTrace,
    super.response,
  }) : super(
          code: 403,
        );
}

/// [HttpNotFoundError] models http errors with `status 404`

class HttpNotFoundError<T> extends HttpError<T> {
  const HttpNotFoundError({
    super.slug,
    super.msg,
    super.stackTrace,
    super.response,
  }) : super(
          code: 404,
        );
}

/// [HttpGoneError] models http errors with `status 410`
class HttpGoneError<T> extends HttpError<T> {
  const HttpGoneError({
    super.slug,
    super.msg,
    super.stackTrace,
    super.response,
  }) : super(
          code: 410,
        );
}

/// [UnprocessableEntityError] models http errors with `status 422`

class UnprocessableEntityError<T> extends HttpError<T> {
  /// Structured validation errors returned by the server.
  final Map<String, dynamic> errors;

  /// Developer-facing message from the server's `msg_dev` field, if present.
  String get msgDev => errors['msg_dev'] ?? '';

  const UnprocessableEntityError({
    super.slug,
    super.msg,
    super.stackTrace,
    this.errors = const {},
    super.response,
  }) : super(
          code: 422,
        );
}

/// [HttpInternalServerError] models http errors with `status 500`
class HttpInternalServerError<T> extends HttpError<T> {
  const HttpInternalServerError({
    super.slug,
    super.msg,
    super.stackTrace,
    super.response,
  }) : super(
          code: 500,
        );
}

/// [NoInternetConnectionError] models errors related with failure in
/// communication associated with failure of internet connection
class NoInternetConnectionError<T> extends HttpError<T> {
  const NoInternetConnectionError({
    super.slug,
    super.msg,
    super.stackTrace,
    super.response,
  });
}

/// Maps a [DioException] to the most appropriate [HttpError] subclass.
///
/// - [stackTrace] is used for the error's stack trace field.
/// - [slug] defaults to the request path or Dio's error message.
/// - [handleErrorMessage] overrides the default message-extraction logic;
///   when omitted, the server's `msg` JSON field is used if available.
/// - [errorResponseSerializer] deserializes the raw response body into [T];
///   the result is wrapped in a [Maybe] and stored in [HttpError.response].
/// - [defaultErrorMessage] is the fallback human-readable message.
/// - [defaultNoInternetConnectionMessage] overrides [defaultErrorMessage]
///   specifically for connectivity errors; falls back to [defaultErrorMessage]
///   when empty.
///
/// Connection-related errors (timeout, connection error, unknown) are
/// delegated to [parseSocketException], which checks actual connectivity to
/// differentiate between [NoInternetConnectionError] and [HttpNetworkError].
Future<HttpError<T>> parseHttpError<T>({
  required DioException error,
  StackTrace stackTrace = StackTrace.empty,
  String slug = '',
  String Function({required DioException error})? handleErrorMessage,
  T? Function(dynamic)? errorResponseSerializer,
  String defaultErrorMessage =
      "Algo inesperado aconteceu. Tente novamente mais tarde.",
  String defaultNoInternetConnectionMessage = '',
}) async {
  Maybe<T> maybeErrorResponse = Maybe.from(errorResponseSerializer != null
      ? errorResponseSerializer(error.response?.data)
      : null);

  try {
    String msg = defaultErrorMessage;
    defaultNoInternetConnectionMessage =
        defaultNoInternetConnectionMessage.isNotEmpty
            ? defaultNoInternetConnectionMessage
            : defaultErrorMessage;

    slug = slug.isNotEmpty ? slug : error.message ?? error.requestOptions.path;

    String formattedStackTrace =
        (stackTrace.toString().isNotEmpty ? stackTrace : error.stackTrace)
            .toString();

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

    if (error.type == DioExceptionType.badResponse) {
      switch (error.response?.statusCode) {
        case 400:
          return HttpBadRequestError(
            stackTrace: formattedStackTrace,
            slug: slug,
            msg: msg,
            errors: error.response?.data,
            response: maybeErrorResponse,
          );
        case 401:
          return HttpUnauthorizedError(
            stackTrace: formattedStackTrace,
            slug: slug,
            msg: msg,
            response: maybeErrorResponse,
          );
        case 403:
          return HttpForbiddenError(
            stackTrace: formattedStackTrace,
            slug: slug,
            msg: msg,
            response: maybeErrorResponse,
          );
        case 404:
          return HttpNotFoundError(
            stackTrace: formattedStackTrace,
            slug: slug,
            msg: msg,
            response: maybeErrorResponse,
          );
        case 410:
          return HttpGoneError(
            stackTrace: formattedStackTrace,
            slug: slug,
            msg: msg,
            response: maybeErrorResponse,
          );
        case 422:
          return UnprocessableEntityError(
            stackTrace: formattedStackTrace,
            slug: slug,
            msg: msg,
            errors: error.response?.data,
            response: maybeErrorResponse,
          );
        case 500:
          return HttpInternalServerError(
            stackTrace: formattedStackTrace,
            slug: slug,
            msg: msg,
            response: maybeErrorResponse,
          );
        default:
          return HttpUnknownError(
            stackTrace: formattedStackTrace,
            slug: slug,
            msg: msg,
            response: maybeErrorResponse,
          );
      }
    } else if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.unknown ||
        error.type == DioExceptionType.connectionError) {
      return await parseSocketException(
        exception: error,
        slug: slug,
        msg: defaultNoInternetConnectionMessage,
        maybeErrorResponse: maybeErrorResponse,
      );
    } else {
      return HttpUnknownError(
        msg: defaultErrorMessage,
        response: maybeErrorResponse,
      );
    }
  } catch (e) {
    return HttpUnknownError(
      stackTrace: e.toString(),
      slug: slug,
      msg: defaultErrorMessage,
      response: maybeErrorResponse,
    );
  }
}

/// Resolves a connection-level [DioException] to [NoInternetConnectionError]
/// or [HttpNetworkError] depending on actual device connectivity.
///
/// Uses `connectivity_plus` to check whether the device has an active network
/// connection at the time of the error.
Future<HttpError<T>> parseSocketException<T>({
  required String msg,
  required DioException exception,
  String slug = '',
  Maybe<T> maybeErrorResponse = const Nothing(),
}) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if (connectivityResult.contains(ConnectivityResult.none)) {
    return NoInternetConnectionError(
      msg: msg,
      response: maybeErrorResponse,
    );
  } else {
    return HttpNetworkError<T>(
      stackTrace: exception.toString(),
      slug: slug,
      msg: msg,
      response: maybeErrorResponse,
    );
  }
}
