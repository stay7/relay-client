import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:relay/components/word_active_tile.dart';
import 'package:relay/components/word_inactive_tile.dart';
import 'package:relay/config/color.dart';
import 'package:relay/config/routes.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/controller/ui_controller.dart';
import 'package:relay/controller/word_controller.dart';
import 'package:relay/header/home_header.dart';
import 'package:relay/pages/group_page.dart';

class HomePage extends StatelessWidget {
  final UiController uiController = Get.find<UiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: uiController.scaffoldKey,
      appBar: HomeAppBar(),
      drawer: GroupPage(),
      body: Container(
        padding: EdgeInsets.all(15),
        child: WordList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.addWord),
        child: Icon(Icons.add_circle_outlined, size: 40, color: MyColor.black),
        backgroundColor: MyColor.transparent,
        elevation: 0,
      ),
    );
  }
}

class WordList extends StatelessWidget {
  final GroupController groupController = Get.find<GroupController>();
  final WordController wordController = Get.find<WordController>();

  @override
  Widget build(BuildContext context) {
    print('home build()');
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: groupController.openWords.length +
                  groupController.doneWords.length,
              itemBuilder: (_, index) {
                if (index < groupController.openWords.length) {
                  return WordActiveTile(
                    key: ValueKey(
                        'index_${groupController.openWords[index].id}'),
                    word: groupController.openWords[index],
                  );
                }

                return WordInActiveTile(
                    word: groupController
                        .doneWords[index - groupController.openWords.length]);
              },
                ),
              ),
            ],
          ),
    );
  }
}
