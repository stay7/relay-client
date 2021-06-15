import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:relay/config/color.dart';
import 'package:relay/config/routes.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/controller/user_controller.dart';
import 'package:relay/header/home_header.dart';
import 'package:relay/pages/group_page.dart';

class HomePage extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final GroupController groupController = Get.put(GroupController());

  @override
  Widget build(BuildContext context) {
    print('home build');
    return Scaffold(
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
