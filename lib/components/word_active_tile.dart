import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:relay/config/color.dart';
import 'package:relay/config/routes.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/controller/word_controller.dart';
import 'package:relay/types/word.dart';

class WordActiveTile extends StatefulWidget {
  final GroupController _groupController = Get.find<GroupController>();
  final WordController _wordController = Get.find<WordController>();
  final Word word;

  WordActiveTile({Key? key, required this.word}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WordActiveTileState();
}

class _WordActiveTileState extends State<WordActiveTile> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    Widget contentWidget = Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.word.meaning.isNotEmpty)
            Text(
              widget.word.meaning,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 18),
            ),
          if (widget.word.usage.isNotEmpty)
            Text(
              widget.word.usage,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16),
            )
        ],
      ),
    );

    return Slidable(
      key: Key(widget.word.id.toString()),
      actionPane: SlidableStrechActionPane(),
      dismissal: SlidableDismissal(
        dismissThresholds: <SlideActionType, double>{
          SlideActionType.primary: 1.0
        },
        child: SlidableDrawerDismissal(),
        onDismissed: (actionType) {
          widget._wordController.doneWord(widget.word);
          widget._groupController.dismissWord(widget.word);
        },
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          icon: Icons.delete_outlined,
          foregroundColor: MyColor.red,
          onTap: () {
            widget._wordController.deleteWord(widget.word);
          },
        ),
        IconSlideAction(
          caption: 'Edit',
          icon: Icons.edit_outlined,
          foregroundColor: MyColor.black,
          onTap: () {
            Get.toNamed(Routes.editWord, arguments: widget.word);
          },
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Done',
          icon: Icons.done,
          foregroundColor: MyColor.green,
          // onTap: () => widget._wordController.dismissWord(widget.word),
        )
      ],
      child: GestureDetector(
        onTap: () {
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8),
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
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    widget.word.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (isOpen) contentWidget
              ],
            ),
          ),
        ),
      ),
    );
  }
}
