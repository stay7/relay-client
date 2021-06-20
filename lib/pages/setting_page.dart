import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    );
  }
}
