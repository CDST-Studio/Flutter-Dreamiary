import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CommunityPage.dart';

void main() {
  runApp(MaterialApp(
    title: "Dreamiary App",
    theme: ThemeData(
      primarySwatch: Colors.amber,
      visualDensity:  VisualDensity.adaptivePlatformDensity,
    ),
    home: MainHome(),
  ));
}

class MainHome extends StatelessWidget {
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