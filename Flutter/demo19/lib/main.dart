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
          title:new Text('SizedBox组件'),
        ),
        body: Center(
          // 指定宽高,子元素继承宽高
          child: SizedBox(
            width: 200,
            height: 200,
            // 子元素无法修改width和height
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
              child: Container(
                width: 20,
                height: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
