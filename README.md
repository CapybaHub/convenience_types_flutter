<p>
  <a href="https://capyba.com">
    <img src="https://uploads-ssl.webflow.com/6012be071bbf1d798713214d/6012c3451d7394bbcef53c61_logo%20capyba.png" />
  </a>
</p>

# Convenience Types

A package to ensamble <a href="#">convenience types</a> commonly used through flutter projects developed by <a href="https://capyba.com">Capyba</a>.

## Motivation

Along our development cycle of numerous projects we have adopted the usage of some types that helped us to keep things safer, more error prone and, in the long run, more productive. In order to share those types between the projects we work, and possibly to inspire others to use those types too, we have created this package.

## Table of contents

<ol>
  <li><a href="#getting-started">Getting Started</a></li>
  <li><a href="#types">Types</a>
    <ol>
      <li><a href="#result">Result</a></li>
      <li><a href="#maybe">Maybe</a></li>
      <li><a href="#requestStatus">RequestStatus</a></li>
      <li><a href="#formField">FormField</a></li>
    </ol>
  </li>
  <li><a href="#ppError">AppError</a></li>
  <li><a href="#util">Util</a>
    <ol>
      <li><a href="#formUtils">FormUtils</a></li>
      <li><a href="#seedTestStateMixin">SeedTestStateMixin</a></li>
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

Every asynchronus task can have two possible outcomes as a `Result`.
It is either a `Success` or a `Failure`.<br>
So the

```dart
Result<ResultType>
```

generic union type is a convenience type to model
and help safelly deal with any asynchronus task outcomes.

The approach is declarative, so in order to deal with the result, one
should call the `handle` method which has two required parameters
an `onSuccess` callback

```dart
Type onSuccess(Type data)
```

and an `onFailure` callback

```dart
Type onFailure(AppError data)
```

Where AppError is a convenience type to model errors in the application

Example:

```dart
Result<String> asyncTaskResturningStringResult = await someFutureOfResultString();

asyncTaskResturningStringResult.handle(
  onSuccess: (String data) {
    "here one have access to the succesful value of the async task and might use it as desired"
  },
  onFailure: (AppError error) {
    "here one have access to the failure modeled as AppError representing this async task"
  }
);
```

In this way one always needs to deal in a declarative way with both the
success and failure possible outcomes as unfortunatelly any asynchronus
task needs.

`anti-patern alert!`: The `Result` generic Union type comes with casts convenience methods `asSuccess`, `asFailure`, but although it might be temping to just cast the result into the desired type, it is strongly advised you not to do it, once if you try to cast diferent types (`Success` as `Failure` or the other way around) it would throw an exception.<br>

```dart
Result<K> mapSuccess<K>(
    Result<K> Function(ResultType) combiner,
  );
```

A method used to chain access to data held by the [Result]. If `this` is [Failure] returns [Failure], if `this` is [Success], returns the result of the `combiner` method over the `data` inside [Success] <br>

Example:

```dart
Result<String> asyncTaskResturningStringResult = await someFutureOfResultString();

Result<double> parseResult = asyncTaskResturningStringResult.mapSuccess((String data) => methodThatTakesStringDataAndTriesToParseDouble(data));
```

```dart
FutureOr<Result<K>> mapAsyncSuccess<K>(
    FutureOr<Result<K>> Function(ResultType) combiner,
);
```

A method to chain asynchronous access to data held by the [Result]. If `this` is [Failure] returns `[FutureOr<Failure>]`, if `this` is [Success], returns the result of the `combiner` method over the `data` inside [Success] <br>

Example:

```dart
Result<String> asyncTaskResturningStringResult = await someFutureOfResultString();

Result<double> parseResult = await asyncTaskResturningStringResult.mapAsyncSuccess((String data) => methodThatTakesStringDataAndAsynchronouslyTriesToParseDouble(data));
```

```dart
Maybe<ResultType> get maybeData;
```

Getter that results in a [Just] if the [Result] is [Success] and [Nothing] othterwise <br>

