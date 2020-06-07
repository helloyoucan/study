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
          title:new Text('SnackBar组件'),
        ),
        body:new Center(
          child: DemoPage(),
        ),
      ),
    );
  }
}
class DemoPage extends StatefulWidget{
  DropDownButtonDemo createState()=>DropDownButtonDemo();
}

class DropDownButtonDemo extends State<DemoPage>{
  var selectItemValue = '上海';
  List<DropdownMenuItem> generateItemList(){
    final List<DropdownMenuItem> items = new List();
    final DropdownMenuItem item1 = new DropdownMenuItem(child: Text('北京'),value:'北京');
    final DropdownMenuItem item2 = new DropdownMenuItem(child: Text('上海'),value:'上海');
    final DropdownMenuItem item3 = new DropdownMenuItem(child: Text('广州'),value:'广州');
    final DropdownMenuItem item4 = new DropdownMenuItem(child: Text('深圳'),value:'深圳');
    items.add(item1);
    items.add(item2);
    items.add(item3);
    items.add(item4);
    return items;
  }


  @override
  Widget build(BuildContext context){
    return DropdownButton(
      hint: Text('请选择一个城市'),
      items: generateItemList(),
      value: selectItemValue,
      iconSize: 48,
      style: TextStyle(color: Colors.green),
      // 阴影
      elevation: 24,
      // 希望撑满父容器
      isExpanded: true,
      // 下拉改变事件
      onChanged: (T){
        setState(() {
          selectItemValue = T;
        });

      },
    );
  }
}