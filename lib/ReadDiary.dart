import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

// Test userName = Khan
final DatabaseReference ref = new FirebaseDatabase().reference();
final String diaryTitle = "";

class ReadDiary extends StatefulWidget {
  // @required == 무조건 변수를 받아야한다.
  ReadDiary(@required diaryTitle);

  @override
  _ReadDiaryState createState() => _ReadDiaryState();
}

class _ReadDiaryState extends State<ReadDiary> {
  final _titleCtl = TextEditingController();
  final _contentCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
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

        child: StreamBuilder(
          stream: ref.child("Khan").reference().onValue,
          builder: (context, AsyncSnapshot<Event> snap) {
            print(snap.data!.snapshot.value);
            _titleCtl.text = snap.data!.snapshot.value;
            _contentCtl.text = diaryTitle;

            return Column(
              children: [
                Container (
                  margin: const EdgeInsets.fromLTRB(125, 10, 125, 25),
                  child: TextField(
                    controller: _titleCtl,
                    textAlign: TextAlign.center,
                    enabled: false,
                  ),
                ),

                Expanded(child: Container(
                  margin: const EdgeInsets.only(left: 45, right: 45),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    controller: _contentCtl,
                    maxLines: null,
                    enabled: false,
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
            );
          },
        )
      ),
    );
  }
}