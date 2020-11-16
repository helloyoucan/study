import 'package:flutter/material.dart';
import 'package:flutter_trip/widget/webview.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyPage();
}

class _MyPage extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: WebView(
          url: 'https://m.ctrip.com/webapp/myctrip/',
          hideAppBar: true,
          backForbid: true,
          statusBarColor: '4c5bca',
        ),
      ),
    );
  }
}
