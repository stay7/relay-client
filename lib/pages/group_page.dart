import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:relay/config/color.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/controller/ui_controller.dart';
import 'package:relay/group_tile.dart';
import 'package:relay/header/group_header.dart';
import 'package:relay/types/group.dart';

class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Drawer(
            child: Column(children: [
      GroupHeader(),
      Expanded(child: GroupList()),
      AddGroupButton()
    ])));
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

class AddGroupButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddGroupButtonState();
}

class _AddGroupButtonState extends State<AddGroupButton> {
  final _editTextController = TextEditingController();
  final groupController = Get.find<GroupController>();
  String _groupName = '';

  @override
  void dispose() {
    _editTextController.dispose();
    super.dispose();
  }

  onPressSave() async {
    await groupController.addGroup(_groupName);
    Get.back();
    _editTextController.clear();
  }

  onPressAddGroup(BuildContext context) {
    Get.dialog(CupertinoAlertDialog(
      title: Container(margin: EdgeInsets.only(bottom: 10), child: Text('입력')),
      content: CupertinoTextField(
        onChanged: (value) {
          _groupName = value;
        },
        controller: _editTextController,
      ),
      actions: <Widget>[
        TextButton(
            child: Text('취소', style: TextStyle(fontSize: 16)),
            onPressed: () => Get.back()),
        TextButton(
            child: Text('저장', style: TextStyle(fontSize: 16)),
            onPressed: () => onPressSave()),
      ],
    ));
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
            child: Row(children: [
              Icon(
                Icons.create_new_folder_outlined,
                size: 24,
                color: MyColor.blue,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text('Add Group'),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
