import 'package:flutter/material.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Align 组件',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Align组件2'),
        ),
        body: Container(
          color: Colors.red,
          child: Align(
            //对齐方式
//            alignment: Alignment.bottomCenter,
            // 对齐方式使用y,来表示，范围是-1.0~1.0
            alignment: Alignment(0.0,0.0),
            // 宽高填充的系数（父容器不确定宽高的情况下使用）
            // 父容器的size是子容器的倍数
            widthFactor: 2.0,
            heightFactor: 3.0,
            child: Container(
              color: Colors.green,
              width: 100.0,
              height: 200.0,
              child: Text(
                'bootomCenter',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}