import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:relay/components/back_icon.dart';
import 'package:relay/components/group_edit_tile.dart';
import 'package:relay/components/icon_text_button.dart';
import 'package:relay/components/text_field_border.dart';
import 'package:relay/config/color.dart';
import 'package:relay/config/config.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/controller/ui_controller.dart';
import 'package:relay/controller/word_controller.dart';
import 'package:relay/dialogs/delete_group_dialog.dart';
import 'package:relay/header/app_header.dart';
import 'package:relay/types/group.dart';
import 'package:relay/types/word.dart';

class EditGroupPage extends StatefulWidget {
  final Group group = Get.arguments;
  final GroupController _groupController = Get.find<GroupController>();
  final UiController _uiController = Get.find<UiController>();
  final WordController _wordController = Get.find<WordController>();

  @override
  State<StatefulWidget> createState() => _EditGroupPageState();
}

class _EditGroupPageState extends State<EditGroupPage> {
  List<Word> trashWords = List<Word>.empty(growable: true);
  List<Word> words = List<Word>.empty(growable: true);
  final _textController = TextEditingController();
  String groupName = '';

  @override
  void initState() {
    super.initState();
    _textController.text = widget.group.name;
    _textController.addListener(() {
      setState(() {
        groupName = _textController.text;
      });
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final group = widget.group;
    words = group.words.where((word) => !trashWords.contains(word)).toList();

    bool isEdited = (group.name != groupName) || trashWords.isNotEmpty;

    saveGroup() async {
      if (trashWords.isNotEmpty) {
        widget._wordController.deleteWords(trashWords);
        widget._uiController.deleteWords(trashWords);
      }
      if (_textController.text != widget.group.name) {
        group.name = _textController.text;
        await widget._groupController.updateGroup(group);
        widget._uiController.refreshCurrentGroup();
      }
      Get.back();
    }

    return Scaffold(
      appBar: AppHeader(
        leftIcon: BackIconButton(),
        rightIcon: IconButton(
          icon: Icon(
            Icons.done_outlined,
            color: isEdited ? MyColor.green : MyColor.black,
          ),
          onPressed: saveGroup,
        ),
      ),
      body: Container(
        margin:
            EdgeInsets.symmetric(horizontal: AppConfig.PageMarginHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 17),
              child: SvgPicture.asset(
                'assets/images/folder.svg',
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: TextFieldBorder(controller: _textController),
            ),
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
                  itemCount: words.length),
            ),
            IconTextButton(
              icon: Icon(
                Icons.remove_circle_outlined,
                size: 24,
                color: MyColor.red,
              ),
              name: '그룹 삭제',
              onTap: () => Get.dialog(DeleteGroupDialog()),
            )
          ],
        ),
      ),
    );
  }
}
