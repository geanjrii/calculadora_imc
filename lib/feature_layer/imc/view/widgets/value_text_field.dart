// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class ValueTextField extends StatelessWidget {
  final Color customColor;

  final String labelText;

  final TextEditingController controller;

  final void Function(String)? onChanged;

  final String? errorText;

  const ValueTextField({
    super.key,
    required this.onChanged,
    required this.customColor,
    required this.labelText,
    required this.errorText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        errorText: errorText,
        border:
            UnderlineInputBorder(borderSide: BorderSide(color: customColor)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: customColor)),
        labelText: labelText,
        labelStyle: TextStyle(color: customColor),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(color: customColor, fontSize: 25),
      controller: controller,
    );
  }
}
