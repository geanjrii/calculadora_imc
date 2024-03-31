import 'package:calculadora_imc/feature_layer/imc/models/weight.dart';
import 'package:flutter/material.dart';

import 'value_text_field.dart';

class WeightTextField extends StatefulWidget {
  const WeightTextField({
    super.key,
    required this.customColor,
    required this.onChanged,
    required this.weight,
  });

  final Color customColor;
  final void Function(String) onChanged;
  final Weight weight;

  @override
  State<WeightTextField> createState() => _WeightTextFieldState();
}

class _WeightTextFieldState extends State<WeightTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.weight.value;
    final erro = widget.weight.displayError;
    return ValueTextField(
      onChanged: widget.onChanged,
      customColor: widget.customColor,
      labelText: 'Peso(kg)',
      controller: _controller,
      errorText: erro != null ? 'Peso invalido!' : null,
    );
  }
}
