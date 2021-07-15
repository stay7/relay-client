import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:relay/config/color.dart';
import 'package:relay/config/config.dart';
import 'package:relay/config/routes.dart';
import 'package:relay/controller/group_controller.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  final groupController = Get.find<GroupController>();
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
                    icon: Icon(Icons.menu)),
                Obx(() {
                  return Text('${groupController.currentGroup.value.name}',
                      style: TextStyle(color: MyColor.black));
                }),
                IconButton(
                  icon: SvgPicture.asset('assets/icons/edit_folder.svg'),
                  onPressed: () {
                    Get.toNamed(Routes.editGroup,
                        arguments: groupController.currentGroup.value);
                  },
                )
              ],
            )),
      ),
      preferredSize: this.preferredSize,
    );
  }
}
