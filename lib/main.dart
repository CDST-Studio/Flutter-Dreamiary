import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'UserPage.dart';
import 'CommunityPage.dart';

void main() async{
  // Firebase initialize
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    title: "Dreamiary",
    theme: ThemeData(
      primaryColor: Colors.deepOrange,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: AnimatedSplashScreen(
      splash: Image.asset("Assets/Image/CDST.png"),
      nextScreen: DreamiaryHome(),
      splashTransition: SplashTransition.fadeTransition,
      duration: 2000,
    ),
  ));
}

class LoginHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("매인 홈"),
          centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
              },
              child: Text("공유몽 게시판"),
            )
          ],
        ),
      ),
    );
  }
}