import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]).then((_) {
    runApp(MyApp());
  }).catchError((onError){
    print(onError);
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '全屏',
      home: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: Text('hello'),
        ),
      ),
    );
  }
}
