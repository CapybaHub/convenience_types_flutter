/// [ParseException] models the exception to be thrown in case of an illegal
/// operation happens during the process of parsing data,
/// `Example: SomeModel.fromJson throw ParseException`
class ParseException implements Exception {
  final String exception;

  ParseException(this.exception);

  @override
  String toString() => '''{
      exception: $exception,
  }
  ''';
}

/// [CacheException] models the exception to be thrown in case an illegal
/// operation happens during caching request

class CacheException implements Exception {
  final String exception;

  CacheException(this.exception);
  @override
  String toString() => '''{
      exception: $exception,
  }
  ''';
}
