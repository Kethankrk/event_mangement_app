import 'package:flutter/material.dart';
import 'package:planit/utils/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double radius;
  final bool disabled;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.disabled = false,
    this.radius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        disabledBackgroundColor: CustomColors.dim,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
        ),
      ),
    );
  }
}

Widget customTextButton(
        {required String text, required VoidCallback onPress}) =>
    GestureDetector(
      onTap: onPress,
      child: Text(text,
          style: const TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
          )),
    );
