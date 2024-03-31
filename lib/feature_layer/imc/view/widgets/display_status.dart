// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class DisplayStatus extends StatelessWidget {
  const DisplayStatus({
    super.key,
    required this.customColor,
    required this.result,
  });

  final Color customColor;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Text(
      result,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: customColor,
        fontSize: 25,
      ),
    );
  }
}
