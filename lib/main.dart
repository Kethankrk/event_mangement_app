import 'package:flutter/material.dart';
import 'package:planit/pages/homepage.dart';
import 'package:planit/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlanIt',
      initialRoute: '/login',
      routes: {
        '/': (context) => const Homepage(),
        '/login': (context) => const SignupPage()
      },
    );
  }
}
