import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:dreamiary/WriteDiary.dart';
import 'package:dreamiary/ReadDiary.dart';

// Test userName = Khan
final DatabaseReference ref = new FirebaseDatabase().reference();

class DiaryList extends StatelessWidget {
  List<String> _diaryList = [];
  List<String> _menu = ["일기 작성", "그림일기 작성", "일기 목록", "커뮤니티", "설정"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("기록된 일기"),
        ),
        body: Container(
          child: Column(
            children: [

              Expanded(child: Container(
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
                      itemCount: _diaryList.length, // ONLY effected on itemBuilder

                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () async{
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ReadDiary(_diaryList[index])));
                                  },
                                  child: Text(
                                    "${_diaryList[index]}",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  )
                              ),

                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),

                                child: IconButton(
                                  onPressed: () {

                                  },
                                  icon: Image.asset("Assets/Button/DeleteIcon.png"),
                                  iconSize: 10,
                                ),
                              ),
                            ],
                          )
                        );
                      },
                    );
                  },
                ),
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
