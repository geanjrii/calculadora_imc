import 'package:bloc_test/bloc_test.dart';
import 'package:calculadora_imc/feature_layer/imc/cubit/imc_cubit.dart';
import 'package:calculadora_imc/feature_layer/imc/models/models.dart';
import 'package:test/test.dart';

void main() {
  group('ImcCubit', () {
    late ImcCubit imcCubit;

    setUp(() {
      imcCubit = ImcCubit();
    });

    test('initial state is correct', () {
      expect(imcCubit.state, const ImcState.initial());
    });

    group('onWeightChanged | ', () {
      blocTest<ImcCubit, ImcState>(
        'emits correct state when weight is changed',
        build: () => imcCubit,
        act: (cubit) => cubit.onWeightChanged('70'),
        expect: () => [
          imcCubit.state
              .copyWith(weight: const Weight.dirty('70'), isValid: false),
        ],
      );
    });

    group('onHeightChanged | ', () {
      blocTest<ImcCubit, ImcState>(
        'emits correct state when height is changed',
        build: () => imcCubit,
        act: (cubit) => cubit.onHeightChanged('170'),
        expect: () => [
          imcCubit.state
              .copyWith(height: const Height.dirty('170'), isValid: false),
        ],
      );
    });

    group('onCalculatedPressed', () {
      blocTest<ImcCubit, ImcState>(
        'emits correct state when calculate button is pressed with valid input',
        build: () => imcCubit,
        seed: () => imcCubit.state.copyWith(
          weight: const Weight.dirty('70'),
          height: const Height.dirty('170'),
          isValid: true,
        ),
        act: (cubit) => cubit.onCalculatePressed(),
        expect: () => [
          imcCubit.state.copyWith(
            result: 'Peso ideal (24.22)',
          ),
        ],
      );

      blocTest<ImcCubit, ImcState>(
        'emits correct state when calculate button is pressed with invalid input',
        build: () => imcCubit,
        seed: () => imcCubit.state.copyWith(
          weight: const Weight.dirty('70'),
          height: const Height.dirty('170'),
          isValid: false,
        ),
        act: (cubit) => cubit.onCalculatePressed(),
        expect: () => [],
      );
    });

    group('onResetPressed | ', () {
      blocTest<ImcCubit, ImcState>(
        'emits correct state when reset button is pressed',
        build: () => imcCubit,
        act: (cubit) => cubit.onResetPressed(),
        expect: () => [
          const ImcState.initial(),
        ],
      );
    });
  });
}
