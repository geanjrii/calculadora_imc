import 'package:calculadora_imc/feature_layer/imc/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class FormValues extends Equatable {
  final Weight weight;
  final Height height;

  const FormValues({
    this.weight = const Weight.pure(),
    this.height = const Height.pure(),
  });

  bool get isValid => Formz.validate([weight, height]);

  FormValues copyWith({
    Weight? weight,
    Height? height,
  }) {
    return FormValues(
      weight: weight ?? this.weight,
      height: height ?? this.height,
    );
  }

  @override
  List<Object?> get props => [weight, height];
}
