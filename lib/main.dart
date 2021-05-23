import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:relay/constants/color.dart';
import 'package:relay/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'relay',
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: MyColor.black,
            backgroundColor: MyColor.lightGrey),
        home: HomePage());
  }
}
