import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:relay/components/back_icon.dart';
import 'package:relay/components/group_edit_tile.dart';
import 'package:relay/components/icon_text_button.dart';
import 'package:relay/config/color.dart';
import 'package:relay/config/config.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/controller/word_controller.dart';
import 'package:relay/header/app_header.dart';
import 'package:relay/types/group.dart';
import 'package:relay/types/word.dart';

class EditGroupPage extends StatefulWidget {
  final Group group = Get.arguments;
  final GroupController _groupController = Get.find<GroupController>();
  final WordController _wordController = Get.find<WordController>();

  @override
  State<StatefulWidget> createState() => _EditGroupPageState();
}

class _EditGroupPageState extends State<EditGroupPage> {
  List<Word> trashWords = List<Word>.empty(growable: true);
  List<Word> words = List<Word>.empty(growable: true);
  String groupName = '';

  @override
  Widget build(BuildContext context) {
    final group = widget.group;
    words = group.words
        .where((elemenet) => !trashWords.contains(elemenet))
        .toList();
    groupName = widget.group.name;

    saveGroup() {
      widget._wordController.deleteWords(trashWords);
      widget._groupController.deleteWords(trashWords);
      Get.back();
    }

    return Scaffold(
      appBar: AppHeader(
        leftIcon: BackIconButton(),
        rightIcon: IconButton(
          icon: Icon(Icons.done_outlined),
          onPressed: saveGroup,
        ),
      ),
      body: Container(
        margin:
            EdgeInsets.symmetric(horizontal: AppConfig.PageMarginHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset('assets/images/folder.svg'),
            Expanded(
              child: ListView.builder(
                itemBuilder: (_, index) {
                  return GroupEditTile(
                    word: words[index],
                    onPressed: () {
                      print('onPressed ${words[index].name}');
                      setState(() {
                        trashWords.add(words[index]);
                        words.remove(words[index]);
                      });
                    },
                  );
                },
                itemCount: words.length,
              ),
            ),
            IconTextButton(
              icon: Icon(
                Icons.remove_circle_outlined,
                size: 24,
                color: MyColor.red,
              ),
              name: '그룹 삭제',
            )
          ],
        ),
      ),
    );
  }
}
