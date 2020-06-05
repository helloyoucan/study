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
          title:new Text('FlexibleSpaceBar组件（可折叠应用栏）'),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
                // 展开高度
                expandedHeight: 150.0,
                // 是否随着滑动隐藏标题
                floating: false,
                // 是否固定在顶部
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                      '可折叠的组件',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  background: Image.network(
                    'https://pic3.zhimg.com/80/v2-b364180b1726713f8f49043db24a6995_720w.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ];
          },
          body: Center(
            child: Text('向上拉'),
          ),
        ),
      ),
    );
  }
}
