// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calculadora_imc/feature_layer/imc/models/height.dart';
import 'package:flutter/material.dart';

import 'value_text_field.dart';

class HeightTextField extends StatefulWidget {
  const HeightTextField({
    super.key,
    required this.customColor,
    required this.onChanged,
    required this.height,
  });

  final Color customColor;
  final void Function(String) onChanged;
  final Height height;

  @override
  State<HeightTextField> createState() => _HeightTextFieldState();
}

class _HeightTextFieldState extends State<HeightTextField> {
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
    _controller.text = widget.height.value;
    final erro = widget.height.displayError;
    return ValueTextField(
      onChanged: widget.onChanged,
      customColor: widget.customColor,
      labelText: 'Altura (cm)',
      controller: _controller,
      errorText: erro != null ? 'Altura invalida!' : null,
    );
  }
}
