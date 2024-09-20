import 'package:flutter/material.dart';
import 'package:planit/pages/email_verification_page.dart';
import 'package:planit/pages/event_create_page.dart';
import 'package:planit/pages/home_page.dart';
import 'package:planit/pages/login_page.dart';
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
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/verify': (context) => const EmailVerificationPage(),
        '/event-create': (context) => const EventCreatePage()
      },
    );
  }
}
