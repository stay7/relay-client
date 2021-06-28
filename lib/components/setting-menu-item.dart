import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relay/config/color.dart';

class SettingMenuItem extends StatelessWidget {
  final String title;
  final String content;
  final Function? onPress;
  final bool isSwitch;
  bool switchValue;

  SettingMenuItem({
    this.onPress,
    this.title = '',
    this.content = '',
    this.isSwitch = false,
    this.switchValue = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          if (onPress != null) onPress!();
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 1),
          padding: EdgeInsets.only(left: 50, right: 20),
          decoration: BoxDecoration(color: MyColor.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              this.isSwitch
                  ? Switch(
                      value: switchValue,
                      onChanged: (flag) {
                        if (onPress != null) onPress!();
                      })
                  : Text(content)
            ],
          ),
        ),
      ),
    );
  }
}
