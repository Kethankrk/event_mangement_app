import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? user = await GoogleSignIn().signIn();
      final email = user!.email;
      final profile = user.photoUrl;

      print("Email: $email, profiel pic: $profile");
    } catch (e) {
      print("Unable to sigin");
      Fluttertoast.showToast(
        msg: "Failed to signin with google",
        backgroundColor: Colors.redAccent,
      );
    }
  }
}
