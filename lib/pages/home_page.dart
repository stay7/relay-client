import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:relay/appbar.dart';
import 'package:relay/constants/color.dart';
import 'package:relay/pages/group_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _title = 'titlde';

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      key: _scaffoldKey,
      appBar: HomeAppBar(this._title, _scaffoldKey, statusBarHeight),
      drawer: GroupPage(),
      floatingActionButton: Icon(
        Icons.add_circle_outlined,
        color: MyColor.black,
        size: 40,
      ),
    );
  }
}
