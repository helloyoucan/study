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
          title:new Text('Chip组件'),
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
  List<String> _tags = ['A','B','C','D','E'];
  String _action = 'A';
  List<String> _selected = [];
  String _choice = 'B';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Wrap(
            spacing: 8,

            runSpacing: 8,

            children: <Widget>[
              Chip(
                label: Text('Chip1'),
              ),
              Chip(
                label: Text('Chip2'),
                backgroundColor: Colors.green,
              ),
              Chip(
                label: Text('Chip3'),
                avatar: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text('头'),
                ),
              ),
              Chip(
                label: Text('Chip4'),
                avatar: CircleAvatar(
                  backgroundImage:NetworkImage("https://wx.qlogo.cn/mmopen/vi_32/GjFJHox9V8rUK0ee0FshDpp3nsb447luUu0ic39ITGV8A8pCE8B5VdpoX6UpMKZXKjhAH4WOefFO82erePKcE3Q/132"),
                ),
              ),
              Chip(
                label: Text('Chip5'),
                onDeleted: (){},
                deleteIcon: Icon(Icons.delete),
                deleteIconColor: Colors.red,
                deleteButtonTooltipMessage: '删除这个标签',
              ),
              Chip(
                label: Text('Chip1'),
              ),
              Divider(
                color: Colors.green,
                height: 20,
              ),
              Wrap(
                spacing: 8.0,
                runSpacing: 8,
                children:_tags.map((tag){
                  return Chip(
                    label: Text(tag),
                    onDeleted: (){
                      setState(() {
                        _tags.remove(tag);
                      });
                    },
                  );
                }).toList(),
              ),
              // 动作Chip
              Divider(
                color: Colors.green,
                height: 20,
              ),
              Wrap(
                spacing: 8.0,
                runSpacing: 8,
                children:_tags.map((tag){
                  // 动作Chip
                  return ActionChip(
                    label: Text(tag),
                    onPressed: (){
                      setState(() {
                        _action = tag;
//                        _tags.remove(tag);
                        print(_action);
                      });
                    },
                  );
                }).toList(),
              ),
              // 过滤Chip
              Divider(
                color: Colors.green,
                height: 20,
              ),
              Container(
                width: 200,
                child: Text(_selected.toString()),
              ),
              Wrap(
                spacing: 8.0,
                runSpacing: 8,
                children:_tags.map((tag){
                  // 过滤Chip
                  return FilterChip(
                    label: Text(tag),
                    selected:_selected.contains(tag) ,
                    onSelected: (value){
                      setState(() {
                       if(_selected.contains(tag)){
                         _selected.remove(tag);
                       }else{
                         _selected.add(tag);
                       }
                      });
                    },
                  );
                }).toList(),
              ),
              // 选择Chip
              Divider(
                color: Colors.green,
                height: 20,
              ),
              Wrap(
                spacing: 8.0,
                runSpacing: 8,
                children:_tags.map((tag){
                  // 动作Chip
                  return ChoiceChip(
                    label: Text(tag),
                    selectedColor: Colors.red,
                    selected: _choice==tag,
                    onSelected: (value){
                      setState(() {
                        _choice=tag;
                      });
                    },
                  );
                }).toList(),
              ),
            ],
          )
        ],
      ),
    );
  }
}