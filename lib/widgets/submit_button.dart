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
    return Container(
      width: double.infinity,
      height: 51,
      padding: const EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        child: Text(
          label,
          style: whiteText(14),
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
