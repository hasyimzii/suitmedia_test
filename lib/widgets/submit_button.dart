import 'package:flutter/material.dart';
import '../config/style.dart';

class SubmitButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const SubmitButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        child: Text(
          label,
          style: buttonText,
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          primary: greenColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
