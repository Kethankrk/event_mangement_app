import 'package:flutter/material.dart';
import 'package:planit/utils/google_auth.dart';
import 'package:planit/widgets/custom_button.dart';
import 'package:planit/widgets/custom_input.dart';
import 'package:planit/widgets/oauth_options.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late TextEditingController userNameController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  bool _showPassword = false;

  void handleSignIn() {
    Navigator.pushNamed(context, '/');
  }

  void handleGoogleSignIn() {
    GoogleAuth().signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xff171717)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 50.0),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Let's sign you in",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 42.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome back, \nYou've been missed!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                ),
                const SizedBox(height: 50.0),
                CustomInputField(
                  label: "Phone, email or username",
                  controller: userNameController,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomInputField(
                  label: "Password",
                  controller: passwordController,
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                  obstruct: !_showPassword,
                  suffixIconButton: IconButton(
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    icon: Icon(
                      _showPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Recover Password",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: "Sign In",
                    onPressed: handleSignIn,
                  ),
                ),
                const SizedBox(height: 60.0),
                GoogleAuthOption(
                  onPress: handleGoogleSignIn,
                ),
                const SizedBox(height: 40.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
