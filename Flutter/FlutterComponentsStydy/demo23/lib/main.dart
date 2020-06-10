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
  var currentValue=0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Checkbox(
          activeColor: Colors.red,
          value: currentValue==0,
          // 如果tristate=true,则value的值可以为true,false,null
          tristate: false,
          onChanged: (bool check){
            if(check){
              setState(() {
                currentValue=0;
              });
            }
          },
        ),
        Checkbox(
          activeColor: Colors.red,
          value: currentValue==1,
          onChanged: (bool check){
            if(check){
              setState(() {
                currentValue=1;
              });
            }
          },
        )
      ],
    );
  }
}