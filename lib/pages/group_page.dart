import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/group_tile.dart';
import 'package:relay/header/group_header.dart';

class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Drawer(
            child: Column(
                children: [GroupHeader(), Expanded(child: GroupList())])));
  }
}

class GroupList extends StatelessWidget {
  final GroupController groupController = Get.find<GroupController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        padding: const EdgeInsets.only(left: 18, right: 18),
        itemCount: groupController.groups.length,
        itemBuilder: (context, index) =>
            GroupTile(groupController.groups[index]),
      );
    });
  }
}
