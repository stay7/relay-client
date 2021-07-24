import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/controller/ui_controller.dart';

class DeleteGroupDialog extends GetView<UiController> {
  final GroupController _groupController = Get.find<GroupController>();

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('그룹 삭제'),
      content: Text('그룹과 모든 단어를 삭제합니다.'),
      actions: <Widget>[
        TextButton(onPressed: () => Get.back(), child: Text('취소')),
        TextButton(
          onPressed: () async {
            Get.back();
            final result =
                await _groupController.deleteGroup(controller.state!);
            if (!result) return Get.snackbar('삭제 실패', '');

            controller.clearGroup();
            Get.back();
          },
          child: Text('삭제'),
        )
      ],
    );
  }
}
