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
        body:Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 100.0,
                height: 100,
                child: FittedBox(
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.green,
                      child: Text(
                        'BoxFit.fill',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                ),
              ),
          Container(
            width: 100.0,
            height: 100,
            child: FittedBox(
                fit: BoxFit.contain,
                alignment: Alignment.center,
                child: Container(
                  color: Colors.green,
                  child: Text(
                    'BoxFit.contain',
                    style: TextStyle(color: Colors.white),
                  ),
                )
            )
          ),Container(
                  width: 100.0,
                  height: 100,
                  child: FittedBox(
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      child: Container(
                        color: Colors.green,
                        child: Text(
                          'BoxFit.cover22',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                  )
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: 100.0,
                  height: 100,
                  child: FittedBox(
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.center,
                      child: Container(
                        color: Colors.green,
                        child: Text(
                          'BoxFit.fitHeight',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
