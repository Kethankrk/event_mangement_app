import 'package:flutter/material.dart';
import 'package:planit/widgets/bottom_navbar.dart';

class BaseLayout extends StatelessWidget {
  final Widget child;
  final bool navbar;
  final double padding;
  const BaseLayout({
    super.key,
    required this.child,
    this.navbar = true,
    this.padding = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navbar ? const BottomNavbar() : null,
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(padding),
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xff171717)),
        child: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
