import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:relay/constants/color.dart';
import 'package:relay/constants/routes.dart';
import 'package:relay/pages/addword_page.dart';
import 'package:relay/pages/home_page.dart';
import 'package:relay/pages/setting_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initialRoute = Routes.login;

  //TODO: Check login
  var isUserLoggedIn = true;

  if (isUserLoggedIn) {
    initialRoute = Routes.home;
  }

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  MyApp({required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'relay',
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: MyColor.black,
          backgroundColor: MyColor.lightGrey),
      initialRoute: this.initialRoute,
      routes: {
        // '/login': (context) => LoginPage(),
        Routes.home: (context) => HomePage(),
        Routes.addWord: (context) => AddWordPage(),
        Routes.setting: (context) => SettingPage(),
      },
    );
  }
}
