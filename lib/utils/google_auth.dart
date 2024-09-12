import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  signInWithGoogle() async {
    final GoogleSignInAccount? user = await GoogleSignIn().signIn();

    final email = user!.email;

    print("Access token $email");
  }
}
