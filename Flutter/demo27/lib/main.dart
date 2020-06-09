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
          title:new Text('GridTile组件'),
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
      child: Container(
        height: 500,
        color: Colors.grey,
        child: GridView.count(
            crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          // 水平空隙
          crossAxisSpacing: 4.0,
          // 内边距
          padding: EdgeInsets.all(4),
          children: <Widget>[
            // 风格标题基本用法
            GridTile(
              header: Text('GridTile'),
              child: Image.network('https://dss3.baidu.com/-rVXeDTa2gU2pMbgoY3K/it/u=102460542,603007020&fm=202&mola=new&crop=v1'),
              footer: Text('GridT footer'),
            ),
            Image.network('https://dss3.baidu.com/-rVXeDTa2gU2pMbgoY3K/it/u=102460542,603007020&fm=202&mola=new&crop=v1'),
            Image.network('https://dss3.baidu.com/-rVXeDTa2gU2pMbgoY3K/it/u=102460542,603007020&fm=202&mola=new&crop=v1'),
            GridTile(
              // GridTile按钮
              header: GridTileBar(
                title: Text('GridTileBar',style: TextStyle(color: Colors.red),),
                leading: Icon(Icons.print),
                subtitle: Text('子标题'),
              ),
              child: Image.network('https://dss3.baidu.com/-rVXeDTa2gU2pMbgoY3K/it/u=102460542,603007020&fm=202&mola=new&crop=v1'),
              footer: GridTileBar(
                title: Text('footer-GridTileBar',style: TextStyle(color: Colors.red),),
                leading: Icon(Icons.print),
                subtitle: Text('子标题'),
              ),
            ),
            Image.network('https://dss3.baidu.com/-rVXeDTa2gU2pMbgoY3K/it/u=102460542,603007020&fm=202&mola=new&crop=v1'),
            // 网格效果
            GridPaper(
              color: Colors.red,
              child: Image.network('https://dss3.baidu.com/-rVXeDTa2gU2pMbgoY3K/it/u=102460542,603007020&fm=202&mola=new&crop=v1'),
            ),
            Image.network('https://dss3.baidu.com/-rVXeDTa2gU2pMbgoY3K/it/u=102460542,603007020&fm=202&mola=new&crop=v1'),
          ],
        ),
      ),
    );
  }
}