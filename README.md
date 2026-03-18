<p>
  <a href="https://capyba.com">
    <img src="https://uploads-ssl.webflow.com/6012be071bbf1d798713214d/6012c3451d7394bbcef53c61_logo%20capyba.png" />
  </a>
</p>

# Convenience Types

A package of <a href="#">convenience types</a> commonly used in Flutter projects developed by <a href="https://capyba.com">Capyba</a>.

## Motivation

Across our projects we have adopted types that keep code safer, less error-prone and, in the long run, more productive. In order to share those types between the projects we work, and possibly to inspire others to use those types too, we have created this package.

## Table of contents

<ol>
  <li><a href="#getting-started">Getting Started</a></li>
  <li><a href="#types">Types</a>
    <ol>
      <li><a href="#result">Result</a></li>
      <li><a href="#maybe">Maybe</a></li>
      <li><a href="#either">Either</a></li>
      <li><a href="#try">Try</a></li>
      <li><a href="#unit">Unit</a></li>
      <li><a href="#requestStatus">RequestStatus</a></li>
      <li><a href="#formField">FormField</a></li>
      <li><a href="#sizingInformation">SizingInformation</a></li>
      <li><a href="#noParams">NoParams</a></li>
      <li><a href="#valueObject">ValueObject</a></li>
      <li><a href="#usecase">UseCase</a></li>
    </ol>
  </li>
  <li><a href="#apperror">AppError</a></li>
  <li><a href="#valueErrors">ValueErrors</a></li>
  <li><a href="#util">Util</a>
    <ol>
      <li><a href="#formUtils">FormUtils</a></li>
      <li><a href="#seedTestStateMixin">SeedTestStateMixin</a></li>
      <li><a href="#iterableExtensions">Iterable Extensions</a></li>
      <li><a href="#debugPrintExtensions">DebugPrint Extensions</a></li>
    </ol>
  </li>
</ol>

## Getting started

To install and have the package good to go in a Flutter project, run:

`flutter pub add convenience_types`

If you're on a Dart project, run:

`dart pub add convenience_types`

## Types

### Result

A type-safe way to model operations that can succeed or fail. `Result<ResultType>` is a union type with two variants:

- **Success&lt;ResultType&gt;** — carries a value of type `ResultType`
- **Failure** — carries an `AppError` describing what went wrong

Using `Result` instead of throwing or nullable return values makes both outcomes explicit and encourages handling them via `handle`, pattern matching, or the `mapSuccess` / `mapFailure` methods.

**Handle both outcomes:**

```dart
Result<String> result = await fetchUserName();
final message = result.handle(
  onSuccess: (name) => 'Hello, $name',
  onFailure: (error) => 'Error: ${error.message}',
);
```

**Pattern matching:**

```dart
switch (result) {
  Success(:final data) => print(data),
  Failure(:final error) => showError(error),
}
```

**Chaining:** `mapSuccess` and `mapAsyncSuccess` transform the value when `Success` and pass through `Failure`. `mapFailure` and `mapAsyncFailure` transform the error when `Failure`; when `Success`, they return this `Result` unchanged.

**Conversion:** The `maybeData` getter converts to `Maybe`: `Success` → `Just(data)`, `Failure` → `Nothing`.

**Note:** `asSuccess` and `asFailure` are casting helpers; they throw if the variant is wrong. Prefer `handle` or pattern matching instead.

### Maybe

A type-safe, declarative way to model optional values. `Maybe<T>` is a union type with two variants:

- **Nothing** — no value (type-safe alternative to null)
- **Just&lt;T&gt;** — a value of type `T`

Using `Maybe` instead of nullable types (`T?`) makes the presence or absence of a value explicit and encourages handling both cases via pattern matching or methods like `mapJust`, `mapNothing`, and `getOrElse`.

**Pattern matching:**

```dart
Maybe<String> name = Just("test");
final display = switch (name) {
  Nothing() => "",
  Just(:final value) => value,
};
```

**From nullable input:**

```dart
Maybe.from(null);   // Nothing()
Maybe.from("hi");   // Just("hi")
```

