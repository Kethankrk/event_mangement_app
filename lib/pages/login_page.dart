import 'package:flutter/material.dart';
import 'package:planit/utils/google_auth.dart';
import 'package:planit/utils/theme.dart';
import 'package:planit/widgets/base_layout.dart';
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
    return BaseLayout(
      child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 30.0),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: TitleLarge(text: "Let's sign you in")),
              const SizedBox(height: 10.0),
              const Align(
                  alignment: Alignment.centerLeft,
                  child:
                      TitleSmall(text: "Welcome back, \nYou've been missed!")),
              const SizedBox(height: 50.0),
              CustomInputField(
                label: "Email",
                controller: userNameController,
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0),
              CustomInputField(
                label: "Password",
                controller: passwordController,
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.white,
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
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Align(
                alignment: Alignment.centerRight,
                child:
                    customTextButton(text: "Recover Password", onPress: () {}),
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: "Sign In",
                  onPressed: handleSignIn,
                ),
              ),
              SizedBox(
                height: 200,
                child: GoogleAuthOption(
                  onPress: handleGoogleSignIn,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Not a member? ",
                    style: TextStyle(color: Colors.white),
                  ),
                  customTextButton(
                    onPress: () {
                      Navigator.pushReplacementNamed(context, "/signup");
                    },
                    text: "Register now",
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
