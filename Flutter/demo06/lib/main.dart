import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppBar组件',
      home: Scaffold(
        appBar: AppBar(
          title: Text('应用'),
          actions: <Widget>[
            IconButton(
              icon:Icon(Icons.plus_one),
              tooltip: '打印',
              onPressed: (){},
            ),
            IconButton(
              icon:Icon(Icons.share),
              tooltip: '分享',
              onPressed: (){},
            ),
            IconButton(
              icon:Icon(Icons.plus_one),
              tooltip: '更多',
              onPressed: (){},
            )
          ],
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
//    return SizedBox(
//      height: 200.0,
//      child: AppBar(
//        title: Text('应用'),
          // 动作按钮
//        actions: <Widget>[
//          IconButton(
//            icon:Icon(Icons.plus_one),
//            tooltip: '打印',
//            onPressed: (){},
//          ),
//          IconButton(
//            icon:Icon(Icons.share),
//            tooltip: '分享',
//            onPressed: (){},
//          ),
//          IconButton(
//            icon:Icon(Icons.plus_one),
//            tooltip: '更多',
//            onPressed: (){},
//          )
//        ],
//      ),
//    );
  return SizedBox(
    height: 500,
    child: AppBar(
      title: Text('标题'),
      // 左侧图标
      leading: Icon(Icons.home),
      // 背景色
      backgroundColor: Colors.green,
      centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.plus_one),
            tooltip: '打印',
            onPressed: (){},
          ),
         PopupMenuButton<String>(
           itemBuilder: (BuildContext context)=><PopupMenuItem<String>>[
             PopupMenuItem<String>(
                 value: 'share',
                 child: Text('分享到朋友圈')
             ),
             PopupMenuItem<String>(
                 value: 'download',
                 child: Text('下载到本地')
             )
           ]
         )
        ],
    ),
  );
  }
}