import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:relay/constants/constants.dart';
import 'package:relay/controller/group_controller.dart';
import '../constants/color.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  final scaffoldKey;
  final Size _preferredSize;

  @override
  Size get preferredSize => this._preferredSize;

  final controller = Get.find<GroupController>();

  HomeAppBar(this.scaffoldKey, double statusBarHeight)
      : _preferredSize = Size.fromHeight(statusBarHeight);

  Widget build(BuildContext context) {
    return PreferredSize(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            height: AppConstants.HeaderSize,
            decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(color: MyColor.black, width: 1),
                  bottom: BorderSide(color: MyColor.black, width: 1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    onPressed: () {
                      this.scaffoldKey.currentState.openDrawer();
                    },
                    icon: Icon(Icons.menu)),
                Obx(() => Text('${controller.selectedGroup.value.title}',
                    style: TextStyle(color: MyColor.black))),
                IconButton(onPressed: () {}, icon: Icon(Icons.search))
              ],
            )),
      ),
      preferredSize: this.preferredSize,
    );
  }
}
