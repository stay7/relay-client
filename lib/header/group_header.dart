import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relay/config/color.dart';
import 'package:relay/config/config.dart';

class GroupHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
        margin: EdgeInsets.only(top: statusBarHeight),
        alignment: Alignment.topCenter,
        height: AppConfig.HeaderSize,
        decoration: BoxDecoration(
            color: MyColor.lightGrey,
            border: Border(top: BorderSide(color: MyColor.black, width: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.close,
                size: 24,
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings, size: 24))
          ],
        ));
  }
}
