import 'package:flutter/material.dart';
import '../config/color.dart';

class WButton extends RaisedButton {
  VoidCallback onPressed;
  String text;
  TextStyle textStyle;
  double width;
  double height;
  double radius;
  bool disabled;

  WButton(
      {@required this.onPressed,
      this.text = '',
      this.width = 100.0,
      this.height = 50.0,
      this.radius = 25.0,
      this.disabled=false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: this.height,
      width: this.width,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(this.radius))),
        child: Text(
          this.text,
          style:
              TextStyle(fontSize: (this.height - 10) / 2, color: Colors.white),
        ),
        color: this.disabled?BColor.blackColor:BColor.primaryColor,
        textColor: Colors.white,
        onPressed: this.onPressed,
      ),
    );
  }
}
