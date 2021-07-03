import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relay/config/color.dart';

class MainButton extends StatelessWidget {
  static final double defaultHeight = 50;
  final VoidCallback onPressed;
  final String text;

  MainButton({required this.onPressed, this.text = ''});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: defaultHeight,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        child: Text('$text', style: TextStyle(fontSize: 18)),
        style: ElevatedButton.styleFrom(
          primary: MyColor.black,
          onPrimary: MyColor.white,
          shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
