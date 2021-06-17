import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:relay/config/color.dart';
import 'package:relay/config/routes.dart';
import 'package:relay/controller/ui_controller.dart';
import 'package:relay/header/home_header.dart';
import 'package:relay/pages/group_page.dart';

class HomePage extends StatelessWidget {
  final UiController uiController = Get.find<UiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: uiController.scaffoldKey,
      appBar: HomeAppBar(),
      drawer: GroupPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.addWord),
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
