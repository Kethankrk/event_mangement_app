import 'package:flutter/material.dart';
import 'package:planit/utils/theme.dart';
import 'package:planit/widgets/base_layout.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseLayout(
        child: DisplayMedium(
      text: "Hello world",
      alignment: Alignment.center,
    ));
  }
}
