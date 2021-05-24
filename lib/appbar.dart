import 'package:flutter/material.dart';
import 'constants/color.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  final String _title;
  final scaffoldKey;
  final Size _preferredSize;

  @override
  Size get preferredSize => this._preferredSize;

  HomeAppBar(this._title, this.scaffoldKey, double statusBarHeight)
      : _preferredSize = Size.fromHeight(statusBarHeight);

  Widget build(BuildContext context) {
    return PreferredSize(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            height: 48,
            decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(color: MyColor.black, width: 1),
                  bottom: BorderSide(color: MyColor.black, width: 1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    onPressed: () {
                      this.scaffoldKey.currentState.openDrawer();
                    },
                    icon: Icon(Icons.menu)),
                Text(_title, style: TextStyle(color: MyColor.black)),
                IconButton(onPressed: () {}, icon: Icon(Icons.search))
              ],
            )),
      ),
      preferredSize: this.preferredSize,
    );
  }
}
