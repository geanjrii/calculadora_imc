import 'package:calculadora_imc/feature_layer/imc/cubit/imc_cubit.dart';
import 'package:calculadora_imc/feature_layer/imc/models/models.dart';
import 'package:test/test.dart';

void main() {
  group('ImcState', () {
    test('copyWith method returns a new instance with the provided values', () {
      const state = ImcState.initial();
      final newState = state.copyWith(
        result: 'Peso ideal (24.22)',
        formValues: const FormValues(
          weight: Weight.dirty('70'),
          height: Height.dirty('170'),
        ),
      );

      expect(newState.result, 'Peso ideal (24.22)');
      expect(newState.formValues.weight.value, '70');
      expect(newState.formValues.height.value, '170');
      expect(newState.formValues.isValid, true);
    });

    test('equality comparison works correctly', () {
      const state1 = ImcState.initial();
      const state2 = ImcState.initial();
      final state3 = state1.copyWith(result: 'Peso ideal (24.22)');

      expect(state1 == state2, true);
      expect(state1 == state3, false);
    });

    test('props list contains all the correct properties', () {
      const state = ImcState.initial();

      expect(state.props, [state.result, state.formValues]);
    });
  });
}
