// ignore_for_file: constant_identifier_names

const String _GENERIC_ERROR_MSG =
    'Algo inesperado aconteceu. Se o problema persistir, procure o suporte.';

const String _NO_INTERNET_CONNECTION_MSG =
    'Verifique sua conexão com a internet.';

const String _WAIT_CURRENT_REQUEST_MSG = 'Aguarde o final da tarefa.';

class DefaultErrorMessages {
  static const String unknownError = _GENERIC_ERROR_MSG;
  static const String cacheError = _GENERIC_ERROR_MSG;
  static const String shareError = _GENERIC_ERROR_MSG;
  static const String storageError = _GENERIC_ERROR_MSG;
  static const String deviceError = _GENERIC_ERROR_MSG;
  static const String noInternetConnectionError = _NO_INTERNET_CONNECTION_MSG;
  static const String waitCurrentRequest = _WAIT_CURRENT_REQUEST_MSG;
}
