import 'package:dreamiary/WriteDiary.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DreamiaryHome extends StatelessWidget {
  // Test userName = Khan
  DatabaseReference ref = new FirebaseDatabase().reference();

  List<String> _diaryList = [];
  List<String> _menu = ["일기 작성", "그림일기 작성", "일기 목록", "커뮤니티", "설정"];

  @override
  Widget build(BuildContext context) {
    ref.child("Khan").reference().once().then((DataSnapshot data) {
      print(data.key);
    });
    return Scaffold(
        appBar: AppBar(
          title: Text("꿈일기"),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: 150,
                color: Colors.amber,

                child: ListView.builder(
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
                            onPressed: () {},
                            color: Colors.amberAccent,
                            child: Text(
                              "${_diaryList[index]}",
                              textAlign: TextAlign.center,
                            )
                        ),
                      ),
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
                          onPressed: () {
                            switch(_menu[index]) {
                              case "일기 작성" :
                                Navigator.push(context, MaterialPageRoute(builder: (context) => WriteDiary()));
                                break;
                              case "그림일기 작성" :
                                Navigator.push(context, MaterialPageRoute(builder: (context) => WritePictureDiary()));
                                break;
                              case "일기 목록" :
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
