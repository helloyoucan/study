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
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
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
                      child: Form(
                          key: _formKey, //设置globalKey，用于后面获取FormState
                          autovalidate: true, // 开启自动校验
                          child: Column(children: <Widget>[
                            TextFormField(
                              autofocus: true,
                              controller: new TextEditingController(),
                              decoration: InputDecoration(
                                  hintText: "手机号码", icon: Icon(Icons.person)),
                              validator: (v) {
                                return v.trim().length > 0 ? null : "用户名不能为空";
                              },
                            ),
                            TextFormField(
                              autofocus: true,
                              controller: new TextEditingController(),
                              decoration: InputDecoration(
                                  hintText: "验证码", icon: Icon(Icons.person)),
                              validator: (v) {
                                return v.trim().length > 5 ? null : "密码不能少于6位";
                              },
                            ),
                            // 登录按钮

                            Padding(
                              padding: const EdgeInsets.only(top: 28.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      height: 50.0,
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25.0))),
                                        child: Text("登录",style: TextStyle(fontSize: 20,color: Colors.white),),
                                        color: BColor.primaryColor,
                                        textColor: Colors.white,
                                        onPressed: () {
                                          // 通过_formKey.currentState 获取FormState后，
                                          // 调用validate()方法校验用户名密码是否合法，校验
                                          // 通过后再提交数据。
                                          if ((_formKey.currentState
                                                  as FormState)
                                              .validate()) {
                                            //验证通过提交数据
                                          }
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 39,bottom: 26),
                              child: Center(
                                child: Row(
                                  children: <Widget>[
                                    Text('登录代表同意',style: TextStyle(fontSize: 15,color: BColor.blackColor),),
                                    Text('贝尔云课堂用户协议',style: TextStyle(fontSize: 15,color: BColor.primaryColor),),
                                    Text('和',style: TextStyle(fontSize: 15,color: BColor.blackColor),),
                                    Text('隐私协议',style: TextStyle(fontSize: 15,color: BColor.primaryColor),),
                                  ],
                                ),
                              ),
                              )
                          ])))
                ],
              ),
            ),
          ),
        ));
  }
}
