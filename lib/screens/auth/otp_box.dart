import 'package:flutter/material.dart';

class OtpBoxes extends StatelessWidget {
  final TextEditingController controller;

  const OtpBoxes({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      maxLength: 6,
      textAlign: TextAlign.center,
      style: const TextStyle(
        letterSpacing: 32,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        counterText: "",
        hintText: "------",
        hintStyle: TextStyle(
          letterSpacing: 32,
          color: Colors.grey.shade400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
