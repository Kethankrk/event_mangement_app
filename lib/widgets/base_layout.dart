import 'package:flutter/material.dart';
import 'package:planit/widgets/bottom_navbar.dart';

class BaseLayout extends StatelessWidget {
  final Widget child;
  final bool navbar;
  const BaseLayout({super.key, required this.child, this.navbar = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navbar ? const BottomNavbar() : null,
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
