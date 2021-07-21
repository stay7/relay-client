import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:relay/config/color.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/controller/ui_controller.dart';
import 'package:relay/types/group.dart';

class GroupTile extends StatelessWidget {
  final groupController = Get.find<GroupController>();
  final _uiController = Get.find<UiController>();
  final uiController = Get.find<UiController>();
  late final Group group;
  final Function(Group)? onPress;

  GroupTile(this.group, this.onPress);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: GestureDetector(
        onTap: () {
          if (onPress != null) onPress!(group);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 8),
          padding: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            color: MyColor.white,
            borderRadius: BorderRadius.circular(5),
            border: _uiController.currentGroup.value == group
                ? Border.all(color: MyColor.black, width: 1)
                : null,
          ),
          child: Row(
            children: [
              Icon(
                Icons.folder_open,
                size: 24,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Text(group.name),
                ),
              ),
              Text(group.words.length.toString())
            ],
          ),
        ),
      ),
    );
  }
}
