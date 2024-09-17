import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:planit/utils/theme.dart';
import 'package:planit/widgets/custom_button.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(40.0),
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xff171717)),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 60),
                Text(
                  "Enter verification code from your email",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 40.0),
                Text(
                  "Please enter the code we emailed you tester@gmail.com",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 60.0),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  textStyle: const TextStyle(color: Colors.white),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10.0),
                    fieldHeight: 60,
                    fieldWidth: 60,
                    activeColor: Colors.white,
                    inactiveColor: const Color.fromARGB(255, 97, 97, 97),
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(text: "Verify", onPressed: () {}),
                ),
                const SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      print("lol");
                    },
                    child:
                        const Text("Resend email", style: hyperLinkTextTheme),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
