import 'package:flutter/material.dart';
import 'constants/color.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  final String _title;
  var scaffoldKey;
  Size _preferredSize = Size.fromHeight(80);

  @override
  Size get preferredSize => this._preferredSize;

  HomeAppBar(this._title, this.scaffoldKey);

  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    this._preferredSize = Size.fromHeight(statusBarHeight);

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
