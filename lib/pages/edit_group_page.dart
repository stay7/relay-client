import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relay/components/back_icon.dart';
import 'package:relay/components/icon_text_button.dart';
import 'package:relay/config/color.dart';
import 'package:relay/config/config.dart';
import 'package:relay/header/app_header.dart';

class EditGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        leftIcon: BackIconButton(),
        rightIcon: IconButton(
          icon: Icon(Icons.done_outlined),
          onPressed: () {},
        ),
      ),
      body: Container(
        margin:
            EdgeInsets.symmetric(horizontal: AppConfig.PageMarginHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset('assets/images/folder.svg'),
            IconTextButton(
              icon: Icon(
                Icons.remove_circle_outlined,
                size: 24,
                color: MyColor.red,
              ),
              name: '그룹 삭제',
            )
          ],
        ),
      ),
    );
  }
}
