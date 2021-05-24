import 'package:flutter/material.dart';
import 'package:relay/constants/types.dart';
import 'package:relay/group_header.dart';
import 'package:relay/group_tile.dart';

class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Drawer(
            child: Column(
      children: [GroupHeader(), Expanded(child: GroupList())],
    )));
  }
}

class GroupList extends StatefulWidget {
  _GroupList createState() => _GroupList();
}

class _GroupList extends State<GroupList> {
  var groups = [Group("TOFEL1", 1), Group("TOFEL2", 2), Group("TOFEL3", 3)];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 18, right: 18),
      itemCount: groups.length,
      itemBuilder: (context, index) => GroupTile(groups[index]),
    );
  }
}
