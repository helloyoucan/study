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
          title:new Text('CheckBoxListTiele组件'),
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
  bool _value = false;
  void _valueChanged(bool value){
    for(var i=0;i<isChecks.length;i++){
      isChecks[i] = value;
    }
  }
  bool isCheck = true;
  List<bool> isChecks = [false,false,false,false,false];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Center(
          child: CheckboxListTile(
            value: _value,
            // 默认文字是否高亮
            selected: true,
            onChanged: _valueChanged,
            dense: false,//文字时候对齐 图标高度
            isThreeLine: false,// 文字是否三行显示
            title: Text('选择内容'),
            controlAffinity: ListTileControlAffinity.platform,//按钮与图标的位置
            subtitle: Text('勾选下来选项'),
            secondary: Icon(Icons.archive),// 左侧小图标
          ),
        ),
        Center(
          child: CheckboxListTile(
            value: isChecks[0],
            // 默认文字是否高亮
            selected: true,
            onChanged: _valueChanged,
            dense: false,//文字时候对齐 图标高度
            isThreeLine: false,// 文字是否三行显示
            title: Text('选择内容'),
            controlAffinity: ListTileControlAffinity.platform,//按钮与图标的位置
            subtitle: Text('勾选下来选项'),
            secondary: Icon(Icons.archive),// 左侧小图标
            activeColor: Colors.red,
          ),
        )
      ],
    );
  }
}