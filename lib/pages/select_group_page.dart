import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relay/components/group_tile.dart';
import 'package:relay/config/color.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/controller/ui_controller.dart';
import 'package:relay/header/app_header.dart';
import 'package:relay/types/group.dart';

class SelectGroupPage extends GetView<UiController> {
  final GroupController _groupController = Get.find<GroupController>();

  onPressGroup(Group group) {
    controller.select(group);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    var unselectedGroups = _groupController.groups
        .where((group) => group.id != controller.state!.id)
        .toList();

    return Scaffold(
      appBar: AppHeader(
        leftIcon: IconButton(
          icon: Icon(Icons.close_outlined),
          onPressed: () => Get.back(),
        ),
      ),
      backgroundColor: MyColor.lightGrey,
      body: SizedBox.expand(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(color: MyColor.lightGrey),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Text('그룹을 선택해주세요', style: TextStyle(fontSize: 18)),
              ),
              controller.obx(
                (state) => Container(
                  margin: EdgeInsets.only(bottom: 28),
                  child: GroupTile(controller.state!, onPressGroup),
                ),
                onEmpty: null,
              ),
              ListView.builder(
                itemCount: _groupController.groups.length - 1,
                itemBuilder: (_, index) =>
                    GroupTile(unselectedGroups[index], onPressGroup),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
