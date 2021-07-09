import 'package:flutter/material.dart';

/**
 * 차후 프래그먼트 형식으로 바꿀 때 참고할 사이트
 * https://stackoverflow.com/questions/50640182/replace-widgets-like-fragments-in-flutter
 * https://theunclesoon.blogspot.com/2020/06/flutter-route.html
 **/

class WriteDiary extends StatefulWidget{
  @override
  _WriteDiaryState createState() => _WriteDiaryState();
}

class WritePictureDiary extends StatefulWidget{
  @override
  _WritePictureDiaryState createState() => _WritePictureDiaryState();
}

class _WriteDiaryState extends State<WriteDiary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("일기 작성"),
      ),
      body: Container(
        child: Column(
          children: [
            Container (
              margin: const EdgeInsets.fromLTRB(125, 25, 125, 25),
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

                decoration: InputDecoration(),
              ),
            )),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  
                  child: FloatingActionButton(
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

class _WritePictureDiaryState extends State<WritePictureDiary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("일기 작성"),
      ),
      body: Container(
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
              margin: const EdgeInsets.fromLTRB(125, 25, 125, 25),
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

                decoration: InputDecoration(),
              ),
            )),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Container(
                  margin: const EdgeInsets.all(8),

                  child: FloatingActionButton(
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