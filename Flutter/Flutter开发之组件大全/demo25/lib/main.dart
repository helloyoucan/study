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
          title:new Text('Dialog组件'),
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
  // 打开AboutDialog
  void showAboutDialog(BuildContext context){
    showDialog(
        context: context,
      //构造器
      builder: (_)=> new AboutDialog(
        applicationName: 'Andrios Studio',
        applicationIcon: Icon(Icons.apps),
        applicationVersion: 'v2.2.1',
        children: <Widget>[
          Text('这是一个大肥妹')
        ],
      )
    );
  }
  // 打开AboutDialog
  void showSimpleDialog(BuildContext context){
    showDialog<Null>(
        context: context,
        builder: (BuildContext context)=> new SimpleDialog(
          title: Text('选择'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('选项1'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            SimpleDialogOption(
              child: Text('选项2'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        )
    );
  }
  // 打开AboutDialog
  void showAlertDialog(BuildContext context){
    showDialog<void>(
        context: context,
        builder: (BuildContext context)=> new AlertDialog(
        title: Text('标题'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
                Text('信息。。。。。。'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return Center(
//      child: Dialog(
//        child: Container(
//          height: 200.0,
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: <Widget>[
//              Text('这是一个Dialog'),
//              RaisedButton(
//                child: Text('取消'),
//                onPressed: (){
//                  Navigator.of(context).pop();
//                },
//              )
//            ],
//          ),
//        ),
//      ),
//    );
  return Center(
    child: RaisedButton(
      child: Text('点击打开Dialog'),
      onPressed: (){
//        showAboutDialog(context);
//      showSimpleDialog(context);
        showAlertDialog(context);
      },
    ),
  );
  }
}