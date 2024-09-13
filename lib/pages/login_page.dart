import 'package:flutter/material.dart';
import 'package:planit/utils/google_auth.dart';
import 'package:planit/widgets/custom_button.dart';
import 'package:planit/widgets/custom_input.dart';
import 'package:planit/widgets/oauth_options.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                const SizedBox(height: 30.0),
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
                  label: "Email",
                  controller: userNameController,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 97, 97, 97),
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomInputField(
                  label: "Password",
                  controller: passwordController,
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color.fromARGB(255, 97, 97, 97),
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
                GoogleAuthOption(
                  onPress: handleGoogleSignIn,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Not a member?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/signup");
                        },
                        child: const Text(
                          "Register now",
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
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
