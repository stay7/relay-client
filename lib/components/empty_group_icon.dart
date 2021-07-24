import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relay/config/color.dart';

class EmptyGroupIcon extends StatelessWidget {
  static const double BottomPadding = 200;

  const EmptyGroupIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/empty_group.svg'),
        Text(
          '그룹을 선택해주세요',
          style: TextStyle(fontSize: 25, color: MyColor.blue),
          textAlign: TextAlign.center,
        ),
        Container(height: BottomPadding),
      ],
    );
  }
}
