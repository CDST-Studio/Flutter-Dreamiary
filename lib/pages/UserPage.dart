import 'package:dreamiary/WriteDiary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:dreamiary/WriteDiary.dart';
import 'package:dreamiary/ReadDiary.dart';
import 'package:dreamiary/DiaryList.dart';
import 'package:dreamiary/pages/LoginPage.dart';

// Test userName = Khan
final DatabaseReference ref = new FirebaseDatabase().reference();

class DreamiaryHome extends StatelessWidget {
  // Test userName = Khan
  DatabaseReference ref = new FirebaseDatabase().reference();
  List<String> _diaryList = [];
  List<String> _menu = ["일기 작성", "그림일기 작성", "일기 목록", "커뮤니티", "설정"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return LoginPage();
              } else {
                var currentUser = FirebaseAuth.instance.currentUser;
                return Scaffold(
                    appBar: AppBar(
                      title: Text("꿈일기"),
                      actions: [
                        IconButton(
                            icon: Icon(Icons.account_circle_rounded),
                            onPressed: (){
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context){
                                    return AlertDialog(
                                      title: Text('Login check'),
                                      content:  SingleChildScrollView(
                                        child: ListBody (
                                        children: [
                                          Text('name: ${currentUser!.displayName} '),
                                      ],
                                    ),
                                    ),
                                      actions: [
                                        FlatButton(
                                            child: Text('Logout'),
                                            onPressed: FirebaseAuth.instance.signOut),
                                        FlatButton(
                                            child: Text('ok'),
                                            onPressed: Navigator.of(context).pop)
                                      ],
                                    );
                                  }
                              );
                            }
                        )
                      ]
                    ),
                    body: Container(
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            color: Colors.amber,
                            child: StreamBuilder(
                              stream: ref.child("Khan").reference().onValue,
                              builder: (context, AsyncSnapshot<Event> snap) {
                                try {
                                  for(var diaryTitle in snap.data!.snapshot.value.keys) {
                                    if (!_diaryList.contains(diaryTitle)) _diaryList.add(diaryTitle);
                                  }
                                }catch(e) {
                                  print(e);
                                }
                            return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _diaryList.length, // ONLY effected on itemBuilder
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.all(8),

                          child: ButtonTheme(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),

                            child: FlatButton(
                                onPressed: () async{
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReadDiary(_diaryList[index])));
                                },
                                color: Colors.amberAccent,
                                child: Text(
                                  "${_diaryList[index]}",
                                  textAlign: TextAlign.center,
                                )
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              Expanded(child: Container(

              )),

              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.amber,

                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: _menu.length,
                  shrinkWrap: true,

                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: MediaQuery.of(context).size.width / _menu.length,
                      child: ButtonTheme(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: FlatButton(
                          onPressed: () async{
                            switch(_menu[index]) {
                              case "일기 작성" :
                                Navigator.push(context, MaterialPageRoute(builder: (context) => WriteDiary()));
                                break;
                              case "그림일기 작성" :
                                Navigator.push(context, MaterialPageRoute(builder: (context) => WritePictureDiary()));
                                break;
                              case "일기 목록" :
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DiaryList()));
                                break;
                              case "커뮤니티" :
                                break;
                              case "설정" :
                                break;
                            }
                          },
                          color: Colors.amber,
                          child: Text(
                            "${_menu[index]}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  },

                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: VerticalDivider(
                        width: 2,
                        thickness: 1.5,
                        color: Colors.black,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
      );
     }
    }
   ));
  }
}


