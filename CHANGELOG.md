## 0.5.2

## New

- add `maybeAsyncCombine`
- add connectionError to `parseHttpError`

## Fix

- remove async return to `maybeCombine`


## 0.5.1

## Change

- add async return to `maybeCombine`

## 0.5.0

## New

- add `castInto<k>` method to `FormField<T>` to help casting field types leaving names unchanged

## 0.4.0

## New

- add `mapAsyncSuccess<K>` method to `Result` to chain asynchronous access to data
- add `mapAsyncJust<K>` method to `Maybe` to chain asynchronous access to data
- add `(Maybe<J>, Maybe<K>).maybeCombine` extension method to `(Maybe<J>, Maybe<K>)` records to neatly control access to an ordered pair of two `Maybe`s possible values

## 0.3.3

## fixes

- add `defaultNoInternetConnectionMessage` to `parseHttpError` method

## 0.3.2

## fixes

- add `maybeResponse<T>()` generic method to AppError

## 0.3.1

## fixes

- `FormUtils` as a mixin class

## 0.3.0

## new

- add generic type to `httpError` to accomodate possible error.responses

## 0.2.2

## fixes

- add 'slug' in the parameters of 'parseHttpError' and utilize it in the errors 'slug' field.

## 0.2.1

## changed

- update Flutter sdk to 3.7.12
- update dependencies
- fix msg field on HttpBadRequestError and UnprocessableEntityError

## 0.2.0

## new

- Maybe factories
- maybeData getters
- const contructors to AppError

## 0.1.2

## fixes

- getOrElse behavior
- Getting Started session in the readme

## 0.1.1

## new

- added example

## fixes

- typos (convinience -> convenience)

## 0.1.0

## new

- types: `FormField`, `Maybe`, `RequestStatus`, `Result`
- errors: `CacheError`, `DeviceInfoError`, `FormError`, `HttpError`, `StorageError`
- exceptions: `ParseException`, `CacheException`
- formUtils: `FormUtils`, `SeedTestStateMixin`
