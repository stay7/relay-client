import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:relay/config/color.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/controller/word_controller.dart';
import 'package:relay/header/add_word_header.dart';
import 'package:relay/types/group.dart';
import 'package:relay/types/word.dart';
import 'package:get/route_manager.dart';

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
  final GroupController _groupController = Get.find<GroupController>();
  final WordController _wordController = Get.find<WordController>();

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

    final Group group = _groupController.selectedGroup;
    final Word word = await _wordController.addWord(
        group, _textName, _textMeaning, _textMeaning);
    group.words.add(word);
    clearEdit();
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
              Container(
                margin: EdgeInsets.only(bottom: 50),
                child: Text(
                  '추가할 단어를 입력하세요',
                  style: TextStyle(color: MyColor.black, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: TextField(
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
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 50),
                        child: ElevatedButton(
                          onPressed: () => onPressSave(),
                          child: Text(
                            "저장",
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: MyColor.black,
                            onPrimary: MyColor.white,
                            shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
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
