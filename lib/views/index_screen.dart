import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_auth/core/facebook_authentication.dart';
import 'package:social_auth/core/google_authentication.dart';
import 'package:social_auth/views/home_view.dart';

class IndexView extends StatefulWidget {
  @override
  _IndexViewState createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {
  FacebookAuthentication _facebookAuthentication = FacebookAuthentication();
  GoogleAuthentication _googleAuthentication = GoogleAuthentication();
  @override
  void initState() {
    // _init();
    super.initState();
  }

  _init() async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                var data = await _facebookAuthentication.login();
                if (data != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => HomeView(
                      method: "Facebook",
                      userData: data,
                    ),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("An Error Occured"),
                    ),
                  );
                }
              },
              child: Text("Login With Facebook"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await _googleAuthentication.signIn();
              },
              child: Text("Login with Google"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {},
              child: Text("Login with Twitter"),
            ),
          ),
        ],
      ),
    );
  }
}
