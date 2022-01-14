import 'package:flutter/material.dart';
import '../config/style.dart';

class TextInput extends StatelessWidget {
  final GlobalKey formKey;
  final TextEditingController controller;
  final String label;

  const TextInput({
    Key? key,
    required this.formKey,
    required this.controller,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 39.88,
      child: TextFormField(
        key: formKey,
        controller: controller,
        decoration: InputDecoration(
          label: Text(
            label,
            style: labelText,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 7.94, 16, 7.94),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        validator: (String? value) {
          if (value?.isEmpty ?? true) return 'required';
        },
      ),
    );
  }
}
