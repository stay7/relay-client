import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relay/components/back_icon.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/header/app_header.dart';
import 'package:relay/types/word.dart';

class EditWordPage extends StatelessWidget {
  final GroupController _groupController = Get.find<GroupController>();
  Word word = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: _groupController.selectedGroup.name,
        leftIcon: BackIconButton(),
      ),
    );
  }
}
