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
        body: DemoPage(),
      ),
    );
  }
}

class DemoPage extends StatefulWidget{
  DemoPageState createState()=>DemoPageState();
}

class DemoPageState extends State<DemoPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child:GestureDetector(
        onTap: (){
          final snackBar = new SnackBar(
            content: Text('这是一个SnackBar'),
            backgroundColor: Colors.green,
            action:SnackBarAction(
              label: '撤销',
              onPressed: (){

              },
            ),
            duration: Duration(seconds: 1),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Text('显示屏幕底部消息'),
      ),
    );
  }
}