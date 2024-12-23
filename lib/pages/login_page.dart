import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:planit/serializers/request.dart';
import 'package:planit/utils/error_types.dart';
import 'package:planit/utils/google_auth.dart';
import 'package:planit/utils/request.dart';
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
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  bool _showPassword = false;

  Future<void> handleSignIn() async {
    try {
      final response = await postHelper("/api/auth/login/", {
        'email': emailController.text,
        'password': passwordController.text,
      });

      final res = DjangoResponse.fromRawJson(response.body);
      if (!mounted) return;

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Login successful", toastLength: Toast.LENGTH_LONG);
        context.go("/");
        return;
      }
      if (res.errorCode == ErrorTypes.emailNotVerified.code) {
        Fluttertoast.showToast(
            msg: res.message, toastLength: Toast.LENGTH_LONG);
        await context.push("/email-verify");
        return;
      }
      Fluttertoast.showToast(msg: res.message, toastLength: Toast.LENGTH_LONG);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Unkown error", toastLength: Toast.LENGTH_LONG);
    }
  }

  void handleGoogleSignIn() async {
    try {
      await GoogleAuth().signInWithGoogle(context);
      if (!mounted) return;
      context.go("/");
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Unkown error",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      padding: 40,
      navbar: false,
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
                controller: emailController,
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
                      context.go("/signup");
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
