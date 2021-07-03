import 'package:flutter/material.dart';

class DreamiaryHome extends StatelessWidget {
  List<String> test = ["TEST1", "TEST2", "TEST3", "TEST4", "TEST5", "TEST6"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("꿈일기"),
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            color: Colors.amber,

            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: test.length, // ONLY effected on itemBuilder

              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(8),
                  width: 90,
                  height: 100,

                  color: Colors.amberAccent,

                  child: Center(
                      child: Text("일기 ${index+1}. ${test[index]}")
                  ),
                );
              },

              separatorBuilder: (BuildContext context, int index) {
                if (index == 0) return SizedBox.shrink(); // Empty widget
                return const Divider();
              },
            ),
          )
        ],
      )
    );
  }
}