import 'package:flutter/material.dart';
import 'package:relay/config/color.dart';
import 'package:relay/config/config.dart';
import 'package:get/get.dart';

class AppHeader extends StatelessWidget with PreferredSizeWidget {
  final Size _preferredSize = Size.fromHeight(AppConfig.HeaderSize);
  final String? title;
  final IconButton? leftIcon;
  final IconButton? rightIcon;

  @override
  Size get preferredSize => this._preferredSize;

  AppHeader({this.title, this.leftIcon, this.rightIcon});

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = Get.mediaQuery.padding.top;
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        margin: EdgeInsets.only(top: statusBarHeight),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: MyColor.black, width: 1)),
        ),
        child: Stack(fit: StackFit.expand, children: [
          if (title != null)
            Align(
                alignment: Alignment.center,
                child: Text(
                  title!,
                  style: TextStyle(fontSize: 16, color: MyColor.black),
                )),
          if (leftIcon != null) Positioned(left: 0, child: leftIcon!),
          if (rightIcon != null) Positioned(right: 0, child: rightIcon!)
        ]),
      ),
    );
  }
}
