import 'package:flutter/foundation.dart';
import 'package:state_notifier/state_notifier.dart';

/// mixin on [StateNotifier] to help seeding test states.
/// `Example:`
///
/// ```dart
/// class MyStateNotifier extends StateNotifier<MyState> with SeedTestStateMixin<MyState> {}
/// ```
///
/// and in a test:
///
/// ```dart
/// test(
///         'Test description',
///         () {
///           myStateNotifier.setSeedState(
///             mySeedState
///           );
///
///           /// test body
///         },
///       );
/// ```
mixin SeedTestStateMixin<T> on StateNotifier<T> {
  @visibleForTesting
  void setSeedState(T seedState) {
    state = seedState;
  }
}
