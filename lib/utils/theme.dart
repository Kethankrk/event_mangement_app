import 'package:flutter/material.dart';

class TitleLarge extends StatelessWidget {
  final String text;
  final Color color;
  final AlignmentGeometry? alignment;

  const TitleLarge({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.alignment,
  });
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 42,
          fontWeight: FontWeight.w700,
          color: color,
          height: 1.0,
        ),
      ),
    );
  }
}

class TitleMedium extends StatelessWidget {
  final String text;
  final Color color;
  final AlignmentGeometry? alignment;

  const TitleMedium({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.alignment,
  });
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 38,
          fontWeight: FontWeight.w500,
          color: color,
          height: 1.0,
        ),
      ),
    );
  }
}

class TitleSmall extends StatelessWidget {
  final String text;
  final Color color;
  final AlignmentGeometry? alignment;

  const TitleSmall({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.alignment,
  });
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24.0,
          color: color,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class LabelLarge extends StatelessWidget {
  final String text;
  final Color color;
  final AlignmentGeometry? alignment;

  const LabelLarge({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.alignment,
  });
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.centerLeft,
      child: Align(
        alignment: alignment ?? Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: color,
          ),
        ),
      ),
    );
  }
}

class LabelSmall extends StatelessWidget {
  final String text;
  final Color color;
  final AlignmentGeometry? alignment;

  const LabelSmall({
    super.key,
    required this.text,
    this.color = const Color.fromARGB(255, 221, 221, 221),
    this.alignment,
  });
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: color,
        ),
      ),
    );
  }
}

class DisplayMedium extends StatelessWidget {
  final String text;
  final AlignmentGeometry? alignment;
  final Color color;

  const DisplayMedium({
    super.key,
    required this.text,
    this.alignment,
    this.color = Colors.white,
  });
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: color,
        ),
      ),
    );
  }
}

class DisplaySmall extends StatelessWidget {
  final String text;
  final AlignmentGeometry? alignment;
  final Color color;

  const DisplaySmall({
    super.key,
    required this.text,
    this.alignment,
    this.color = Colors.white,
  });
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: color,
        ),
      ),
    );
  }
}

class ErrorText extends StatelessWidget {
  final String text;

  const ErrorText({
    super.key,
    required this.text,
  });
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

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;

  const CustomText({
    super.key,
    required this.text,
    this.size,
    this.color = Colors.white,
    this.weight,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}

class CustomColors {
  static const Color dim = Color(0xff171717);
}
