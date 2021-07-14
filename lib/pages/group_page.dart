import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:relay/components/group_tile.dart';
import 'package:relay/components/icon_text_button.dart';
import 'package:relay/config/color.dart';
import 'package:relay/config/routes.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/controller/ui_controller.dart';
import 'package:relay/dialogs/add_group_dialog.dart';
import 'package:relay/header/app_header.dart';
import 'package:relay/types/group.dart';

class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        leftIcon: IconButton(
            onPressed: () => Get.back(), icon: Icon(Icons.close, size: 24)),
        rightIcon: IconButton(
            onPressed: () => Get.toNamed(Routes.setting),
            icon: Icon(Icons.settings, size: 24)),
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            Expanded(child: GroupList()),
            AddGroupButton(),
          ],
        ),
      ),
    );
  }
}

class GroupList extends StatelessWidget {
  final GroupController groupController = Get.find<GroupController>();
  final UiController uiController = Get.find<UiController>();

  onPressGroup(Group group) {
    groupController.select(group);
    uiController.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        padding: const EdgeInsets.only(left: 18, right: 18),
        itemCount: groupController.groups.length,
        itemBuilder: (context, index) =>
            GroupTile(groupController.groups[index], onPressGroup),
      ),
    );
  }
}

class AddGroupButton extends StatelessWidget {
  onPressAddGroup(BuildContext context) {
    Get.dialog(AddGroupDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: GestureDetector(
          onTap: () => onPressAddGroup(context),
          child: Container(
            decoration: BoxDecoration(
              color: MyColor.white,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: IconTextButton(
              icon: Icon(
                Icons.create_new_folder_outlined,
                size: 24,
                color: MyColor.blue,
              ),
              name: '그룹 추가',
            ),
          ),
        ),
      ),
    );
  }
}
