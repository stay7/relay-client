import 'package:flutter/cupertino.dart';
import 'package:relay/config/color.dart';

class PageTitle extends StatelessWidget {
  final String title;

  PageTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 50),
      child: Text(
        '$title',
        style: TextStyle(color: MyColor.black, fontSize: 18),
      ),
    );
  }
}
