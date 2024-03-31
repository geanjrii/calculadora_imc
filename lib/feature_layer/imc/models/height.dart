import 'package:formz/formz.dart';

enum HeightValidationError { invalid }

class Height extends FormzInput<String, HeightValidationError> {
  const Height.pure() : super.pure('');

  const Height.dirty([super.value = '']) : super.dirty();

  static final RegExp _heightRegExp = RegExp(r'^\d+(\.\d+)?$');

  @override
  HeightValidationError? validator(String? value) {
    return _heightRegExp.hasMatch(value ?? '')
        ? null
        : HeightValidationError.invalid;
  }
}
