import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

/**
 * 차후 프래그먼트 형식으로 바꿀 때 참고할 사이트
 * https://stackoverflow.com/questions/50640182/replace-widgets-like-fragments-in-flutter
 * https://theunclesoon.blogspot.com/2020/06/flutter-route.html
 **/

// Firebase, realtime Database, Test userName is Khan
final fb = FirebaseDatabase.instance;
final ref = fb.reference();

class WriteDiary extends StatefulWidget{
  @override
  _WriteDiaryState createState() => _WriteDiaryState();
}

class WritePictureDiary extends StatefulWidget{
  @override
  _WritePictureDiaryState createState() => _WritePictureDiaryState();
}

class _WriteDiaryState extends State<WriteDiary> {
  final _titleCtl = TextEditingController();
  final _contentCtl = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // 발급한 키를 Scaffold에 등록
      appBar: AppBar(
        title: Text("일기 작성"),
      ),

      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("Assets/Thema/DiaryDefaultThema.png"),
              fit: BoxFit.fill,
            ),
        ),

        child: Column(
          children: [
            Container (
              margin: const EdgeInsets.fromLTRB(125, 10, 125, 25),
              child: TextField(
                controller: _titleCtl,
                textAlign: TextAlign.center,

                decoration: InputDecoration(
                    hintText: "제목",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
            ),

            Expanded(child: Container(
              margin: const EdgeInsets.only(left: 45, right: 45),
              child: TextField(
                controller: _contentCtl,
                keyboardType: TextInputType.multiline,
                maxLines: null,

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            )),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  
                  child: FloatingActionButton(
                    heroTag: "backBtn",
                    child: Text(
                      "돌아가기",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                Container(
                  margin: const EdgeInsets.all(8),

                  child: FloatingActionButton(
                    heroTag: "saveBtn",
                    child: Text(
                      "+",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),

                    onPressed: () async {
                      final filename = _titleCtl.text;
                      ref.child("Khan").once().then((DataSnapshot snap) {
                        if (!snap.value.keys.contains(filename)) {
                          ref.child("Khan").update({_titleCtl.text : _contentCtl.text});
                          Navigator.pop(context);
                        }else {
                          _scaffoldKey.currentState!.showSnackBar(
                            SnackBar(
                              content: Text(
                                '이미 존재하는 일기의 제목입니다.',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),

                              backgroundColor: Colors.teal,
                              duration: Duration(milliseconds: 1000),
                            ),
                          );
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _WritePictureDiaryState extends State<WritePictureDiary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("일기 작성"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Assets/Thema/DiaryDefaultThema.png"),
            fit: BoxFit.fill,
          ),
        ),

        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(50, 25, 50, 10),

              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 200,
                ),
              ),

              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                )
              ),
            ),

            Container (
              margin: const EdgeInsets.fromLTRB(125, 10, 125, 25),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: "제목",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
            ),

            Expanded(child: Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            )),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Container(
                  margin: const EdgeInsets.all(8),

                  child: FloatingActionButton(
                    heroTag: "backBtn",
                    child: Text(
                      "돌아가기",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                Container(
                  margin: const EdgeInsets.all(8),

                  child: FloatingActionButton(
                    heroTag: "saveBtn",
                    child: Icon(Icons.plus_one),

                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}