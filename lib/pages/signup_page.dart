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
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cfmPasswordController = TextEditingController();
  bool _showPassword = false;

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
                  child: TitleLarge(text: "Let's sign you up")),
              const SizedBox(height: 10.0),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: TitleSmall(text: "Welcome to, \nPlanIt")),
              const SizedBox(height: 50.0),
              CustomInputField(
                label: "Username",
                controller: usernameController,
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0),
              CustomInputField(
                label: "Email",
                controller: emailController,
                prefixIcon: const Icon(
                  Icons.email_rounded,
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
              CustomInputField(
                label: "Confirm Password",
                controller: cfmPasswordController,
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
              const SizedBox(height: 40.0),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: "Sign Up",
                  onPressed: _handleSignup,
                ),
              ),
              SizedBox(
                height: 200.0,
                child: GoogleAuthOption(
                  onPress: () {
                    _handleGoogleAuth();
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already a member? ",
                    style: TextStyle(color: Colors.white),
                  ),
                  customTextButton(
                    onPress: () {
                      context.go("/login");
                    },
                    text: "Login",
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleGoogleAuth() async {
    try {
      await GoogleAuth().signInWithGoogle(context);
      if(!mounted) return;
      context.go("/");
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Unkown error",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.red
      );
    }
  }

  void _handleSignup() async {
    if (passwordController.text != cfmPasswordController.text) {
      Fluttertoast.showToast(
        msg: "Passwords do not match",
        toastLength: Toast.LENGTH_LONG,
      );
      return;
    }

    try {
      final response = await postHelper("/api/auth/signup/", {
        'email': emailController.text,
        'name': usernameController.text,
        'password': passwordController.text,
      });

      final res = DjangoResponse.fromRawJson(response.body);

      if (!mounted) return;

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Signup successful",
          toastLength: Toast.LENGTH_LONG,
        );
        return context.go("/email-verify");
      }
      if (res.errorCode == ErrorTypes.emailAlreadyExists.code) {
        Fluttertoast.showToast(
          msg: "Email already exists",
          toastLength: Toast.LENGTH_LONG,
        );
        return context.go("/login");
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Unkown error",
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
