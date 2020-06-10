import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SliverAppBar组件',
      home: new Scaffold(
        appBar: new AppBar(
          title:new Text('SliverAppBar组件'),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
                // 是否预留高度
                primary:true,
                // 标题前面显示的一个控件
                leading: Icon(Icons.save),
                //操作按钮
                actions: <Widget>[
                  Icon(Icons.home),
                  Icon(Icons.ac_unit),
                ],
                //设置阴影值
                elevation: 10.0,
                // 是否固定在顶部
                pinned: true,
                // 可扩展区域高度
                expandedHeight: 200.0,
                // 与float结合使用
                snap: false,
                // 是否随着滑动隐藏标题
                floating: false,
                // 扩展区域
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    '我是大河',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  background: Image.network(
                    'https://pic2.zhimg.com/80/v2-5ae6449e980c3bc22e91dc705bdcc0ae_720w.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ];
          },
          body: Center(
            child: Text(
                '拖到试试'
            ),
          ),
        ),
      ),
    );
  }
}