**From Result:**

```dart
Maybe.fromResult(someResult);  // Just(data) or Nothing()
```

**Chaining:** `mapJust` / `mapAsyncJust` transform the value when `Just` and preserve `Nothing`. `mapNothing` / `mapAsyncNothing` run a callback when `Nothing` and return this `Maybe` unchanged when `Just`. Use `getOrElse(fallback)` to get the value or a fallback when `Nothing` (or when the inner value is null).

**Combining two Maybes:** On a record `(Maybe<K>, Maybe<J>)`, call `maybeCombine` (or `maybeAsyncCombine`) with optional callbacks for `firstJust`, `secondJust`, `bothJust`, and `bothNothing`; omitted callbacks yield `Nothing`.

```dart
final combined = (maybeName, maybeCount).maybeCombine<String>(
  bothJust: (name, count) => Just('$name: $count'),
  firstJust: (name) => Just(name),
  secondJust: (count) => Just(count.toString()),
  bothNothing: () => Just('unknown'),
);
```

### Either

A type that represents a value of one of two possible types (a disjoint union). `Either<L, R>` is commonly used when an operation can return two distinct types of data. By convention, `Left` is used for failure and `Right` is used for success.

**Pattern matching:**

```dart
Either<String, int> checkAge(int age) => age >= 18 ? Right(age) : Left('Too young');

final message = switch (checkAge(20)) {
  Left(:final value) => 'Error: $value',
  Right(:final value) => 'Success: $value',
};
```

**Chaining & Folding:**
Use `mapRight` and `mapLeft` to transform the respective sides without changing the other. Use `fold` to collapse both possibilities into a single return value.

### Try

A computation wrapper `Try<T>` similar to `Result`, but its semantics are specifically geared towards executing lambdas that might throw synchronous exceptions.

**Guard:**

```dart
final tryData = Try.guard(() => jsonDecode(malformedJson));
final value = tryData.getOrElse((e, s) => 'Fallback string');
```

**Pattern matching:**

```dart
switch (tryData) {
  TrySuccess(:final value) => print('Ok: $value'),
  TryFailure(:final exception, :final stackTrace) => print('Error: $exception'),
}
```

### Unit

A type that represents the absence of a meaningful value. `Unit` has exactly one value, `Unit()`, and carries no data. Use it when you need a type-safe way to express "no value" or "success with nothing to return", for example:

- **Result&lt;Unit&gt;** for operations that succeed but return nothing (e.g. delete, logout)
- Callbacks or generic code that require a concrete type instead of `void`

```dart
Future<Result<Unit>> deleteItem(String id) async {
  await api.delete(id);
  return Result.success(Unit());
}
```

The package also provides an **identity function** `identity<T>(T value) => value` for use in generic code or as a no-op transformation (e.g. `list.map(identity)`).

### RequestStatus

A type-safe way to model the lifecycle of an asynchronous request in the UI. `RequestStatus<ResultType>` is a union type with four states:

- **Idle** — the request has not been fired yet
- **Loading** — the request is in flight
- **Succeeded&lt;ResultType&gt;** — carries a `data` field of type `ResultType`
- **Failed** — carries an `AppError` in its `error` field

Use `RequestStatus.fromResult(result)` to build a status directly from a `Result`.

**Handle all states with pattern matching (`switch` expression):**

```dart
Widget build(BuildContext context) {
  return switch (requestStatus) {
    Idle() => const SizedBox.shrink(),
    Loading() => const CircularProgressIndicator(),
    Succeeded(:final data) => Text(data.toString()),
    Failed(:final error) => Text(error.msg),
  };
}
```

**Handle only some states using a wildcard `_`:**

```dart
Widget build(BuildContext context) {
  return switch (requestStatus) {
    Loading() => const CircularProgressIndicator(),
    Succeeded(:final data) => Text(data.toString()),
    _ => const SizedBox.shrink(), // catches Idle and Failed
  };
}
```

