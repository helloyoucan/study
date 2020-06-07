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
        body: Container(
          color: Colors.green,
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(6),
          // 溢出容器
          child: OverflowBox(
            // 对齐方式
            alignment: Alignment.topLeft,
            maxWidth: 300,
            maxHeight: 500,
            child: Container(
              color: Colors.blueGrey,
              width: 500,
              height: 500,
            ),
          ),
        ),
      ),
    );
  }
}
