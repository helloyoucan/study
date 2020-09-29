import 'package:flutter/material.dart';
import '../config/images.dart';
import '../config/color.dart';
import '../Widget/WButton.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var errorMsg = null;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
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
              height: 500,
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
                            Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Stack(
//                              alignment: FractionalOffset(-0.02, 0),
                                  children: <Widget>[
                                    Positioned(
                                      child: TextFormField(
                                        controller: new TextEditingController(),
                                        decoration: InputDecoration(
                                            counterText: '',
                                            //隐藏maxLength提示的数字
                                            contentPadding:
                                                EdgeInsets.only(left: 60),
                                            hintText: "手机号码",
                                            errorStyle: TextStyle(),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        BColor.primaryColor)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        BColor.primaryColor))),
                                        maxLength: 11,
                                        validator: (v) {
                                          if (v.trim().length == 0) {
                                            setState(() {
//                                            errorMsg=Text("手机号不能为空");
                                            });
                                          }
                                          if (v.trim().length != 11) {
                                            setState(() {
//                                            errorMsg=Text("请输入正确的手机号");
                                            });
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Positioned(
                                      child: Image.asset(
                                          'assets/images/phone.png'),
                                    ),
                                  ]),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Stack(children: <Widget>[
                                  Positioned(
                                    child: TextFormField(
                                      controller: new TextEditingController(),
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(left: 60),
                                          hintText: "验证码",
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: BColor.primaryColor)),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: BColor.primaryColor))),
                                      validator: (v) {
                                        if (v.trim().length <= 6) {
                                          setState(() {
//                                          errorMsg=Text("密码不能少于6位");
                                          });
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    child:
                                        Image.asset('assets/images/vCode.png'),
                                  ),
                                  Positioned(
                                      right: 0,
                                      child: WButton(
                                        onPressed: () {
                                          // 通过_formKey.currentState 获取FormState后，
                                          // 调用validate()方法校验用户名密码是否合法，校验
                                          // 通过后再提交数据。
                                          if (_formKey.currentState
                                              .validate()) {
                                            //验证通过提交数据
                                          }
                                        },
                                        text: '验证码',
                                        width: 100,
                                        height: 40,
                                        radius: 20,
                                      ))
                                ])),

                            // 登录按钮

                            Padding(
                              padding: const EdgeInsets.only(top: 28.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: WButton(
                                      onPressed: () {
                                        // 通过_formKey.currentState 获取FormState后，
                                        // 调用validate()方法校验用户名密码是否合法，校验
                                        // 通过后再提交数据。
                                        if (_formKey.currentState.validate()) {
                                          //验证通过提交数据
                                        }
                                      },
                                      text: '登录',
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 39, bottom: 26),
                              child: Center(
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      '登录代表同意',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: BColor.blackColor),
                                    ),
                                    Text(
                                      '贝尔云课堂用户协议',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: BColor.primaryColor),
                                    ),
                                    Text(
                                      '和',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: BColor.blackColor),
                                    ),
                                    Text(
                                      '隐私协议',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: BColor.primaryColor),
                                    ),
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
