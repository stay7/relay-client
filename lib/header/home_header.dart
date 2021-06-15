import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relay/config/color.dart';
import 'package:relay/config/config.dart';
import 'package:relay/controller/group_controller.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  final Size _preferredSize;

  @override
  Size get preferredSize => this._preferredSize;

  final controller = Get.find<GroupController>();

  HomeAppBar() : _preferredSize = Size.fromHeight(AppConfig.HeaderSize);

  Widget build(BuildContext context) {
    return PreferredSize(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            height: AppConfig.HeaderSize,
            decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(color: MyColor.black, width: 1),
                  bottom: BorderSide(color: MyColor.black, width: 1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: Icon(Icons.menu)),
                Obx(() => Text('controller.selectedGroup.value.title',
                    style: TextStyle(color: MyColor.black))),
                IconButton(onPressed: () {}, icon: Icon(Icons.search))
              ],
            )),
      ),
      preferredSize: this.preferredSize,
    );
  }
}
