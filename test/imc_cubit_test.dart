import 'package:bloc_test/bloc_test.dart';
import 'package:calculadora_imc/feature_layer/imc/cubit/imc_cubit.dart';
import 'package:calculadora_imc/feature_layer/imc/models/models.dart';
import 'package:test/test.dart';

void main() {
  const mockFormValues = FormValues(
    weight: Weight.dirty('70'),
    height: Height.dirty('170'),
  );
  group('ImcCubit', () {
    late ImcCubit imcCubit;

    setUp(() {
      imcCubit = ImcCubit();
    });

    tearDown(() => imcCubit.close());

    test('initial state is correct', () {
      expect(imcCubit.state, const ImcState.initial());
    });

    group('onWeightChanged | ', () {
      blocTest<ImcCubit, ImcState>(
        'emits correct state when weight is changed',
        build: () => imcCubit,
        seed: () => const ImcState(formValues: mockFormValues),
        act: (cubit) => cubit.onWeightChanged('50'),
        expect: () => [
          imcCubit.state.copyWith(
              formValues:
                  mockFormValues.copyWith(weight: const Weight.dirty('50'))),
        ],
      );
    });

    group('onHeightChanged | ', () {
      blocTest<ImcCubit, ImcState>(
        'emits correct state when height is changed',
        build: () => imcCubit,
        seed: () => const ImcState(formValues: mockFormValues),
        act: (cubit) => cubit.onHeightChanged('150'),
        expect: () => [
          imcCubit.state.copyWith(
              formValues:
                  mockFormValues.copyWith(height: const Height.dirty('150'))),
        ],
      );
    });

    group('onCalculatedPressed', () {
      blocTest<ImcCubit, ImcState>(
        'emits correct state when calculate button is pressed with valid input',
        build: () => imcCubit,
        seed: () => const ImcState(formValues: mockFormValues),
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
        seed: () =>
            const ImcState(formValues: FormValues(weight: Weight.dirty('70'))),
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
