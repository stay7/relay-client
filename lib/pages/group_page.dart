import 'package:flutter/material.dart';
import 'package:relay/constants/types.dart';
import 'package:relay/header/group_header.dart';
import 'package:relay/group_tile.dart';

class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Drawer(
            child: Column(
                children: [GroupHeader(), Expanded(child: GroupList())])));
  }
}

class GroupList extends StatefulWidget {
  _GroupList createState() => _GroupList();
}

class _GroupList extends State<GroupList> {
  var groups = [
    Group(title: "TOFEL1", count: 1),
    Group(title: "TOFEL2", count: 2),
    Group(title: "TOFEL3", count: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 18, right: 18),
      itemCount: groups.length,
      itemBuilder: (context, index) => GroupTile(groups[index]),
    );
  }
}
