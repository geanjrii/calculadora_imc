import 'package:formz/formz.dart';

enum WeightValidationError { invalid }

class Weight extends FormzInput<String, WeightValidationError> {
  const Weight.pure() : super.pure('');

  const Weight.dirty([super.value = '']) : super.dirty();

  static final RegExp _weightRegExp = RegExp(r'^\d+(\.\d+)?$');

  @override
  WeightValidationError? validator(String? value) {
    return _weightRegExp.hasMatch(value ?? '')
        ? null
        : WeightValidationError.invalid;
  }
}
