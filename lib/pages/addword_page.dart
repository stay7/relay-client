import 'package:flutter/material.dart';
import 'package:relay/constants/color.dart';
import 'package:relay/header/add_word_header.dart';

class AddWordPage extends StatefulWidget {
  _AddWordPage createState() => _AddWordPage();
}

class _AddWordPage extends State<AddWordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddWordHeader(),
      backgroundColor: MyColor.lightGrey,
    );
  }
}
