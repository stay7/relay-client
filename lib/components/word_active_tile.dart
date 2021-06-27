import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relay/config/color.dart';
import 'package:relay/types/word.dart';

class WordActiveTile extends StatelessWidget {
  final Word word;

  WordActiveTile({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(word.id.toString()),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: SizedBox(
          width: double.infinity,
          height: 90,
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: MyColor.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: const Color(0x40000000),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 0)
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  word.name,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  word.meaning,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          print('dismissed to right');
        } else {
          print('dismissed to left');
        }
      },
    );
  }
}
