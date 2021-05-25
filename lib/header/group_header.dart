import 'package:flutter/material.dart';
import 'package:relay/constants/color.dart';
import 'package:relay/constants/constants.dart';

class GroupHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
        margin: EdgeInsets.only(top: statusBarHeight),
        alignment: Alignment.topCenter,
        height: AppConstants.HeaderSize,
        decoration: BoxDecoration(
            color: MyColor.lightGrey,
            border: Border(top: BorderSide(color: MyColor.black, width: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  size: 24,
                )),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings, size: 24))
          ],
        ));
  }
}