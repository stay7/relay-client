import 'package:flutter/material.dart';

class GroupTile extends StatefulWidget {
  @override
  _GroupTileState createState() => _GroupTileState();
}

class _GroupTileState extends State<GroupTile> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      height: 50,
      child: Row(
        children: [
          Icon(
            Icons.folder_open,
          ),
        ],
      ),
    );
  }
}
