import 'package:flutter/material.dart';

class KtextFormField extends StatelessWidget {
  KtextFormField(
      {super.key,
      required this.controller,
      required this.prefixIcon,
      this.obscureText = false});
  final TextEditingController controller;
  final Widget prefixIcon;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
