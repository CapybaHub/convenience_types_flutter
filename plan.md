API Interface Analysis & Improvement Plan

  Current State Overview

  The convenience_types package provides:
  - Core types: Result<T>, Maybe<T>, Unit, RequestStatus<T>, FormField<T>, NoParams
  - Domain types: ValueObject<T>, UseCase<T, Params>, SizingInformation
  - Errors: AppError hierarchy with HTTP, cache, form, storage, device-specific errors
  - Utilities: FormUtils mixin, SeedTestStateMixin, identity function

  Strengths

  1. Well-designed functional patterns - Result and Maybe follow established FP patterns with pattern matching
  support
  2. Consistent API - All types use Dart's built-in pattern matching (switch expressions)
  3. Good test coverage - 100% test coverage mentioned in changelog
  4. Practical domain types - RequestStatus is well-suited for Flutter UI state management
  5. Type-safe error handling - Structured error hierarchy with slug/msg separation

  ---
  Improvement Recommendations

  High Priority

  1. Missing value getter on AppError
    - All error classes have msg and slug but no standard value accessor like HttpError.response
    - Suggestion: Add Maybe<T> get value; or similar for consistency
  2. Inconsistent error payload access
    - HttpError has typed response: Maybe<T>, but other errors don't
    - FormError, CacheError, StorageError, DeviceInfoError lack typed payload support
    - Suggestion: Add generic payload support to AppError base class
  3. ValueObject.getOrCrash() throws silently on null
    - The null check in getOrElse for Maybe is good, but getOrCrash doesn't handle null values gracefully
    - Suggestion: Document null handling or add getOrNull() method
  4. RequestStatus missing map methods
    - Lacks mapSucceeded/mapLoading/mapFailed combinators
    - Suggestion: Add mapSucceeded and mapFailed methods for transformation

  Medium Priority

  5. No Tap / Either type for "success with data or error"
    - Some developers prefer Either<Error, Data> over Result<Data> (left for error, right for success)
    - Suggestion: Add Either<Error, Data> as an alternative pattern
  6. Missing fold method on Result
    - Has handle but not the more traditional fold signature
    - Suggestion: Add fold<T>(T Function(AppError) onError, T Function(T) onSuccess) for FP familiarity
  7. No Result.orElse / orElseGet
    - Can't provide fallback Result on failure
    - Suggestion: Add orElse(Result<T> fallback) and orElseGet(Result<T> Function(AppError) factory)
  8. Maybe.orElse missing
    - No way to provide fallback Maybe on Nothing
    - Suggestion: Add orElse(Maybe<T> fallback) and orElseGet(Maybe<T> Function() factory)
  9. No Sequence / Traverse utilities
    - Can't easily convert List<Maybe<T>> to Maybe<List<T>> or List<Result<T>> to Result<List<T>>
    - Suggestion: Add sequence and traverse extension methods

  Low Priority

  10. Missing DebugPrint utility
    - Useful for debugging Result/Maybe chains in Flutter
    - Suggestion: Add debugPrint extension methods
  11. FormUtils only works with non-null types
    - Can't validate FormField<Maybe<T>> cleanly
    - Suggestion: Add support for nested Maybe in form validation
  12. No Try<T> type for wrapping potentially throwing code
    - Common FP pattern for catching exceptions
    - Suggestion: Add Try<T> that captures both success and exception

  ---
  API Changes Matrix

  ┌─────────────────────────────────────────────┬──────────┬────────┬────────┐
  │                   Feature                   │ Breaking │ Impact │ Effort │
  ├─────────────────────────────────────────────┼──────────┼────────┼────────┤
  │ Add mapSucceeded/mapFailed to RequestStatus │ No       │ High   │ Low    │
  ├─────────────────────────────────────────────┼──────────┼────────┼────────┤
  │ Add fold to Result                          │ No       │ Medium │ Low    │
  ├─────────────────────────────────────────────┼──────────┼────────┼────────┤
  │ Add orElse to Result/Maybe                  │ No       │ Medium │ Low    │
  ├─────────────────────────────────────────────┼──────────┼────────┼────────┤
  │ Add generic payload to AppError             │ Yes      │ Medium │ Medium │
  ├─────────────────────────────────────────────┼──────────┼────────┼────────┤
  │ Add Either type                             │ No       │ Medium │ Medium │
  ├─────────────────────────────────────────────┼──────────┼────────┼────────┤
  │ Add sequence/traverse                       │ No       │ Medium │ Medium │
  ├─────────────────────────────────────────────┼──────────┼────────┼────────┤
  │ Add Try<T> type                             │ No       │ Low    │ Medium │
  ├─────────────────────────────────────────────┼──────────┼────────┼────────┤
  │ Add debugPrint extensions                   │ No       │ Low    │ Low    │
  └─────────────────────────────────────────────┴──────────┴────────┴────────┘

  ---
  Recommended Implementation Order

  Phase 1 (Non-breaking, easy):
  1. Add fold to Result
  2. Add orElse/orElseGet to Result and Maybe
  3. Add mapSucceeded/mapFailed to RequestStatus

  Phase 2 (Non-breaking, medium):
  4. Add Either<Error, Data> type
  5. Add sequence/traverse utilities
  6. Add Try<T> type

  Phase 3 (Potentially breaking):
  7. Add generic payload to AppError
  8. Add DebugPrint extensions