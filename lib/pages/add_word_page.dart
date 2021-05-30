import 'package:flutter/material.dart';
import 'package:relay/config/color.dart';
import 'package:relay/header/add_word_header.dart';

class AddWordPage extends StatefulWidget {
  _AddWordPage createState() => _AddWordPage();
}

class _AddWordPage extends State<AddWordPage> {
  String _textWord = "";
  String _textMeaning = "";
  String _textUsage = "";
  final wordController = TextEditingController();
  final meaningController = TextEditingController();
  final usageController = TextEditingController();

  @override
  void dispose() {
    wordController.dispose();
    meaningController.dispose();
    usageController.dispose();
    super.dispose();
  }

  Color getBorderColor(String text) {
    if (text.length > 0) return MyColor.black;
    return MyColor.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddWordHeader(),
      backgroundColor: MyColor.lightGrey,
      body: SizedBox.expand(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                  controller: wordController,
                  onChanged: (String value) {
                    setState(() => _textWord = value);
                  },
                  decoration: InputDecoration(
                    hintText: '단어',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: getBorderColor(_textWord),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: TextField(
                  controller: meaningController,
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
                  controller: usageController,
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
                      padding: EdgeInsets.only(bottom: 10),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 50),
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
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
