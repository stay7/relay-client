import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relay/config/color.dart';

class CheckBoxBorder extends StatefulWidget {
  final String text;
  final bool checked;
  final Function(bool?)? onChanged;

  CheckBoxBorder({required this.text, this.checked = false, this.onChanged});

  @override
  State<StatefulWidget> createState() => _CheckBoxBorderState();
}

class _CheckBoxBorderState extends State<CheckBoxBorder> {
  late bool isChecked;

  @override
  void initState() {
    isChecked = widget.checked;
    super.initState();
  }

  handleOnChange(bool? flag) {
    widget.onChanged != null && widget.onChanged!(flag);
    setState(() {
      isChecked = flag!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: MyColor.black),
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: SizedBox(
        width: double.infinity,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            handleOnChange(!isChecked);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.text}',
                style: TextStyle(fontSize: 16, color: MyColor.black),
              ),
              Checkbox(
                value: isChecked,
                onChanged: handleOnChange,
                checkColor: MyColor.white,
                activeColor: MyColor.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
