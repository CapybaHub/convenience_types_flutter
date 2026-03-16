// ignore_for_file: avoid_print, unused_local_variable

import 'package:convenience_types/convenience_types.dart';
import 'package:dio/dio.dart';
import 'package:example/http_client_wrapper.dart';
import 'package:flutter/material.dart' hide FormField;

// ---------------------------------------------------------------------------
// 1. ValueObject – EmailAddress (uses Result + ValueError internally)
// ---------------------------------------------------------------------------

/// A self-validating email value object.
///
/// Demonstrates [ValueObject], [Result], and [InvalidEmail].
class EmailAddress extends ValueObject<String> {
  @override
  final Result<String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(
      input.contains('@') && input.contains('.')
          ? Success(input)
          : Failure(InvalidEmail(
              failedValue: input,
              msg: 'Must contain @ and a dot',
            )),
    );
  }

  const EmailAddress._(this.value);
}

// ---------------------------------------------------------------------------
// 2. UseCase – FetchNumberTrivia (uses UseCase, NoParams / custom Params,
//    Result, Unit)
// ---------------------------------------------------------------------------

/// Input parameters for [FetchNumberTrivia].
class FetchNumberTriviaParams {
  final int number;
  const FetchNumberTriviaParams(this.number);
}

/// A concrete [UseCase] that fetches trivia for a given number.
///
/// Demonstrates [UseCase], [Result], [HttpError], and [parseHttpError].
class FetchNumberTrivia extends UseCase<NumberTrivia, FetchNumberTriviaParams> {
  final HttpClientWrapper client;
  const FetchNumberTrivia(this.client);

  @override
  Future<Result<NumberTrivia>> call(FetchNumberTriviaParams params) async {
    return (await client.get(url: '${params.number}?json')).mapSuccess((data) {
      try {
        return Success(NumberTrivia.fromJson(data));
      } catch (e) {
        return Failure(ParseError(slug: e.toString()));
      }
    });
  }
}

/// Simple model returned by the Numbers API.
class NumberTrivia {
  final String text;
  final int number;
  final String type;

  const NumberTrivia(this.text, this.number, this.type);

  factory NumberTrivia.fromJson(Map<String, dynamic> json) {
    final text = json['text'];
    final number = json['number'];
    final type = json['type'];

    if (text is! String || number is! int || type is! String) {
      throw ParseException(
          'Expected {text: String, number: int, type: String}');
    }

    return NumberTrivia(text, number, type);
  }
}

// ---------------------------------------------------------------------------
// 3. Form with FormField + FormUtils + Validator
// ---------------------------------------------------------------------------

/// A tiny sign-up form that demonstrates [FormField], [FormUtils], and
/// the [Validator] typedef.
class SignUpForm with FormUtils {
  final FormField<String> email;
  final FormField<String> password;

  const SignUpForm({
    this.email = const FormField(name: 'email'),
    this.password = const FormField(name: 'password'),
  });

  SignUpForm copyWith({
    FormField<String>? email,
    FormField<String>? password,
  }) =>
      SignUpForm(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  // Validators ---------------------------------------------------------------

  static String? _emailValidator(String value) =>
      value.contains('@') && value.contains('.') ? null : 'Invalid email';

  static String? _passwordMinLength(String value) =>
      value.length >= 6 ? null : 'At least 6 characters';

  // Validations that return Result<String> -----------------------------------

  Result<String> get emailValidation => validateField(
        field: email.field,
        validators: [_emailValidator],
      );

  Result<String> get passwordValidation => validateField(
        field: password.field,
        validators: [_passwordMinLength],
      );

  /// Serialise only the fields that have been filled.
  Map<String, dynamic> toJson() => fieldsToJson([email, password]);
}

// ---------------------------------------------------------------------------
// App
// ---------------------------------------------------------------------------

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Convenience Types — Full API Demo',
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const DemoHome(),
    );
  }
}

class DemoHome extends StatefulWidget {
  const DemoHome({super.key});

  @override
  State<DemoHome> createState() => _DemoHomeState();
}

