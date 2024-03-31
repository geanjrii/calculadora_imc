part of 'imc_cubit.dart';

final class ImcState extends Equatable {
  final String result;
  final Weight weight;
  final Height height;
  final FormzSubmissionStatus status;
  final bool isValid;

  const ImcState._({
    this.result = 'Informe os teus dados!',
    this.weight = const Weight.pure(),
    this.height = const Height.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
  });

  const ImcState.initial() : this._();

  ImcState copyWith({
    String? result,
    Weight? weight,
    Height? height,
    FormzSubmissionStatus? status,
    bool? isValid,
  }) {
    return ImcState._(
      result: result ?? this.result,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  String toString() =>
      'ImcState { result: $result, weight: $weight, height: $height , status: $status}';

  @override
  List<Object> get props => [result, weight, height, status, isValid];
}
