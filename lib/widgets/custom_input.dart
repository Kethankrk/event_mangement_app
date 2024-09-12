import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final IconButton? suffixIconButton;
  final bool? obstruct;
  const CustomInputField({
    super.key,
    required this.label,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconButton,
    this.obstruct,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),
      obscureText: obstruct ?? false,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: const TextStyle(color: Colors.grey),
        floatingLabelStyle: const TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon ?? suffixIconButton,
      ),
    );
  }
}
