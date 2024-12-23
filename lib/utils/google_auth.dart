import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:planit/serializers/request.dart';
import 'package:planit/utils/request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleAuth {
  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? user = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await user!.authentication;
    final response = await postHelper("/api/auth/google-auth/", {
      'token': googleAuth.accessToken,
    });

    final djangoRes = DjangoResponse.fromRawJson(response.body);
    if (response.statusCode == 200) {
      final token = djangoRes.response['token'];
      final store = await SharedPreferences.getInstance();
      store.setString("token", token);
    }
  }
}
