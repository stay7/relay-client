import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relay/components/back_icon.dart';
import 'package:relay/components/checkbox_border.dart';
import 'package:relay/components/main_button.dart';
import 'package:relay/components/page_title.dart';
import 'package:relay/components/text_field_border.dart';
import 'package:relay/config/color.dart';
import 'package:relay/config/config.dart';
import 'package:relay/config/routes.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/header/app_header.dart';
import 'package:relay/types/group.dart';
import 'package:relay/types/word.dart';

class EditWordPage extends StatefulWidget {
  _EditWordPage createState() => _EditWordPage();
}

class _EditWordPage extends State<EditWordPage> {
  final GroupController _groupController = Get.find<GroupController>();
  late final TextEditingController _nameController;
  late final TextEditingController _meaningController;
  late final TextEditingController _usageController;
  late Group group;

  Word word = Get.arguments;

  @override
  void initState() {
    _nameController = new TextEditingController(text: word.name);
    _meaningController = new TextEditingController(text: word.meaning);
    _usageController = new TextEditingController(text: word.usage);
    group = _groupController.selectedGroup;

    super.initState();
  }

  onPressEdit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: _groupController.selectedGroup.name,
        leftIcon: BackIconButton(),
      ),
      body: Container(
        margin: EdgeInsets.all(AppConfig.PageMarginHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageTitle(title: '단어를 수정하세요'),
            TextFieldBorder(
              controller: _nameController,
              hintText: '단어 이름',
            ),
            TextFieldBorder(
              controller: _meaningController,
              hintText: '의미',
            ),
            TextFieldBorder(
              controller: _usageController,
              hintText: '예시',
            ),
            CheckBoxBorder(
              text: '완료',
              checked: word.doneStatus == DoneStatus.DONE,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.selectGroup);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: MyColor.blue,
                      size: 24,
                    ),
                    Text(
                      '${group.name}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MainButton(text: '수정', onPressed: () {}),
                  SizedBox(
                    height: Get.mediaQuery.viewInsets.bottom == 0 ? 30 : 0,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
