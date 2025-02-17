import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String label;

  const CustomTextfield({
    super.key,
    required this.controller,
    this.hintText,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
