import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({
    Key? key,
    required this.isObscure,
    required this.inputType,
    required this.label,
    required this.controller,
  }) : super(key: key);

  final bool isObscure;
  final TextInputType inputType;
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      keyboardType: inputType,
      decoration: InputDecoration(
        label: Text(label),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
      ),
    );
  }
}
