import 'package:flutter/material.dart';
import 'package:relay/constants/color.dart';
import 'package:relay/constants/types.dart';

class GroupTile extends StatefulWidget {
  Group groupData;
  GroupTile(this.groupData);

  @override
  _GroupTileState createState() => _GroupTileState();
}

class _GroupTileState extends State<GroupTile> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      height: 55,
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
              Expanded(child: Text(widget.groupData.title)),
              Text(widget.groupData.count.toString())
            ],
          )),
    );
  }
}
