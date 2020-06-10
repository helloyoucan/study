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
          title:new Text('Expanded组件'),
        ),
        body:Center(
          child: Row(
            children: <Widget>[
              RaisedButton(
                color: Colors.orange,
                child: Text('橙色按钮'),
                onPressed: (){},
              ),
              // 填充剩余所有空间
//              Expanded(
//                flex: 1,
//                child: RaisedButton(
//                  color: Colors.green,
//                  child: Text('绿色按钮'),
//                  onPressed: (){},
//                ),
//              ),
              // 填充剩余可能的空间
              Flexible(
                flex: 1,
                child: RaisedButton(
                  color: Colors.green,
                  child: Text('绿色按钮'),
                  onPressed: (){},
                ),
              ),
              RaisedButton(
                color: Colors.orange,
                child: Text('橙色按钮'),
                onPressed: (){},
              )
            ],
          ),
        ),
      ),
    );
  }
}