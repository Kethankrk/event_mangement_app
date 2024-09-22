import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:planit/utils/theme.dart';
import 'package:planit/widgets/base_layout.dart';
import 'package:planit/widgets/custom_button.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final StreamController<ErrorAnimationType> errorAnimationController =
      StreamController<ErrorAnimationType>();
  final TextEditingController otpController = TextEditingController();
  bool hasError = false;
  late String error;

  void _handleEmailVerification() {
    final String otp = otpController.text;
    if (otp.length < 4) {
      errorAnimationController.add(ErrorAnimationType.shake);
      setState(() {
        hasError = true;
        error = "Please enter all 4 digits";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      navbar: false,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 60),
            const TitleMedium(text: "Enter verification code from your email"),
            const SizedBox(height: 40.0),
            const TitleSmall(
                text: "Please enter the code we emailed you tester@gmail.com"),
            const SizedBox(height: 60.0),
            PinCodeTextField(
              appContext: context,
              length: 4,
              textStyle: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              animationType: AnimationType.scale,
              animationDuration: const Duration(milliseconds: 150),
              errorAnimationController: errorAnimationController,
              controller: otpController,
              onChanged: (v) {
                if (hasError) {
                  setState(() {
                    hasError = false;
                  });
                }
              },
              onTap: () {
                if (hasError) {
                  setState(() {
                    hasError = false;
                  });
                }
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10.0),
                fieldHeight: 60,
                fieldWidth: 60,
                activeColor: Colors.white,
                inactiveColor: const Color.fromARGB(255, 97, 97, 97),
              ),
            ),
            if (hasError) ErrorText(text: error),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                  text: "Verify", onPressed: _handleEmailVerification),
            ),
            const SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerRight,
              child: customTextButton(onPress: () {}, text: "Resend email"),
            )
          ],
        ),
      ),
    );
  }
}
