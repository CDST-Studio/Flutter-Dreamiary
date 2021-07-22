import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'pages/UserPage.dart';
import 'pages/CommunityPage.dart';

void main() {
  runApp(MaterialApp(
    title: "Dreamiary",
    theme: ThemeData(
      primaryColor: Colors.deepOrange,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: AnimatedSplashScreen(
      splash: Image.asset("Assets/Image/CDST.png"),
      nextScreen: LoginHome(),
      splashTransition: SplashTransition.fadeTransition,
      duration: 2000,
    ),
  ));
}


class LoginHome extends StatelessWidget {
  const LoginHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
              child: Text("파이어베이스 로드 실패"));
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            home: DreamiaryHome()
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}