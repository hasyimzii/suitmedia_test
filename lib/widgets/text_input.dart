import 'package:flutter/material.dart';
import '../common/style.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const TextInput({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: labelText,
        errorStyle: whiteText(12),
        fillColor: whiteColor,
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 1, 1, 11),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 0.5,
            color: lightColor,
          )
        ),
      ),
      validator: (String? value) {
        if (value?.isEmpty ?? true) return 'required';
      },
    );
  }
}
