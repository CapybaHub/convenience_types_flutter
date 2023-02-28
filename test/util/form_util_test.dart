import 'package:convenience_types/convenience_types.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FormUtils formUtils;

  setUp(
    () {
      formUtils = FormUtils();
    },
  );

  const String errorString = 'error';
  const String secondErrorString = 'secondError';
  const FormError testError = FormError(msg: errorString);
  FormField testField = const FormField(
    name: 'test',
  );
  FormField testFilledField = const FormField(
    name: 'testFilledField',
    field: Just('test'),
  );

  List<Validator> testPassingValidators = [
    (dynamic value) => null,
  ];

  List<Validator> testNotPassingValidators = [
    (dynamic value) => errorString,
    (dynamic value) => secondErrorString,
  ];

  group(
    'validateField',
    () {
      test(
        'It should return Success(""), if the provided list of validators isEmpty',
        () {
          Result<String> validationTest = formUtils.validateField(
            field: testField.field,
            validators: <Validator>[],
          );

          validationTest.handle(
            onSuccess: (data) => expect(data.isEmpty, true),
            onFailure: (_) =>
                fail('Unexpected Failure! It shouldnt have happened'),
          );
        },
      );

      test(
        'It should return Success(""), if the provided list of validators passes',
        () {
          Result<String> validationTest = formUtils.validateField(
            field: testField.field,
            validators: testPassingValidators,
          );

          validationTest.handle(
            onSuccess: (data) => expect(data.isEmpty, true),
            onFailure: (_) =>
                fail('Unexpected Failure! It shouldnt have happened'),
          );
        },
      );

      test(
        'It should return Failure(FormError(msg: errorMessage)), if the provided list of validators not passes',
        () {
          Result<String> validationTest = formUtils.validateField(
            field: testField.field,
            validators: testNotPassingValidators,
          );

          validationTest.handle(
            onSuccess: (_) =>
                fail('Unexpected Success! It shouldnt have happened'),
            onFailure: (error) => expect(error, testError),
          );
        },
      );

      test(
        'It should return Failure(FormError(msg: errorMessage)), with the first error message, if the provided list of validators not passes for more than one Validator',
        () {
          Result<String> validationTest = formUtils.validateField(
            field: testField.field,
            validators: testNotPassingValidators,
          );

          validationTest.handle(
            onSuccess: (_) =>
                fail('Unexpected Success! It shouldnt have happened'),
            onFailure: (error) => expect(error, testError),
          );
        },
      );
    },
  );

  group(
    'fieldsToJson',
    () {
      test(
        'It should return an empty Map if the provided List<FormField>.isEmpty',
        () {
          Map<String, dynamic> json = formUtils.fieldsToJson([]);

          expect(json.isEmpty, true);
        },
      );

      test(
        'It should return a Map with Map.containsKey(field.name) == false, if a field provided in the List<FormField> has Nothing as value',
        () {
          Map<String, dynamic> json = formUtils.fieldsToJson([
            testField,
            testFilledField,
          ]);

          expect(json.containsKey(testField.name), false);
        },
      );

      test(
        'It should return a Map with Map[field.name] = Just.value, if the a field provided in the List<FormField> has Just as value',
        () {
          Map<String, dynamic> json = formUtils.fieldsToJson([
            testField,
            testFilledField,
          ]);

          expect(
              json[testFilledField.name], testFilledField.field.asJust.value);
        },
      );
    },
  );
}
