/// Exception thrown when an illegal operation occurs during data parsing.
///
/// Typically thrown from a model's `fromJson` factory when deserialization
/// fails. For error-type counterparts, see [ParseError].
///
/// Example:
/// ```dart
/// factory MyModel.fromJson(Map<String, dynamic> json) {
///   final name = json['name'];
///   if (name is! String) throw ParseException('Expected string for "name"');
///   return MyModel(name: name);
/// }
/// ```
class ParseException implements Exception {
  final String exception;

  ParseException(this.exception);

  @override
  String toString() => '''{
      exception: $exception,
  }
  ''';
}

/// Exception thrown when an illegal operation occurs during a caching request.
///
/// For error-type counterparts, see [CacheError].
class CacheException implements Exception {
  final String exception;

  CacheException(this.exception);
  @override
  String toString() => '''{
      exception: $exception,
  }
  ''';
}
