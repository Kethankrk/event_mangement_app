import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class BottomNavbar extends StatelessWidget {
  BottomNavbar({super.key});

  final List<String> _navRoutes = ["/", "/my-events", "/call-help", "/login"];

  final List<FBottomNavigationBarItem> _navItems = [
    FBottomNavigationBarItem(
      icon: FIcon(FAssets.icons.house),
      label: const Text('Home'),
    ),
    FBottomNavigationBarItem(
      icon: FIcon(FAssets.icons.notebook),
      label: const Text('Events'),
    ),
    FBottomNavigationBarItem(
      icon: FIcon(FAssets.icons.inbox),
      label: const Text('EventHub'),
    ),
    FBottomNavigationBarItem(
      icon: FIcon(FAssets.icons.user),
      label: const Text('Profile'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FBottomNavigationBar(
      index: 0,
      onChange: (index) => {
        Navigator.pushReplacementNamed(context, _navRoutes[index]),
      },
      children: _navItems,
    );
  }
}

class NavButton {
  final IconData icon;
  final String name;
  final String path;
  const NavButton({required this.icon, required this.name, required this.path});
}
