library convenience_types;

import 'package:convenience_types/types/result.dart';

// exporting types
export 'package:convenience_types/types/result.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) {
    Result test = const Success(true);
    return value + 1;
  }
}
