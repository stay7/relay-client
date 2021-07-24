import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:relay/config/color.dart';
import 'package:relay/config/config.dart';
import 'package:relay/config/routes.dart';
import 'package:relay/controller/ui_controller.dart';

class HomeAppBar extends GetView<UiController> with PreferredSizeWidget {
  final Size _preferredSize;

  @override
  Size get preferredSize => this._preferredSize;

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
                bottom: BorderSide(color: MyColor.black, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: Icon(Icons.menu),
                ),
                controller.obx(
                  (state) => Text(
                    state!.name,
                    style: TextStyle(color: MyColor.black),
                  ),
                  onEmpty: Text(''),
                ),
                IconButton(
                  icon: SvgPicture.asset('assets/icons/edit_folder.svg'),
                  onPressed: () {
                    if (controller.state == null) return;
                    Get.toNamed(Routes.editGroup, arguments: controller.state);
                  },
                )
              ],
            )),
      ),
      preferredSize: this.preferredSize,
    );
  }
}
