import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relay/components/setting-menu-item.dart';
import 'package:relay/components/setting-menu.dart';
import 'package:relay/config/color.dart';
import 'package:relay/header/app_header.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppHeader(
          leftIcon: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () => Get.back(),
          ),
          title: 'Settings',
          bottomBorder: true,
        ),
        body: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                SettingMenu(icon: Icon(Icons.settings_outlined), title: '시스템'),
                SettingMenuItem(() {}, title: '버전 정보', content: '1.2.3'),
                SettingMenuItem(() {}, title: '버전 정보', content: '1.2.3'),
                SettingMenu(icon: Icon(Icons.settings_outlined), title: '시스템'),
                SettingMenuItem(() {}, title: '버전 정보', content: '1.2.3'),
                SettingMenuItem(() {}, title: '버전 정보', content: '1.2.3'),
                SettingMenu(icon: Icon(Icons.settings_outlined), title: '시스템'),
                SettingMenuItem(() {}, title: '버전 정보', content: '1.2.3'),
                SettingMenuItem(() {}, title: '버전 정보', content: '1.2.3'),
              ],
            )));
  }
}
