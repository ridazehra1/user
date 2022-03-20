import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class facebbok extends StatelessWidget {
  const facebbok({Key key}) : super(key: key);
  Future<UserCredential> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken.token);
      var userdt = FacebookAuth.instance.getUserData();
      var res = jsonDecode(userdt.toString());
      print("poka poor ${res}");

      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } catch (e) {
      print(e.toString());
    }
    // Trigger the sign-in flow
  }

  Future<UserCredential> logoutWithFacebook() async {
    try {
      await FacebookAuth.instance.logOut();
      print("logout");
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  signInWithFacebook();
                },
                child: Text("Facebook login")),
            ElevatedButton(
                onPressed: () {
                  logoutWithFacebook();
                },
                child: Text("Facebook logOut")),
          ],
        ),
      ),
    );
  }
}
