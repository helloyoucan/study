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
          title:new Text('FlatButton 扁平按钮,FloatingActionButton,IconButton'),
        ),
        body:Column(
          children: <Widget>[
            FlatButton.icon(onPressed: (){}, color: Colors.red, icon: Icon(Icons.print), label: Text('231',style: TextStyle(color: Colors.black),),),
            FlatButton(
              color: Colors.red,
              //colorBrightness: Brightness.dark,
              child: Text('大货里面'),
              //splashColor: Colors.blueGrey,
            ),
            FloatingActionButton(
              backgroundColor: Colors.red,
              child: const Icon(Icons.add),
              onPressed: (){},
            ),
            FloatingActionButton(
              backgroundColor: Colors.blue,
              child: const Icon(Icons.plus_one),
//              提示信息
              tooltip: '这是一个自定义按钮',
              foregroundColor: Colors.white,
              //  hero切换效果
              heroTag: null,
              // 未点击的阴影
              elevation: 8,
              // 点击时的阴影
              highlightElevation: 16,
              onPressed: (){},
              // 方形的样式
//              shape: Border.all(
//                width: 2,
//                color:Colors.white,
//                style: BorderStyle.solid
//              ),
            // 圆角方形
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 2,
                color: Colors.white,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular((22)),
                topRight: Radius.circular((2)),
                bottomLeft: Radius.circular((3)),
                bottomRight: Radius.circular((5)),
              )
            ),
              mini: false,
            ),
            FloatingActionButton.extended(
                onPressed: (){},
                icon:Icon(Icons.ac_unit) ,
                label: Text('扩展的按钮')
            ),
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.green
                ),
                child: IconButton(
                  icon: Icon(Icons.plus_one),
                  onPressed: (){

                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
