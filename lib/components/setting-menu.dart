import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relay/config/color.dart';

class SettingMenu extends StatelessWidget {
  final Icon icon;
  final String title;

  SettingMenu({this.icon = const Icon(Icons.settings), this.title = ''});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 1),
          padding: EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(color: MyColor.white),
          child: Row(
            children: [
              Container(padding: EdgeInsets.only(right: 14), child: icon),
              Text(title, style: TextStyle(fontSize: 18))
            ],
          ),
        ),
      ),
    );
  }
}
