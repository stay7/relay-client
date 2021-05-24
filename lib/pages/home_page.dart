import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/instance_manager.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/header/home_header.dart';
import 'package:relay/constants/color.dart';
import 'package:relay/pages/group_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    GroupController controller = Get.put(GroupController());

    return Scaffold(
      key: _scaffoldKey,
      appBar: HomeAppBar(_scaffoldKey, statusBarHeight),
      drawer: GroupPage(),
      floatingActionButton: Icon(
        Icons.add_circle_outlined,
        color: MyColor.black,
        size: 40,
      ),
    );
  }
}
