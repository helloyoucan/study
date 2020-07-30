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
          title:new Text('TabBar组件'),
        ),
        body: DemoPage(),
      ),
    );
  }
}

class DemoPage extends StatefulWidget{
  DemoPageState createState()=>DemoPageState();
}

class DemoPageState extends State<DemoPage> with SingleTickerProviderStateMixin{
  ScrollController _scrollController;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = new ScrollController();
    // length要和tab的数量一致
    _tabController = new TabController(length: 6, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 500.0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('选项卡1'),
          // 前置图标
          leading: Icon(Icons.home),
          backgroundColor: Colors.black,
          bottom: TabBar(
            controller: _tabController,
            // 是否可以滚动
            isScrollable: true,
              tabs: <Widget>[
                Tab(text: 'Tabs1',icon: Icon(Icons.ac_unit),),
                Tab(text: 'Tabs2',),
                Tab(text: 'Tabs3',),
                Tab(text: 'Tabs4',),
                Tab(text: 'Tabs5',),
                Tab(text: 'Tabs6',),
              ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
            children: <Widget>[
              Text('选项卡1'),
              Text('选项卡2'),
              Text('选项卡3'),
              Text('选项卡4'),
              Text('选项卡5'),
              Text('选项卡6'),
            ]
        ),
      ),
    );
  }
}