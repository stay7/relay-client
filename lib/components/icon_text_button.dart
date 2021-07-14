import 'package:flutter/cupertino.dart';

class IconTextButton extends StatelessWidget {
  final Icon icon;
  final String name;
  final double height;

  IconTextButton({required this.icon, this.name = '', this.height = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Row(
        children: [
          icon,
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 15),
              child: Text(name),
            ),
          ),
        ],
      ),
    );
  }
}
