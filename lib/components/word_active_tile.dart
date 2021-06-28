import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:relay/config/color.dart';
import 'package:relay/controller/word_controller.dart';
import 'package:relay/types/word.dart';

class WordActiveTile extends StatelessWidget {
  final WordController _wordController = Get.find<WordController>();
  final Word word;

  WordActiveTile({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(word.id.toString()),
      actionPane: SlidableStrechActionPane(),
      dismissal: SlidableDismissal(
        dismissThresholds: <SlideActionType, double>{
          SlideActionType.primary: 1.0
        },
        child: SlidableDrawerDismissal(),
        onDismissed: (actionType) => _wordController.dismissWord(word),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          icon: Icons.delete_outlined,
          foregroundColor: MyColor.red,
          onTap: () {
            //TODO : delete
            print('TODO delete');
          },
        )
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Done',
          icon: Icons.done,
          foregroundColor: MyColor.green,
          onTap: () => _wordController.dismissWord(word),
        )
      ],
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
    );
  }
}
