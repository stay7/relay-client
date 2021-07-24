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
            IconTextButton(
              icon: Icon(
                Icons.create_new_folder_outlined,
                size: 24,
                color: MyColor.blue,
              ),
              name: '그룹 추가',
              onTap: () => Get.dialog(AddGroupDialog()),
            ),
          ],
        ),
      ),
    );
  }
}

class GroupList extends GetView<GroupController> {
  final UiController _uiController = Get.find<UiController>();

  onPressGroup(Group group) {
    _uiController.select(group);
    _uiController.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => ListView.builder(
        padding: const EdgeInsets.only(left: 18, right: 18),
        itemCount: controller.state!.length,
        itemBuilder: (context, index) =>
            GroupTile(controller.state![index], onPressGroup),
      ),
    );
  }
}
