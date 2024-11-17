import 'package:flutter/material.dart';
import 'package:planit/providers/navbar_provider.dart';
import 'package:planit/utils/theme.dart';
import 'package:provider/provider.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  static const List<NavButton> navItems = [
    NavButton(icon: Icons.home, name: "Home", path: "/"),
    NavButton(icon: Icons.event, name: "My Events", path: "/my-events"),
    NavButton(icon: Icons.airplane_ticket, name: "Tickets", path: "/ticket"),
    NavButton(icon: Icons.person_2_rounded, name: "Profile", path: "/login"),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 0,
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      color: CustomColors.dim,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(navItems.length, (index) {
            return GestureDetector(
              onTap: () {
                context.read<NavbarProvider>().setActiveIndex(index);
                Navigator.pushReplacementNamed(context, navItems[index].path);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    navItems[index].icon,
                    color: index == context.watch<NavbarProvider>().acitveIndex
                        ? Colors.blue
                        : Colors.white,
                  ),
                  LabelSmall(
                    text: navItems[index].name,
                    color: index == context.watch<NavbarProvider>().acitveIndex
                        ? Colors.blue
                        : Colors.white,
                  )
                ],
              ),
            );
          })),
    );
  }
}

class NavButton {
  final IconData icon;
  final String name;
  final String path;
  const NavButton({required this.icon, required this.name, required this.path});
}