**Extras:** `maybeData` returns `Just(data)` when `Succeeded`, `Nothing` otherwise. Bool convenience getters: `isIdle`, `isLoading`, `isSucceeded`, `isFailed`. Unsafe casting helpers `asIdle`, `asLoading`, `asSucceeded`, `asFailed` throw if the variant is wrong — prefer pattern matching instead.

### FormField

When providing data to a form and then passing it forward, for instance,
in a request body, one problem that is common here is the need of dealing
with the cases where the field is not filled, and then one might need to
treat every possible resulting Map (json) separately, either passing the not
filled field with no value or not passing it at all. <br>

The generic sealed data class

```dart
FormField<Type>
```

is a convenience type that models, as the name already points,
a field in a Form, and uses the convention of not passing not filled fields to the resulting `Map`.
But here we are already passing the [name] of the field in its possible `Map`
(json) position, and the actual [field] data is a `Maybe<Type>`.
<br>
`FormField`s are usually used in a `Form` defined class, and with the usage of
our convenience mixin `FormUtils`, one should have everything it needs to have
form validation, and `toJson` method. It might introduce some verbose api, to
deal with, but the convenience of dealing with the most critical parts, like
validating and passing the `Form` information through, makes the usage of our
`FormField`s worthwhile.
<br>
Example (using `freezed` to create the `Form` class):

```dart
 @freezed
 abstract class FormExampleWithFreezed with _$FormExampleWithFreezed, FormUtils {
   const FormExampleWithFreezed._();
   const factory FormExampleWithFreezed({
     @Default(FormField(name: 'firstFieldJsonName'))
         FormField<String> firstField,
     @Default(FormField(name: 'secondFieldJsonName'))
         FormField<String> secondField,
   }) = _FormExampleWithFreezed;

   Result<String> get firstFieldValidation => validateField(
         field: firstField.field,
         validators: <String? Function(String)>[
           // list of validators to first field
         ],
       );

   Result<String> get secondFieldValidation => validateField(
         field: secondField.field,
         validators: <String? Function(String)>[
           // list of validators to second field
         ],
       );

   Map<String, dynamic> toJson() => fieldsToJson([
         firstField,
         secondField,
       ]);
 }

```

Just to point out that the usage of a freezed class is not required to enjoy the advantages
of the `FormField` type, we present another example(not using
`freezed`):

```dart
class FormExample with FormUtils {
  final FormField<String> firstField;
  final FormField<String> secondField;

  const FormExample({
    required this.firstField,
    required this.secondField,
  });

  Result<String> get firstFieldValidation => validateField(
        field: firstField.field,
        validators: <String? Function(String)>[
          // list of validators to first field
        ],
      );

  Result<String> get secondFieldValidation => validateField(
        field: secondField.field,
        validators: <String? Function(String)>[
          // list of validators to second field
        ],
      );

  Map<String, dynamic> toJson() => fieldsToJson([
        firstField,
        secondField,
      ]);
}
```

Using a `Form` class as presented, one has a safe way to pass the values of
the field to a request body with ease.<br>
Example:

```dart
  request.body = formExampleInstance.toJson(),
```

### SizingInformation

Holds responsive layout information: **ScreenType** (Small / Medium / Large) and **Size**. Use with `LayoutBuilder` or `MediaQuery` to adapt UI to screen size. **ScreenType.fromWidth(double)** returns `Small` for width ≤ 670, `Large` for width &gt; 1500, and `Medium` otherwise.

### NoParams

A type representing "no parameters" for use cases or callbacks that take no arguments. Use as the parameter type for **UseCase** when the operation needs no input (e.g. `UseCase<T, NoParams>`).

### ValueObject

Base type for domain value objects whose validity is represented by **Result**&lt;T&gt;. Subclasses expose **value** (a `Result`); **isValid** is true when `value` is Success. Use **getOrCrash** to obtain the value or throw **UnexpectedValueError** on failure. **failureOrUnit** converts `value` to `Result<Unit>` (Success → Unit, Failure → same Failure).

### UseCase

