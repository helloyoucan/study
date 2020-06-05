import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BorromAppBar',
      home:Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // FAB按钮
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
            onPressed: null
        ),
        bottomNavigationBar: BottomAppBar(
          // floatingActionButton和BottomAppBar之间的距离
          notchMargin: 10.0,
          color: Colors.pink,
          child: Row(
            // 设置大小
            mainAxisSize: MainAxisSize.max,
            //对齐方式
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(icon: Icon(Icons.menu),onPressed: (){}),
              IconButton(icon: Icon(Icons.menu),onPressed: (){}),
              IconButton(icon: Icon(Icons.menu),onPressed: (){}),
              IconButton(icon: Icon(Icons.search),onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}
