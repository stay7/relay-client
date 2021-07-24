import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:relay/components/main_button.dart';
import 'package:relay/components/page_title.dart';
import 'package:relay/config/color.dart';
import 'package:relay/controller/config_controller.dart';
import 'package:relay/controller/ui_controller.dart';
import 'package:relay/controller/word_controller.dart';
import 'package:relay/header/add_word_header.dart';
import 'package:relay/types/group.dart';
import 'package:relay/types/word.dart';

class AddWordPage extends StatefulWidget {
  _AddWordPage createState() => _AddWordPage();
}

class _AddWordPage extends State<AddWordPage> {
  String _textName = "";
  String _textMeaning = "";
  String _textUsage = "";
  final _editWordController = TextEditingController();
  final _editMeaningController = TextEditingController();
  final _editUsageController = TextEditingController();
  final UiController _uiController = Get.find<UiController>();
  final WordController _wordController = Get.find<WordController>();
  final ConfigController _configController = Get.find<ConfigController>();

  @override
  void dispose() {
    _editWordController.dispose();
    _editMeaningController.dispose();
    _editUsageController.dispose();
    super.dispose();
  }

  Color getBorderColor(String text) {
    if (text.length > 0) return MyColor.black;
    return MyColor.grey;
  }

  onPressSave() async {
    //TODO: check validation
    print('onPressSave');

    final Group group = _uiController.currentGroup!.value;
    final Word word = await _wordController.addWord(
        group, _textName, _textMeaning, _textUsage);
    group.words.add(word);
    clearEdit();

    if (!_configController.isKeepAddWord.value) Get.back();
    Get.snackbar('저장되었습니다.', '저장 성공');
  }

  clearEdit() {
    _editWordController.clear();
    _editMeaningController.clear();
    _editUsageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddWordHeader(),
      backgroundColor: MyColor.lightGrey,
      body: SizedBox.expand(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageTitle(title: '추가할 단어를 입력하세요'),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: TextField(
                  autocorrect: false,
                  controller: _editWordController,
                  onChanged: (String value) {
                    setState(() => _textName = value);
                  },
                  decoration: InputDecoration(
                    hintText: '단어',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: getBorderColor(_textName),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: TextField(
                  autocorrect: false,
                  controller: _editMeaningController,
                  onChanged: (String value) {
                    setState(() => _textMeaning = value);
                  },
                  decoration: InputDecoration(
                    hintText: '의미',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: getBorderColor(_textMeaning),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: TextField(
                  autocorrect: false,
                  controller: _editUsageController,
                  onChanged: (String value) {
                    setState(() => _textUsage = value);
                  },
                  decoration: InputDecoration(
                    hintText: '예시',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: getBorderColor(_textUsage),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          bottom:
                              Get.mediaQuery.viewInsets.bottom == 0 ? 30 : 0),
                      child: MainButton(text: '저장', onPressed: onPressSave),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
