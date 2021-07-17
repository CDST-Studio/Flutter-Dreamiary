import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

// Test userName = Khan
DatabaseReference ref = new FirebaseDatabase().reference();

class ReadDiary extends StatefulWidget {
  @override
  _ReadDiaryState createState() => _ReadDiaryState();
}

class _ReadDiaryState extends State<ReadDiary> {
  final _titleCtl = TextEditingController();
  final _contentCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.child("Khan").reference().once().then((DataSnapshot data) {
      for(var diaryTitle in data.value.keys) {

      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("꿈 다시보기"),
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
                enabled: false,

                decoration: InputDecoration(

                ),
              ),
            ),

            Expanded(child: Container(
              margin: const EdgeInsets.only(left: 45, right: 45),
              child: TextField(
                keyboardType: TextInputType.multiline,
                controller: _contentCtl,
                maxLines: null,
                enabled: false,

                decoration: InputDecoration(

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
              ],
            ),
          ],
        ),
      ),
    );
  }
}