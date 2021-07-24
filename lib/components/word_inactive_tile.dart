import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:relay/config/color.dart';
import 'package:relay/controller/ui_controller.dart';
import 'package:relay/controller/word_controller.dart';
import 'package:relay/types/word.dart';

class WordInActiveTile extends StatefulWidget {
  final Word word;
  final WordController _wordController = Get.find<WordController>();
  final UiController _uiController = Get.find<UiController>();

  WordInActiveTile({required this.word});

  @override
  State<StatefulWidget> createState() => _WordInActiveTileState();
}

class _WordInActiveTileState extends State<WordInActiveTile> {
  bool isOpen = false;

  markOpen() {
    final word = widget.word;
    widget._wordController.openWord(word);
    widget._uiController.currentGroup!.value.moveWordToOpen(word);
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(widget.word.id.toString()),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          icon: Icons.delete_outlined,
          foregroundColor: MyColor.red,
          onTap: () {},
        ),
      ],
      secondaryActions: [
        IconSlideAction(
          caption: 'Open',
          icon: Icons.done,
          foregroundColor: MyColor.green,
          onTap: markOpen,
        )
      ],
      dismissal: SlidableDismissal(
        dismissThresholds: <SlideActionType, double>{
          SlideActionType.primary: 1.0
        },
        child: SlidableDrawerDismissal(),
        onDismissed: (actionType) => markOpen(),
      ),
      child: Container(
        margin: EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: MyColor.white,
            boxShadow: [
              BoxShadow(
                  color: const Color(0x40000000),
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.word.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
      actionPane: SlidableStrechActionPane(),
    );
  }
}
