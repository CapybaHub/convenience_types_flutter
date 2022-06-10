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
</ol>

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Types

### Result

Every asynchronus task can have two possible outcomes as a `Result`.
It is either a `Success` or a `Failure`.<br>
So the

```dart
Result<ResultType>
```

generic union type is a convinience type to model
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

Where AppError is a convinience type to model errors in the application

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

`anti-patern alert!`: The `Result` generic Union type comes with casts convinience methods `asSuccess`, `asFailure`, but although it might be temping to just cast the result into the desired type, it is strongly advised you not to do it, once if you try to cast diferent types (`Success` as `Failure` or the other way around) it would throw an exception.

### Maybe

### RequestStatus

### FormField

## AppError
