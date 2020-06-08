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
        body: ListView(
          padding: EdgeInsets.all(20),
          children: <Widget>[
            FlatButton.icon(onPressed: (){}, color: Colors.red, icon: Icon(Icons.print), label: Text('231',style: TextStyle(color: Colors.black),),),
            FlatButton(
              onPressed: (){},
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
                  // 根据父容器决定图标文章
                  alignment:AlignmentDirectional.topStart,
                  iconSize: 48,
                  color: Colors.red,
                  padding: EdgeInsets.only(
                    bottom: 5,
                    top: 9,
                    left: 1,
                    right: 5
                  ),
                  //点击效果
                  splashColor: Colors.white,
                  tooltip: '一个提示文本',
                  onPressed: (){

                  },
                ),
              ),
            ),
            OutlineButton(
              child: Text('OutlineButton组件'),
              color: Colors.red,
              disabledBorderColor: Colors.red,
              disabledTextColor: Colors.yellow,
              splashColor: Colors.white,
              textTheme: ButtonTextTheme.normal,
              borderSide: BorderSide(color: Colors.orange,width: 2),
              // 抗锯齿能力
              clipBehavior: Clip.antiAlias,
              padding: EdgeInsets.only(
                  bottom: 5,
                  top: 9,
                  left: 1,
                  right: 5
              ),
              shape: RoundedRectangleBorder(
                side: new BorderSide(
                  width: 2.0,
                  color: Colors.white,
                  style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular((22)),
                  topRight: Radius.circular((2)),
                  bottomLeft: Radius.circular((3)),
                  bottomRight: Radius.circular((5)),
                ),
              ),
              onPressed: (){},
            ),
            OutlineButton.icon(
              onPressed: (){},
              color: Colors.red,
              icon: Icon(Icons.print),
              label: Text('231',style: TextStyle(color: Colors.black),),
            ),
            RawMaterialButton(
              onPressed: (){},
              child: Text('RawMaterialButton'),
              textStyle: TextStyle(color: Colors.red),
              highlightColor: Colors.red,
              splashColor: Colors.blue,
              // 抗锯齿能力
              clipBehavior: Clip.antiAlias,
              padding:  EdgeInsets.only(
                  bottom: 5,
                  top: 9,
                  left: 1,
                  right: 5
              ),
            )
          ],
        ),
      ),
    );
  }
}
