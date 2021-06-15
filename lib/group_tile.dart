import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:relay/config/color.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/types/group.dart';

class GroupTile extends StatefulWidget {
  Group groupData;
  GroupTile(this.groupData);

  @override
  _GroupTileState createState() => _GroupTileState();
}

class _GroupTileState extends State<GroupTile> {
  final controller = Get.find<GroupController>();

  @override
  Widget build(BuildContext context) {
    // bool selected = controller.selectedGroup.value.id == widget.groupData;

    return SizedBox(
      width: 340,
      height: 55,
      child: GestureDetector(
        onTap: () {
          controller.select(widget.groupData);
        },
        child: Container(
            margin: EdgeInsets.only(bottom: 8),
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                color: MyColor.white, borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: [
                Icon(
                  Icons.folder_open,
                  size: 24,
                ),
                // Expanded(child: Text(widget.groupData.title)),
                // Text(widget.groupData.count.toString())
              ],
            )),
      ),
    );
  }
}
