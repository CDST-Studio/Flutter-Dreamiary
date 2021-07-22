import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if(result.status == LoginStatus.success){
      // Create a credential from the access token
      final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container (
        decoration: BoxDecoration(
          image: DecorationImage(
            fit:BoxFit.cover, image: AssetImage('Assets/Image/LoginImage.png'))),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Form(
                child:ListView(
                  children: [
                    SizedBox(
                      height:80
                    ),
                    Text('Dreamiary',
                        style:  TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                    ),
                    SizedBox(
                        height:300
                    ),
                    SizedBox(
                        width: 120,
                        height: 50,
                        child: FlatButton(
                          child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage (
                              image: AssetImage("Assets/Image/Google_Login.png")
                            ))),
                          onPressed: signInWithGoogle),
                    ),
                    SizedBox(
                        height:30
                    ),
                    SizedBox(
                      width: 120,
                      height: 50,
                      child: FlatButton(
                          child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage (
                                      image: AssetImage("Assets/Image/facebook_Login.png")
                                  ))),
                          onPressed: signInWithFacebook
                      ),
                    ),
                  ],
                )
              )
            )
          )
      ),
    );
  }
}