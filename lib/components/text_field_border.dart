import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relay/config/color.dart';

class TextFieldBorder extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  TextFieldBorder({required this.controller, this.hintText = ''});

  createState() => _TextFieldBorder();
}

class _TextFieldBorder extends State<TextFieldBorder> {
  late OutlineInputBorder border;

  @override
  initState() {
    setBorder(widget.controller.text);
    super.initState();
  }

  setBorder(String text) {
    BorderSide borderSide = text.length > 0
        ? BorderSide(color: MyColor.black)
        : BorderSide(color: MyColor.red);

    setState(() {
      border = OutlineInputBorder(borderSide: borderSide);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: widget.controller,
        onChanged: (text) {
          setBorder(text);
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
          focusedBorder: border,
          enabledBorder: border,
        ),
        autocorrect: false,
      ),
    );
  }
}
