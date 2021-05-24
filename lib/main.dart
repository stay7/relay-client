import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:relay/constants/color.dart';
import 'package:relay/pages/addword_page.dart';
import 'package:relay/pages/home_page.dart';
import 'package:relay/pages/setting_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'relay',
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: MyColor.black,
          backgroundColor: MyColor.lightGrey),
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/add_word': (context) => AddWordPage(),
        '/setting': (context) => SettingPage(),
      },
    );
  }
}
