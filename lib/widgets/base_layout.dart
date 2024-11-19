import 'package:flutter/material.dart';
import 'package:planit/utils/theme.dart';
import 'package:planit/widgets/bottom_navbar.dart';

class BaseLayout extends StatelessWidget {
  final Widget child;
  final bool navbar;
  final double padding;
  final AppBar? appbar;
  final Color backgroundColor;
  const BaseLayout({
    super.key,
    required this.child,
    this.navbar = true,
    this.padding = 40.0,
    this.appbar,
    this.backgroundColor = CustomColors.dim,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navbar ? BottomNavbar() : null,
      appBar: appbar,
      backgroundColor: Colors.black,
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(padding),
        width: double.infinity,
        decoration: BoxDecoration(color: backgroundColor),
        child: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
