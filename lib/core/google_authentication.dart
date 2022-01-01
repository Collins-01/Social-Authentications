import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:firebase_auth/firebase_auth.dart';

class GoogleAuthentication {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  fb.FirebaseAuth _auth = fb.FirebaseAuth.instance;

  signIn() async {
    try {
      await _googleSignIn.signOut();
      GoogleSignInAccount? _signInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication _signInAuthentication =
          await _signInAccount!.authentication;

      final fb.AuthCredential credential = fb.GoogleAuthProvider.credential(
        idToken: _signInAuthentication.idToken,
        accessToken: _signInAuthentication.accessToken,
      );
      debugPrint("SignIn Method || ${credential.signInMethod}");
      debugPrint("providerId || ${credential.providerId}");
      debugPrint("credential || ${credential.toString()}");

      fb.UserCredential result = await _auth.signInWithCredential(credential);
      print(result.toString());
    } catch (e) {
      print("Erro Occured was :: $e");
    }
  }
}