Base type for a use case: a single async operation that takes **Params** and returns **Result**&lt;T&gt;. Implement **call(Params params)** returning `Future<Result<T>>`. Use **NoParams** for use cases that take no input.

## AppError

Abstract base class for all application errors.

Provides a common interface for typed, structured error handling. All errors
carry a `slug` (machine-readable identifier), a `msg` (human-readable
message), an optional `stackTrace`, and an optional `payload`.

**Payloads:**
The `payload` field (`Object?`) standardizes the handling of custom error data across all subclasses. For example, `HttpError` maps its network `response` directly to this `payload` internally, enabling consistent access to extra error data across the app.

Preset concrete subclasses cover the most common error domains:
- `HttpError` — HTTP request failures (network, status codes, etc.)
- `CacheError` — Local cache read/write failures
- `DeviceInfoError` — Device information retrieval failures
- `FormError` — Form validation and submission failures
- `StorageError` — Device storage access failures

General-purpose subclasses are also provided:
- `AppUnknownError` — Unexpected or unclassified errors
- `ParseError` — Data parsing or deserialization failures
- `EntityNotFitError` — Domain rule or constraint violations
- `FailedToShareError` — Content-sharing failures
- `TokenNotFoundError` — Authentication token not found

In addition to the [AppError], there are a preset of foreseen [Exceptions].

## ValueErrors

**[ValueError]** extends [AppError] for value validation failures. **[UnexpectedValueError]**&lt;T&gt; is thrown when a **ValueObject** is read via **getOrCrash** and its Result is Failure; it holds the failing Result and optional msg/slug/stackTrace. Preset value errors include: **InvalidEmail**, **InvalidPassword**, **InvalidUserName**, **InvalidName**, **InvalidOTP**, **DescriptionTooShort**, **DescriptionTooLong**, **InsufficientDetail**, **InvalidCharacters**.

## Util

### FormUtils

Class used as a Dart `Mixin` on a `Form` class, providing methods to conveniently
deal with validation and serialization of fields.

```dart
  Result<String> validateField<Type>
```

Method to help validate a [FormField<Type>] providing its value represented by its `Maybe<Type>`, and
a `List<Validator<Type>>`, returning a `Result<String>` with possible error message.

```dart
  Map<String, dynamic> fieldsToJson(List<FormField> fields)
```

Method to help in the task of passing the provided `List<FormField>` to its `Map<String, dynamic>` representation,
that is useful when it comes to pass the `Form` data through, for instance, a request body

### SeedTestStateMixin

`Mixin` to `StateNotifier` to help seeding test states.

`Example:`

```dart
class MyStateNotifier extends StateNotifier<MyState> with SeedTestStateMixin<MyState> {}
```

and in a test:

```dart
test(
        'Test description',
        () {
          myStateNotifier.setSeedState(
            mySeedState
          );

          /// test body
          /// test body
        },
      );
```

### Iterable Extensions

Provides `.sequence()` and `.traverseMaybe()` / `.traverseResult()` on Iterables to cleanly invert the relationship between a List and a Monad.

```dart
final list = [Just(1), Just(2)];
final Maybe<List<int>> sequenced = list.sequence(); // Just([1, 2])

final mixed = [Success(1), Failure(AppUnknownError())];
final Result<List<int>> sequencedResult = mixed.sequence(); // Yields the first Failure

**Filtering:**
Use `.values` / `.nothings` on `Iterable<Maybe<T>>` and `.successes` / `.failures` on `Iterable<Result<T>>` to extract only the desired variants:

```dart
final maybes = [Just(1), Nothing(), Just(3)];
final values = maybes.values; // [1, 3]

final results = [Success(10), Failure(err), Success(30)];
final successes = results.successes; // [10, 30]
final errors = results.failures; // [err]
```

### DebugPrint Extensions

The `.debugPrint([prefix])` extension on `Result`, `Maybe`, and `RequestStatus` makes it incredibly easy to output current states to the console without breaking fluent chains:

```dart
Result.success(42).debugPrint('My Operation'); // stdout: "My Operation Result: Success(42)"
```
