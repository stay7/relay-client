import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:relay/components/empty_group_icon.dart';
import 'package:relay/components/word_active_tile.dart';
import 'package:relay/components/word_inactive_tile.dart';
import 'package:relay/config/color.dart';
import 'package:relay/config/routes.dart';
import 'package:relay/controller/ui_controller.dart';
import 'package:relay/controller/word_controller.dart';
import 'package:relay/header/home_header.dart';
import 'package:relay/pages/group_page.dart';

class HomePage extends GetView<UiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: HomeAppBar(),
      drawer: GroupPage(),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            controller.obx(
              (state) => Expanded(
                child: WordList(),
              ),
              onEmpty: EmptyGroupIcon(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.state != null) {
            Get.toNamed(Routes.addWord);
          } else {
            Get.snackbar('그룹 없음', '그룹을 먼저 선택해주세요');
            Future.delayed(const Duration(milliseconds: 1000), () {
              controller.openDrawer();
            });
          }
        },
        child: Icon(Icons.add_circle_outlined, size: 40, color: MyColor.black),
        backgroundColor: MyColor.transparent,
        elevation: 0,
      ),
    );
  }
}

class WordList extends StatelessWidget {
  final UiController _uiController = Get.find<UiController>();
  final WordController wordController = Get.find<WordController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          _uiController.openWords.length + _uiController.doneWords.length,
      itemBuilder: (_, index) {
        if (index < _uiController.openWords.length) {
          return WordActiveTile(
            key: ValueKey('index_${_uiController.openWords[index].id}'),
            word: _uiController.openWords[index],
          );
        }

        return WordInActiveTile(
            word: _uiController
                .doneWords[index - _uiController.openWords.length]);
      },
    );
  }
}
