import 'package:flutter/material.dart';
import 'package:planit/widgets/base_layout.dart';
import 'package:planit/widgets/homepage/appbar.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appbar: hompageAppBar,
      child: const Placeholder(),
    );
  }
}
