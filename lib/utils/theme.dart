import 'package:flutter/material.dart';

class TitleLarge extends StatelessWidget {
  final String text;
  const TitleLarge({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        height: 1.0,
      ),
    );
  }
}

class TitleMedium extends StatelessWidget {
  final String text;
  const TitleMedium({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 38,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        height: 1.0,
      ),
    );
  }
}

class TitleSmall extends StatelessWidget {
  final String text;
  const TitleSmall({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24.0,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class LabelLarge extends StatelessWidget {
  final String text;
  const LabelLarge({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        color: Color.fromARGB(255, 158, 158, 158),
      ),
    );
  }
}

class DisplayMedium extends StatelessWidget {
  final String text;
  const DisplayMedium({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    );
  }
}

class DisplaySmall extends StatelessWidget {
  final String text;
  const DisplaySmall({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.white,
      ),
    );
  }
}

class ErrorText extends StatelessWidget {
  final String text;
  const ErrorText({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.red,
      ),
    );
  }
}
