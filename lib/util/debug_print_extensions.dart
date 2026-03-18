import 'package:flutter/foundation.dart' as foundation;
import 'package:convenience_types/types/result.dart';
import 'package:convenience_types/types/maybe.dart';
import 'package:convenience_types/types/request_status.dart';

extension ResultDebugX<T> on Result<T> {
  /// Prints the Result state and its inner value or error to the console.
  Result<T> debugPrint([String prefix = '']) {
    final msg = handle(
      onSuccess: (data) => 'Success($data)',
      onFailure: (error) => 'Failure($error)',
    );
    final pfx = prefix.isNotEmpty ? '$prefix ' : '';
    foundation.debugPrint('${pfx}Result: $msg');
    return this;
  }
}

extension MaybeDebugX<T> on Maybe<T> {
  /// Prints the Maybe state and its inner value to the console.
  Maybe<T> debugPrint([String prefix = '']) {
    final String msg = switch (this) {
      Just<T>(:final value) => 'Just($value)',
      Nothing<T>() => 'Nothing',
    };
    final pfx = prefix.isNotEmpty ? '$prefix ' : '';
    foundation.debugPrint('${pfx}Maybe: $msg');
    return this;
  }
}

extension RequestStatusDebugX<T> on RequestStatus<T> {
  /// Prints the RequestStatus state and its inner value to the console.
  RequestStatus<T> debugPrint([String prefix = '']) {
    final String msg = switch (this) {
      Idle() => 'Idle()',
      Loading() => 'Loading()',
      Succeeded(:final data) => 'Succeeded($data)',
      Failed(:final error) => 'Failed($error)',
    };
    final pfx = prefix.isNotEmpty ? '$prefix ' : '';
    foundation.debugPrint('${pfx}RequestStatus: $msg');
    return this;
  }
}
