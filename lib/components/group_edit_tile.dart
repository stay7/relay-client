import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relay/types/word.dart';

class GroupEditTile extends StatelessWidget {
  final Word word;
  final VoidCallback? onPressed;

  GroupEditTile({required this.word, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: onPressed,
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(word.name, style: TextStyle(fontSize: 18)),
          )
        ],
      ),
    );
  }
}