### Maybe

Dealing with optional values ​​in ui has always been verbose and unsafe.
So the

```dart
Maybe<T>
```

generic union type is a convenience type to model
and help safelly deal with any optional value outcomes.

Where we can have two types that will represent the state of a value that can be null. The [Nothing], representing when it has no value, and the [Just], when it has a value.

The approach is declarative, so in order to deal with the states of [Maybe], one
should use one of the unions methods.

The `.map` forces you to deal with all the two states explicitly, passing callbacks for
each state with undestructured states.
Example:

```dart
    Maybe<String> someMaybeValue = Just("test");

    final debugValue = someMaybeValue.map(
        nothing: (_) => "",
        just: (data) => data.value,
    );

    print(debugValue); // test
```

The `.when` forces you to deal with all the two states explicitly, passing callbacks for
each state with destructured states

Example:

```dart
    Maybe<String> someMaybeValue = Nothing();

    final debugValue = someMaybeValue.map(
        nothing: () => "test",
        just: (data) => data,
    );

    print(debugValue); // test
```

and one also might want to not deal explicitly with all states diferently, so
there are the `.maybeMap`, and `.maybeWhen` methods where you need only expclitly to pass a
`orElse` callback. But I would say that it is not so useful in this case since we only have two states to be treated.

Example:

```dart
    Maybe<String> someMaybeValue = Just("test");

    final debugValue = someMaybeValue.maybeWhen(
        just: (data) => data,
        orElse() => "",
    );

    print(debugValue); // test
```

So, `Maybe` provides a safe and declarative way to always deal with the two possible states of a optional value.

```dart
factory Maybe.from(T? input);
```

Factory for helping building a [Maybe] from a nullable input. It produces a [Nothing] if the input is null, and a [Just] otherwise

```dart
Type getOrElse<Type>(Type fallback);
```

The [getOrElse] method which receives a parameter to return as a
fallback value, when the value is a [Nothing], or there is no value in the [Just] <br>

```dart
 Maybe<K> mapJust<K>(Maybe<K> Function(T) combiner);
```

A method to chain access to data held by the [Maybe]. If `this` is [Nothing] returns [Nothing], if `this` is [Just], returns the result of the `combiner` method over the `value` inside [Just] <br>

```dart
FutureOr<Maybe<K>> mapAsyncJust<K>(FutureOr<Maybe<K>> Function(T) combiner);
```

A Method to chain async access to data held by the [Maybe]. If `this` is [Nothing] returns [Nothing], if `this` is [Just], returns the result of the `combiner` method over the `value` inside [Just]<br>

```dart
Maybe<T> maybeCombine<T>({
    /// Used to map case where only the first value is [Just]
    Maybe<T> Function(K)? firstJust,

    /// Used to map case where only the second value is [Just]
    Maybe<T> Function(J)? secondJust,

    /// Used to map case where both values are [Just]
    Maybe<T> Function(K, J)? bothJust,

    /// Used to map case where both values are [Nothing]
    Maybe<T> Function()? bothNothing,
  })
```

Use it to combine two different Maybe's into a new one. Input `firstJust` to map case where only the first value is [Just], `secondJust` to map case where only the second value is [Just], `bothJust` to map case where both first and second value are [Just] and `bothNothing` to map case where both are [Nothing]<br>

Example:

````dart
Maybe<Number> combined = (testString, testInt).maybeCombine<Number>(
  bothJust: (val, number) => Just(Number(val, number, '$number$val',)),
  firstJust: (val) => Just(Number(val, -1, '-1$val',)),
  secondJust: (number) => Just(Number('not a trivia', number, 'NonTrivia',)),
  bothNothing: () => Just(Number('not a trivia', -1, 'NonTrivia',)),
       );
```

### RequestStatus

When one is dealing with ui responses to different request states, in the course of it,
usually there are four states of interest `Idle`, `Loading`, `Succeded` or `Failed`.<br>
So the convenience generic union type

```dart
RequestStatus<ResultType>
````

