import 'package:flutter/material.dart';
import '../config/images.dart';
import '../config/color.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: new BoxDecoration(
        image: new DecorationImage(
            image: new AssetImage(BImage.loginBg), fit: BoxFit.cover),
      ),
      child: Center(
        child: Container(
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white,
          ),
          width: 460.0,
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Text('登陆',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: BColor.blackColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 25.0,
                      decoration: TextDecoration.none)),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(234, 234, 234, 1),
                            width: 1,
                            style: BorderStyle.solid))),
                child: Row(
                  children: <Widget>[
                    Image.asset(BImage.phone),
                    Form(
                        key: _formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Enter your email',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                            ]))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
