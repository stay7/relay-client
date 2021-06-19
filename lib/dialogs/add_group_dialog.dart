import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relay/controller/group_controller.dart';

class AddGroupDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddGroupDialogState();
}

class _AddGroupDialogState extends State<AddGroupDialog> {
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

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
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
    );
  }
}