serves the purpose of modeling those states. `Idle` and `Loading`, carry no inner state, but

```dart
Succeeded<ResultType>().data = ResultType data;
```

contains a field `data` of type `ResultType`. And the

```dart
Failed().error = AppError error;
```

contains a field `error` of type `AppError`. Where `AppError` is the convenience type
that models errors in the app.<br>
To deal with the request states one should use one of the unions methods.<br>
The `.map` forces you to deal with all the four states explicitly, passing callbacks for
each state with undestructured states.
Example:

```dart
  Widget build(context) {
    final someRequestStatus = someStateManagement.desiredRequestStatus;
    return someRequestStatus.map(
              idle: (idle) => "widget for idle state",
              loading: (loading) => "widget for loading state",
              succeeded: (succeeded) => "widget for succeeded state using possibly data within succeeded.data",
              failed: (failed) => "widget for failed state using possibly AppError within failed.error",
          );
  }
```

The `.when` forces you to deal with all the four states explicitly, passing callbacks for
each state with destructured states.
Example:

```dart
  Widget build(context) {
    final someRequestStatus = someStateManagement.desiredRequestStatus;
    return someRequestStatus.when(
              idle: () => "widget for idle state",
              loading: () => "widget for loading state",
              succeeded: (data) => "widget for succeeded state using possibly data within data",
              failed: (error) => "widget for failed state using possibly AppError within error",
          );
  }
```

and one also might want to not deal explicitly with all states diferently, so
there are the `.maybeMap`, and `.maybeWhen` methods where you need only expclitly to pass a
`orElse` callback.
Example:

```dart
  Widget build(context) {
    final someRequestStatus = someStateManagement.desiredRequestStatus;
    return someRequestStatus.maybeWhen(
              orElse: () => "default widget to be displayed other wise the current state is not specified in other callbacks"
              loading: () => "widget for loading state",
              succeeded: (data) => "widget for succeeded state using possibly data within succeeded.data",
          );
  }
```

So, `RequestStatus` provides a safe and declarative way to always deal with all possible or desired states of a request. <br>

```dart
Maybe<ResultType> get maybeData;
```

Getter that results in a [Maybe] that is [Just] if the [RequestStatus] is [Succeeded] and [Nothing] otherwise
<br>

### FormField

When providing data to a form and then passing it forward, for instance,
in a request body, one problem that is common here is the need of dealing
with the cases where the field is not filled, and than one might need to
treat every possible resulting Map (json) separetily, either passing the not
filled field with no value or not passing it at all. <br>

The generic sealed data class

```dart
FormField<Type>
```

is a convenience type that models, as the name already points,
a field in a Form, and uses the convention of not passing not filled fields to the resulting `Map`.
Here we are already passing the [name] of the field in its possible `Map`
(json) position, and the actual [field] data is a `Maybe<Type>`.
<br>
`FormField`s are usually used in a `Form` defined class, and with the usage of
our convinice mixin `FormUtils`, one should have everything it needs to have
form validation, and `toJson` method. It might introduce some verbose api, to
deal with, but the convenience of dealing with the most critical parts, like
validating and passing the `Form` information through, makes the usage of our
`FormField`s worthwhile.
<br>
Example (using `freezed` to create the `Form` class):

```dart
 @freezed
 class FormExampleWithFreezed with _$FormExampleWithFreezed, FormUtils {
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
the field to a request body with easy. <br>
Example:

```dart
  request.body = formExampleInstance.toJson(),
```

## AppError

Abstract class to model errors on the application. As a presset of foreseen
specific errors there are some different implementations of this type. Namely:
[HttpError] models errors related to http requests
[CacheError] models cache errors
[DeviceInfoError] models device's information gathering related errors
[FormError] models form related errors
[StorageError] models storage operations related errors

In addition to the [AppError], there are a presset of foreseen [Exceptions]

## Util

### FormUtils

Class used as a dart `Mixin` to a `Form` class, providing methods to conviniently
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
        },
      );
```
