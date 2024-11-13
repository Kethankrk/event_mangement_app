import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  Future<String?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? user = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth = await user!.authentication;
      return googleAuth.accessToken;
    } catch (e) {
      print("Unable to sigin");
      Fluttertoast.showToast(
        msg: "Failed to signin with google",
        backgroundColor: Colors.redAccent,
      );
    }
  }
}
