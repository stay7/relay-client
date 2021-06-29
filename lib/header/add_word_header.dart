import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relay/components/back_icon.dart';
import 'package:relay/config/color.dart';
import 'package:relay/config/config.dart';
import 'package:relay/config/routes.dart';
import 'package:relay/controller/group_controller.dart';

class AddWordHeader extends StatelessWidget with PreferredSizeWidget {
  final Size _preferredSize = Size.fromHeight(AppConfig.HeaderSize);

  @override
  Size get preferredSize => this._preferredSize;

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return PreferredSize(
        child: Container(
          margin: EdgeInsets.only(top: statusBarHeight),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: MyColor.black),
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                left: 0,
                child: BackIconButton(),
              ),
              GroupTitle(),
            ],
          ),
        ),
        preferredSize: preferredSize);
  }
}

class GroupTitle extends StatelessWidget {
  final GroupController controller = Get.find<GroupController>();

  handleTap() {
    Get.toNamed(Routes.selectGroup);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleTap(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => Text('${controller.selectedGroup.name}',
              style: TextStyle(fontSize: 18, color: MyColor.black))),
          Icon(Icons.arrow_drop_down_outlined),
        ],
      ),
    );
  }
}
