import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relay/config/color.dart';
import 'package:relay/config/config.dart';
import 'package:relay/controller/group_controller.dart';

class AddWordHeader extends StatelessWidget with PreferredSizeWidget {
  final Size _preferredSize = Size.fromHeight(AppConfig.HeaderSize);

  @override
  Size get preferredSize => this._preferredSize;

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    GroupController controller = Get.find<GroupController>();

    return PreferredSize(
        child: Container(
          margin: EdgeInsets.only(top: statusBarHeight),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: MyColor.black),
            ),
          ),
          child: Stack(
            children: [
              IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: MyColor.black,
                    size: 24,
                  )),
              Container(
                alignment: Alignment.center,
                child: Obx(
                  () => Text('${controller.selectedGroup.value.name}',
                      style: TextStyle(fontSize: 18, color: MyColor.black)),
                ),
              ),
            ],
          ),
        ),
        preferredSize: preferredSize);
  }
}
