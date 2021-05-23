import 'package:flutter/material.dart';
import 'constants/color.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => new Size.fromHeight(80.0);
  final String _title;

  HomeAppBar(this._title);

  Widget build(BuildContext context) {
    return PreferredSize(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            height: 48,
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(color: MyColor.black, width: 1),
                  bottom: BorderSide(color: MyColor.black, width: 1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.menu),
                Text(_title, style: TextStyle(color: MyColor.black)),
                Icon(Icons.search)
              ],
            )),
      ),
      preferredSize: this.preferredSize,
    );
  }
}
