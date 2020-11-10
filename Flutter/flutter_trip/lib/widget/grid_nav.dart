import 'package:flutter/material.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/grid_nav_model.dart';
import 'package:flutter_trip/widget/webview.dart';

class GridNav extends StatelessWidget {
  final GridNavModel gridNavModel;
  const GridNav({Key key, @required this.gridNavModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _gridNavItems(context),
    );
  }

  _gridNavItems(BuildContext context) {
    List<Widget> items = [];
    if (gridNavModel == null) return items;
    if (gridNavModel.hotel != null) {}
    if (gridNavModel.flight != null) {}
    if (gridNavModel.travel != null) {}
  }

  _gridNavItem(BuildContext context, GridNavItem gridNavItem, bool first) {
    List<Widget> items = [];
  }

  _mainItem(BuildContext context, CommonModel model) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebView(
              url: model.url,
              title: model.title,
              statusBarColor: model.statusBarColor,
              hideAppBar: model.hideAppBar,
            ),
          ),
        );
      },
      child: Stack(
        children: <Widget>[
          Image.network(
            model.icon,
            fit: BoxFit.contain,
            height: 88,
            width: 121,
            alignment: AlignmentDirectional.bottomEnd,
          ),
          Text(
            model.title,
            style: TextStyle(fontSize: 14, color: Colors.white),
          )
        ],
      ),
    );
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
