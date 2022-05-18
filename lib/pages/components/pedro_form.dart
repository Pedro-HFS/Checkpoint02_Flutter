import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PedroForm extends StatelessWidget {
  final String label;
  final Function()? onEditingComplete;
  final TextEditingController? userInputController;
  final FocusNode? focusNode;

  PedroForm(
      {required this.label,
      this.userInputController,
      this.onEditingComplete,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        new LengthLimitingTextInputFormatter(50),
      ],
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      controller: userInputController,
      decoration: InputDecoration(
        label: Text(label),
      ),
    );
  }
}
