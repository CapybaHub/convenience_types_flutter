// ignore_for_file: constant_identifier_names

const String _GENERIC_ERROR_MSG =
    'Algo inesperado aconteceu. Se o problema persistir, procure o suporte.';

const String _NO_INTERNET_CONNECTION_MSG =
    'Verifique sua conexão com a internet.';

const String _WAIT_CURRENT_REQUEST_MSG = 'Aguarde o final da tarefa.';

/// Default user-facing error message strings (in Brazilian Portuguese).
///
/// These constants are used as fallback [AppError.msg] values throughout the
/// package. You can supply custom messages by passing them directly to the
/// relevant error constructors or to [parseHttpError].
class DefaultErrorMessages {
  /// Generic fallback message shown for unclassified errors.
  static const String unknownError = _GENERIC_ERROR_MSG;

  /// Fallback message for cache-related failures.
  static const String cacheError = _GENERIC_ERROR_MSG;

  /// Fallback message for content-sharing failures.
  static const String shareError = _GENERIC_ERROR_MSG;

  /// Fallback message for storage-related failures.
  static const String storageError = _GENERIC_ERROR_MSG;

  /// Fallback message for device information errors.
  static const String deviceError = _GENERIC_ERROR_MSG;

  /// Message shown when there is no internet connection.
  static const String noInternetConnectionError = _NO_INTERNET_CONNECTION_MSG;

  /// Message shown when a previous request has not yet completed.
  static const String waitCurrentRequest = _WAIT_CURRENT_REQUEST_MSG;
}
