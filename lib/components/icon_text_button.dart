import 'package:flutter/cupertino.dart';
import 'package:relay/config/color.dart';

class IconTextButton extends StatelessWidget {
  final Icon icon;
  final String name;
  final double height;
  final GestureTapCallback? onTap;

  IconTextButton(
      {required this.icon, this.name = '', this.height = 50, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
              decoration: BoxDecoration(
                color: MyColor.white,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
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
              )),
        ),
      ),
    );
  }
}
