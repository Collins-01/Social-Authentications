import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthentication {
  FacebookAuth _facebookAuth = FacebookAuth.instance;

  Future<Map<String, dynamic>?> login() async {
    try {
      await _facebookAuth.logOut();
      var response =
          await _facebookAuth.login(permissions: ['public_profile', 'email']);

      if (response.status == LoginStatus.success) {
        print("LoginStatus | messages : Success");
        var userData = await _facebookAuth.getUserData();
        print("User Data ||  ${userData.toString()}");
        return userData;
      } else {
        print("Response is | ${response.status}");
        return null;
      }
    } catch (e) {
      print("Error Signin In : $e");
      return null;
    }
  }

  logOut() async {
    try {
      await _facebookAuth.logOut();
    } catch (e) {}
  }
}
