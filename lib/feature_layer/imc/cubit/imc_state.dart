part of 'imc_cubit.dart';

final class ImcState extends Equatable {
  final String result;
  final FormValues formValues;

  const ImcState({
    this.result = 'Informe os teus dados!',
    this.formValues = const FormValues(),
  });

  const ImcState.initial() : this();

  ImcState copyWith({
    String? result,
    FormValues? formValues,
    FormzSubmissionStatus? status,
  }) {
    return ImcState(
      result: result ?? this.result,
      formValues: formValues ?? this.formValues,
    );
  }

  @override
  String toString() => 'ImcState { result: $result, formValues: $formValues  }';

  @override
  List<Object> get props => [result, formValues];
}
