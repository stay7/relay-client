import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:relay/constants/color.dart';
import 'package:relay/constants/routes.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/header/home_header.dart';
import 'package:relay/pages/group_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    GroupController controller = Get.put(GroupController());

    return Scaffold(
      key: _scaffoldKey,
      appBar: HomeAppBar(_scaffoldKey),
      drawer: GroupPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, Routes.addWord),
        child: Icon(
          Icons.add_circle_outlined,
          size: 40,
          color: MyColor.black,
        ),
        backgroundColor: MyColor.transparent,
        elevation: 0,
      ),
    );
  }
}
