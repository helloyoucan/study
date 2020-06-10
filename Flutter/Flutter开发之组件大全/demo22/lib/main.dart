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
      child:Card(
        color: Colors.green,
        elevation: 30,
        margin: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.shop_two),
              title: Text('这是一个大毁灭'),
              subtitle: Text('这是一个副标题'),
              contentPadding: EdgeInsets.all(20),
            ),
            ButtonTheme(
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                      onPressed: (){},
                      child: Text('buy')
                  ),
                  FlatButton(
                      onPressed: (){},
                      child: Text('cancel')
                  )

                ],
              ),
            )
          ],
        ),
      )
    );
  }
}