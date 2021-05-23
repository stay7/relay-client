import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:relay/appbar.dart';
import 'package:relay/constants/color.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _title = 'titlde';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(this._title),
      drawer: Drawer(),
      floatingActionButton: Icon(
        Icons.add_circle_outlined,
        color: MyColor.black,
        size: 40,
      ),
    );
  }
}
