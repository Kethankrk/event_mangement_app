import 'package:flutter/material.dart';
import 'package:planit/utils/theme.dart';

class CustomInputField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextEditingController controller;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final IconButton? suffixIconButton;
  final bool? obstruct;
  final int? maxLines;
  final int? minLines;
  final String? errorText;
  final Color borderColor;
  final Color? backgroudColor;
  const CustomInputField({
    super.key,
    this.label,
    required this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconButton,
    this.obstruct,
    this.maxLines = 1,
    this.minLines,
    this.errorText,
    this.borderColor = Colors.white,
    this.backgroudColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.w300, fontSize: 14),
      obscureText: obstruct ?? false,
      obscuringCharacter: "*",
      maxLines: maxLines,
      minLines: minLines,
      decoration: InputDecoration(
        fillColor: backgroudColor,
        filled: backgroudColor != null ? true : false,
        label: label != null
            ? Text(
                label!,
                style: const TextStyle(color: Colors.white),
              )
            : null,
        hintText: hintText,
        errorText: errorText,
        hintStyle: const TextStyle(color: Colors.grey),
        floatingLabelStyle: const TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: borderColor),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon ?? suffixIconButton,
      ),
    );
  }
}

class StandardInputField extends StatelessWidget {
  final String label;
  final String? hintText;
  final TextEditingController controller;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final IconButton? suffixIconButton;
  final bool? obstruct;
  final int? maxLines;
  final int? minLines;
  final String? errorText;
  const StandardInputField({
    super.key,
    required this.label,
    required this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconButton,
    this.obstruct,
    this.maxLines = 1,
    this.minLines,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(alignment: Alignment.centerLeft, child: LabelLarge(text: label)),
        TextField(
          controller: controller,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 14),
          obscureText: obstruct ?? false,
          obscuringCharacter: "*",
          maxLines: maxLines,
          minLines: minLines,
          decoration: InputDecoration(
            hintText: hintText,
            errorText: errorText,
            hintStyle: const TextStyle(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.white),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon ?? suffixIconButton,
          ),
        ),
      ],
    );
  }
}
