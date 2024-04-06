import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../models/models.dart';

part 'imc_state.dart';

final class ImcCubit extends Cubit<ImcState> {
  ImcCubit() : super(const ImcState.initial());

  void onWeightChanged(String value) {
    emit(state.copyWith(
        formValues: state.formValues.copyWith(
      weight: Weight.dirty(value),
    )));
  }

  void onHeightChanged(String value) {
    emit(state.copyWith(
        formValues: state.formValues.copyWith(
      height: Height.dirty(value),
    )));
  }

  void onCalculatePressed() {
    if (state.formValues.isValid) {
      final weight = state.formValues.weight.value;
      final height = state.formValues.height.value;
      final result = _calculateImc(weight: weight, height: height);
      emit(state.copyWith(result: result));
    }
  }

  void onResetPressed() {
    emit(const ImcState.initial());
  }

  String _calculateImc({required String weight, required String height}) {
    final double newWeight = double.parse(weight);
    final double newHeight = double.parse(height) / 100;
    final double imc = newWeight / (newHeight * newHeight);
    String result = '';
    if (imc < 18.6) {
      result = 'Abaixo do peso';
    } else if (imc >= 18.6 && imc < 24.9) {
      result = 'Peso ideal';
    } else if (imc >= 24.9 && imc < 29.9) {
      result = 'Levemente acima do peso';
    } else if (imc >= 29.9 && imc < 34.9) {
      result = 'Obesidade grau I';
    } else if (imc >= 34.9 && imc < 39.9) {
      result = 'Obesidade grau II';
    } else if (imc >= 40) {
      result = 'Obesidade grau III';
    }
    return '$result (${imc.toStringAsFixed(2)})';
  }
}


