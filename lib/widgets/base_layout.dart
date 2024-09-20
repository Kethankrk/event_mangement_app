import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  final Widget child;
  const BaseLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(40.0),
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xff171717)),
        child: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
