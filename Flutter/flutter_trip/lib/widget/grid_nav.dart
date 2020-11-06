import 'package:flutter/material.dart';
import 'package:flutter_trip/model/grid_nav_model.dart';

class GridNav extends StatelessWidget {
  final GridNavModel gridNavModel;
  final String name;
  const GridNav({Key key, @required this.gridNavModel, this.name = '小灿'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(name);
  }
}
/*
class GridNav extends StatefulWidget {
  final GridNavModel gridNavModel;
  final String name;

  const GridNav({Key key, @required this.gridNavModel, this.name = '小灿'})
      : super(key: key);

  @override
  _GridNavState createState() => _GridNavState();
}

class _GridNavState extends State<GridNav> {
  @override
  Widget build(BuildContext context) {
    return Text('GridNav');
  }
}
*/
