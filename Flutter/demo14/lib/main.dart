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
          title:new Text('ConstrainedBox组件'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 250.0,
                height: 80,
                child: Text(
                  'width>maxWidth',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
              ),
              SizedBox(
                height: 20,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 100.0,
                  minHeight: 20.0,
                  maxHeight: 60.0,
                  maxWidth: 200.0
                ),
                child: Container(
                  width: 250.0,
                  height: 80,
                  child: Text(
                    'width>maxWidth',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                    minWidth: 100.0,
                    minHeight: 20.0,
                    maxHeight: 60.0,
                    maxWidth: 200.0
                ),
                child: Container(
                  width: 20.0,
                  height: 80,
                  child: Text(
                    'width>maxWidth',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