class _DemoHomeState extends State<DemoHome> {
  // -- Number trivia demo (UseCase + RequestStatus + HttpClientWrapper) ------
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://numbersapi.com/',
    contentType: 'application/json; charset=utf-8',
  ));
  late final HttpClientWrapper _client = HttpClientWrapper(_dio);
  late final FetchNumberTrivia _fetchTrivia = FetchNumberTrivia(_client);

  FormField<String> _numberField = const FormField(name: 'number');
  RequestStatus<NumberTrivia> _triviaStatus = const Idle();

  // -- Sign-up form demo (FormField + FormUtils + Validator) -----------------
  SignUpForm _form = const SignUpForm();

  // -- Collected log lines ---------------------------------------------------
  final List<String> _logLines = [];

  void _log(String line) => setState(() => _logLines.add(line));

  // --------------------------------------------------------------------------
  // Lifecycle
  // --------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    _runPureDartDemos();
  }

  /// Runs a series of pure‐Dart demos on init and writes to [_logLines].
  void _runPureDartDemos() {
    _log('═══ Result ═══');
    const Result<int> ok = Success(42);
    const Result<int> err = Failure(AppUnknownError(slug: 'oops'));
    _log('ok.isSuccess: ${ok.isSuccess}');
    _log('err.isFailure: ${err.isFailure}');
    _log(
        'ok.handle → ${ok.handle(onSuccess: (d) => 'got $d', onFailure: (e) => e.slug)}');
    _log('ok.mapSuccess → ${ok.mapSuccess((v) => Success(v * 2))}');
    _log('err.mapFailure → ${err.mapFailure((e) => const Success(-1))}');
    _log('ok.maybeData → ${ok.maybeData}');
    _log('');

    _log('═══ Maybe ═══');
    const Maybe<String> name = Just('Alice');
    const Maybe<String> empty = Nothing();
    _log('name.isJust: ${name.isJust}');
    _log('empty.isNothing: ${empty.isNothing}');
    _log("name.getOrElse('?'): ${name.getOrElse('?')}");
    _log("empty.getOrElse('?'): ${empty.getOrElse('?')}");
    _log('Maybe.from(null): ${Maybe<String>.from(null)}');
    _log('Maybe.from("hi"): ${Maybe.from("hi")}');
    _log('Maybe.fromResult(ok): ${Maybe.fromResult(ok)}');
    _log('name.mapJust → ${name.mapJust((v) => Just(v.length))}');
    _log(
        'empty.mapNothing → ${empty.mapNothing(() => const Just('fallback'))}');
    _log('');

    _log('═══ Maybe pair (maybeCombine) ═══');
    const pair = (Just(10), Just('px'));
    final combined = pair.maybeCombine<String>(
      bothJust: (n, u) => Just('$n$u'),
      firstJust: (n) => Just('$n'),
      secondJust: (u) => Just(u),
      bothNothing: () => const Just('–'),
    );
    _log('(Just(10), Just("px")).maybeCombine → $combined');
    _log('');

    _log('═══ Unit & identity ═══');
    _log('Unit(): ${const Unit()}');
    _log('identity(42): ${identity(42)}');
    _log('');

    _log('═══ RequestStatus ═══');
    const RequestStatus<String> idle = Idle();
    const loaded = Succeeded('data!');
    const failed = Failed(FailedToCacheError(slug: 'cache'));
    _log('idle.isIdle: ${idle.isIdle}');
    _log('loaded.isSucceeded: ${loaded.isSucceeded}');
    _log('loaded.maybeData: ${loaded.maybeData}');
    _log('failed.isFailed: ${failed.isFailed}');
    _log('RequestStatus.fromResult(ok): ${RequestStatus.fromResult(ok)}');
    _log('Maybe.fromRequest(loaded): ${Maybe.fromRequest(loaded)}');
    _log('');

    _log('═══ ValueObject (EmailAddress) ═══');
    final validEmail = EmailAddress('test@example.com');
    final invalidEmail = EmailAddress('nope');
    _log('valid.isValid: ${validEmail.isValid()}');
    _log('valid.getOrCrash: ${validEmail.getOrCrash()}');
    _log('invalid.isValid: ${invalidEmail.isValid()}');
    _log('invalid.failureOrUnit: ${invalidEmail.failureOrUnit}');
    try {
      invalidEmail.getOrCrash();
    } on UnexpectedValueError catch (e) {
      _log('Caught UnexpectedValueError: $e');
    }
    _log('');

    _log('═══ FormField + FormUtils + Validator ═══');
    _form = _form.copyWith(
      email: _form.email.copyWith(field: const Just('bad')),
      password: _form.password.copyWith(field: const Just('12345')),
    );
    _log('emailValidation: ${_form.emailValidation}');
    _log('passwordValidation: ${_form.passwordValidation}');
    _log('toJson (partial): ${_form.toJson()}');
    _form = _form.copyWith(
      email: _form.email.copyWith(field: const Just('a@b.c')),
      password: _form.password.copyWith(field: const Just('secure123')),
    );
    _log('emailValidation (fixed): ${_form.emailValidation}');
    _log('toJson (full): ${_form.toJson()}');
    _log('');

    _log('═══ NoParams ═══');
    _log('NoParams(): ${const NoParams()}');
    _log('');

    _log('═══ SizingInformation & ScreenType ═══');
    _log('ScreenType.fromWidth(320): ${ScreenType.fromWidth(320)}');
    _log('ScreenType.fromWidth(900): ${ScreenType.fromWidth(900)}');
    _log('ScreenType.fromWidth(1920): ${ScreenType.fromWidth(1920)}');
    _log('');

    _log('═══ AppError hierarchy ═══');
    const errors = <AppError>[
      AppUnknownError(slug: 'unknown'),
      ParseError(slug: 'parse'),
      EntityNotFitError(slug: 'entity'),
      FailedToShareError(slug: 'share'),
      TokenNotFoundError(slug: 'token'),
      HttpNotFoundError(slug: '404', msg: 'Not found'),
      HttpBadRequestError(slug: '400'),
      HttpUnauthorizedError(slug: '401'),
      HttpForbiddenError(slug: '403'),
      HttpGoneError(slug: '410'),
      UnprocessableEntityError(slug: '422'),
      HttpInternalServerError(slug: '500'),
      HttpNetworkError(slug: 'net'),
      HttpUnknownError(slug: 'http_unknown'),
      NoInternetConnectionError(slug: 'offline'),
      FailedToCacheError(slug: 'cache_write'),
      FileAlreadyCachedError(slug: 'dup'),
      NotCachedError(slug: 'miss'),
      FailedToUnloadError(slug: 'unload'),
      StorageUnknownError(slug: 'storage'),
      StorageNotFoundError(slug: 'storage_404'),
      FormError(slug: 'form'),
      DeviceInfoUnknownError(slug: 'dev_unknown'),
      DeviceInfoNotFoundError(slug: 'dev_404'),
    ];
    for (final e in errors) {
      _log('  ${e.runtimeType} (slug: ${e.slug})');
    }
    _log('');

    _log('═══ ValueError subclasses ═══');
    const valErrors = <ValueError>[
      InvalidEmail(failedValue: 'x'),
      InvalidPassword(failedValue: 'x'),
      InvalidUserName(failedValue: 'x'),
      InvalidName(failedValue: 'x'),
      InvalidOTP(failedValue: 'x'),
      DescriptionTooShort(failedValue: 'x'),
      DescriptionTooLong(failedValue: 'x'),
      InsufficientDetail(failedValue: 'x'),
      InvalidCharacters(failedValue: 'x'),
    ];
    for (final v in valErrors) {
      _log('  ${v.runtimeType}');
    }
    _log('');

    _log('═══ Exceptions ═══');
    _log('ParseException: ${ParseException('bad json')}');
    _log('CacheException: ${CacheException('disk full')}');
    _log('');

    _log('═══ DefaultErrorMessages ═══');
    _log('unknownError: ${DefaultErrorMessages.unknownError}');
    _log(
        'noInternetConnectionError: ${DefaultErrorMessages.noInternetConnectionError}');
    _log('waitCurrentRequest: ${DefaultErrorMessages.waitCurrentRequest}');
    _log('');

    _log('═══ AppError.maybeResponse ═══');
    const httpErr = HttpNotFoundError<String>(
      slug: '404',
      response: Just('response body'),
    );
    _log('httpErr.maybeResponse<String>(): ${httpErr.maybeResponse<String>()}');
    const appErr = AppUnknownError(slug: 'no_response');
    _log('appErr.maybeResponse<String>(): ${appErr.maybeResponse<String>()}');
    _log('');

    _log('✅ All pure-Dart demos complete.');
  }

  // --------------------------------------------------------------------------
  // Number trivia fetch (showcases UseCase + RequestStatus + HttpError)
  // --------------------------------------------------------------------------
  Future<void> _onFetchTrivia() async {
    setState(() => _triviaStatus = const Loading());

    final input = _numberField.field.getOrElse('42');
    final numberValue = int.tryParse(input) ?? 42;

    final result = await _fetchTrivia(FetchNumberTriviaParams(numberValue));

    setState(() => _triviaStatus = RequestStatus.fromResult(result));
  }

  // --------------------------------------------------------------------------
  // Build
  // --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Convenience Types — Full API Demo')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Demonstrate SizingInformation
          final sizing = SizingInformation(
            screenType: ScreenType.fromWidth(constraints.maxWidth),
            screenSize: Size(constraints.maxWidth, constraints.maxHeight),
          );

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // -- SizingInformation live readout -----------------------------
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'SizingInformation ▸ ${sizing.screenType.name} '
                    '(${sizing.screenSize.width.toStringAsFixed(0)}×'
                    '${sizing.screenSize.height.toStringAsFixed(0)})',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // -- Number trivia section (UseCase + RequestStatus) ------------
              Text('Number trivia (UseCase + RequestStatus)',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter a number',
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) =>
                    _numberField = _numberField.copyWith(field: Just(v)),
              ),
              const SizedBox(height: 8),
              FilledButton.icon(
                onPressed: _onFetchTrivia,
                icon: const Icon(Icons.search),
                label: const Text('Fetch trivia'),
              ),
              const SizedBox(height: 8),
              switch (_triviaStatus) {
                Idle() => const SizedBox.shrink(),
                Loading() => const LinearProgressIndicator(),
                Succeeded(:final data) => Card(
                    color: Colors.green.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child:
                          Text('${data.number} (${data.type}): ${data.text}'),
                    ),
                  ),
                Failed(:final error) => Card(
                    color: Colors.red.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text('Error: ${error.slug}'),
                    ),
                  ),
              },
              const Divider(height: 32),

              // -- Pure-Dart demo log ----------------------------------------
              Text('Pure-Dart API demos (run on init)',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SelectableText(
                  _logLines.join('\n'),
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    color: Colors.greenAccent,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
