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
          title:new Text('ButtonBar'),
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
      // 末端按钮对齐容器
      child: ButtonBar(
        //对齐方式默认为末端end
        alignment: MainAxisAlignment.end,
        // child大小
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          RaisedButton(child: Text('btn1'),color: Colors.yellowAccent,onPressed: (){}),
          RaisedButton(child: Text('btn2'),color: Colors.yellowAccent,onPressed: (){}),
          RaisedButton(child: Text('btn3'),color: Colors.yellowAccent,onPressed: (){})
        ],
      ),
    );
  }
}