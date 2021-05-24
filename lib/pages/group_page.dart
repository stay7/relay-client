import 'package:flutter/material.dart';
import 'package:relay/group_header.dart';
import 'package:relay/group_tile.dart';

class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Drawer(
      child: GroupHeader(),
    ));
  }
}
