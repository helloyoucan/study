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
          title:new Text('BoxDecoration组件'),
        ),
        body: Center(
          child: Container(
            height: 200,
              width: 200,
            // 添加装饰
            child: DecoratedBox(
              // 装饰定位DecorationPosition.background背景模式
              position: DecorationPosition.foreground,// 前景模式
              decoration: BoxDecoration(
                // 背景色
                color: Colors.grey,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ExactAssetImage('assets/images/1.jpg')
                ),
//                borderRadius: BorderRadius.circular((150.0)),
                border: Border.all(
                  color: Colors.red,
                  width: 6.0
                ),
                // 边框样式 circle为圆
                shape: BoxShape.rectangle
              ),
              child: Text('定位演示',style: TextStyle(fontSize: 28.0,color: Colors.green),),

            ),

          ),
        ),
      ),
    );
  }
}
