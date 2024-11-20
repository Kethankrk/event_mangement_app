import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:planit/providers/navbar_provider.dart';
import 'package:provider/provider.dart';

class BottomNavbar extends StatelessWidget {
  BottomNavbar({super.key});

  final List<String> _navRoutes = ["/", "/my-events", "/eventhub", "/login"];

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
      index: context.watch<NavbarProvider>().acitveIndex,
      onChange: (index) => {
        context.read<NavbarProvider>().setActiveIndex(index),
        context.go(_navRoutes[index]),
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
