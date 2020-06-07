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
          title:new Text('BootomNavigationBar组件'),
        ),
        body: Container(
          height: 500.0,
          width: 200.0,
        ),
        bottomNavigationBar: DemoPage(),
      ),
    );
  }
}

class DemoPage extends StatefulWidget{
  DemoPageState createState()=>DemoPageState();
}

class DemoPageState extends State<DemoPage>{
  // 当前选中的选项索引
  int _currentIndex = 1;
  void _onItemTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return BottomNavigationBar(
//      // 地步按钮类型(固定样式)
//      type:BottomNavigationBarType.fixed,
//      fixedColor: Colors.red,
//      // 按钮大小
//      iconSize: 24.0,
//      // 点击里面的按钮回调的函数
//      onTap: _onItemTapped,
//      // 当前选中项
//      currentIndex: _currentIndex,
//      items: <BottomNavigationBarItem>[
//        BottomNavigationBarItem(title: Text('聊天'),icon: Icon(Icons.chat)),
//        BottomNavigationBarItem(title: Text('黑面'),icon: Icon(Icons.ac_unit)),
//        BottomNavigationBarItem(title: Text('白虎'),icon: Icon(Icons.backspace)),
//      ],
//    );
    return BottomNavigationBar(
      // 地步按钮类型(可移动样式)
      type:BottomNavigationBarType.shifting,
      // 按钮大小
      iconSize: 24.0,
      // 点击里面的按钮回调的函数
      onTap: _onItemTapped,
      // 当前选中项
      currentIndex: _currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(title: Text('聊天',style: TextStyle(color: Colors.black),),icon: Icon(Icons.chat,color: Colors.black)),
        BottomNavigationBarItem(title: Text('黑面',style: TextStyle(color: Colors.black),),icon: Icon(Icons.chat,color: Colors.black)),
        BottomNavigationBarItem(title: Text('白虎',style: TextStyle(color: Colors.black),),icon: Icon(Icons.chat,color: Colors.black)),
      ],
    );
  }
}