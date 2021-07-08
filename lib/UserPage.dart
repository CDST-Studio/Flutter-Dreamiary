import 'package:dreamiary/WriteDiary.dart';
import 'package:flutter/material.dart';

class DreamiaryHome extends StatelessWidget {
  List<String> test = ["TEST1", "TEST2", "TEST3", "TEST4", "TEST5", "TEST6"];
  List<String> menu = ["일기 작성", "그림일기 작성", "일기 목록", "커뮤니티", "설정"];

  @override
  Widget build(BuildContext context) {
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
                  itemCount: test.length, // ONLY effected on itemBuilder

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
                            child: Text("일기 ${index + 1}. ${test[index]}")),
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
                  itemCount: menu.length,
                  shrinkWrap: true,

                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: MediaQuery.of(context).size.width / menu.length,
                      child: ButtonTheme(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            switch(menu[index]) {
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
                            "${menu[index]}",
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
