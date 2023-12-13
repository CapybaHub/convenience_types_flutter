import 'package:convenience_types/types/form_field.dart';
import 'package:convenience_types/types/maybe.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'castInto',
    () {
      test(
        'It should return a new FormField with the new Type, the resulting field should be the return of combiner, the name should be the same',
        () {
          FormField<String> testFormField =
              const FormField(name: 'test', field: Just('1.0'));
          FormField<double> castedField = testFormField.castInto(
              combiner: (input) => Maybe.from(double.tryParse(input)));

          expect(castedField.name, testFormField.name);
          expect(castedField.field, const Just(1.0));
        },
      );
    },
  );
}
