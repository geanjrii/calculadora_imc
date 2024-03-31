// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.refresh),
    );
  }
}
