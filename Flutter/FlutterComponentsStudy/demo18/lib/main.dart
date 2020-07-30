import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title:new Text('SnackBar组件'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RotatedBox(
                child: Text('ABCDE',style: TextStyle(color: Colors.blueGrey),),
                // 旋转多少次90度
                quarterTurns: 1,
              ),
              RotatedBox(
                child: Text('ABCDE',style: TextStyle(color: Colors.blueGrey),),
                // 旋转多少次90度
                quarterTurns: 2,
              ),
              RotatedBox(
                child: Text('ABCDE',style: TextStyle(color: Colors.blueGrey),),
                // 旋转多少次90度
                quarterTurns: 3,
              ), RotatedBox(
                child: Text('ABCDE',style: TextStyle(color: Colors.blueGrey),),
                // 旋转多少次90度
                quarterTurns: 4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
