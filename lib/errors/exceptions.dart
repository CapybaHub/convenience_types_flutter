class ParseException implements Exception {
  final String exception;

  ParseException(this.exception);

  @override
  String toString() => '''{
      exception: $exception,
  }
  ''';
}

class CacheException implements Exception {
  final String exception;

  CacheException(this.exception);
  @override
  String toString() => '''{
      exception: $exception,
  }
  ''';
}
