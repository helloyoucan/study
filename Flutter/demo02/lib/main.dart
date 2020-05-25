import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: new MyScaffold(),
  ));
//  runApp(MyApp());
}

/*class MyApp extends StatelessWidget {
 Widget build(BuildContext context){
   return new Container(
     decoration: new BoxDecoration(color: Colors.white),
     child: new Center(
       child: new Text(
         'Hello World',
         textDirection: TextDirection.ltr,
         style: new TextStyle(fontSize: 40.0,color: Colors.black87),
       ),
     ),
   );
 }
}*/

class MyAppBar extends StatelessWidget{
  MyAppBar({this.title});
  final Widget title;
  Widget build(BuildContext context){
    return new Container(
      height: 56.0,// 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      // Row 是水平方向的线性布局（linear layout）
      child: new Row(
        //列表项的类型是 <Widget>
        children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu),
              tooltip: 'Navigation menu',
              onPressed: null// null 会禁用 button
          ),
          new Expanded(child: title),
          new IconButton(
              icon: new Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null
          )
        ],
      ),
    );
  }
}
class MyScaffold extends StatelessWidget{
  Widget build(BuildContext context){
    // Material 是UI呈现的“一张纸”
    return new Material(
      // Column is 垂直方向的线性布局.
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
              child:new Center(
                child: new Text('Hello World！！！'),
              )
          )
        ],
      ),
    );
  }
}