import 'package:flutter/material.dart';
import 'package:planit/widgets/custom_button.dart';
import 'package:planit/widgets/custom_input.dart';
import 'package:planit/widgets/oauth_options.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cfmPasswordController = TextEditingController();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xff171717)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 30.0),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Let's sign you up",
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
                        "Welcome to, \nPlanIt",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    CustomInputField(
                      label: "Email",
                      controller: emailController,
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
                          _showPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    CustomInputField(
                      label: "Confirm Password",
                      controller: cfmPasswordController,
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
                          _showPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
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
                        text: "Sign Up",
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: 200.0,
                      child: GoogleAuthOption(
                        onPress: () {},
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already a member?",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, "/login");
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(color: Colors.blue),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
