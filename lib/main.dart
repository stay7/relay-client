import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relay/constants/color.dart';
import 'package:relay/constants/routes.dart';
import 'package:relay/pages/add_word_page.dart';
import 'package:relay/pages/home_page.dart';
import 'package:relay/pages/login_page.dart';
import 'package:relay/pages/setting_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initialRoute = Routes.login;

  //TODO: Check login
  var isUserLoggedIn = false;

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
          backgroundColor: MyColor.lightGrey,
          inputDecorationTheme: InputDecorationTheme(
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: MyColor.grey, width: 1.5)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: MyColor.blue, width: 1.5)),
            contentPadding: EdgeInsets.only(left: 10),
            hintStyle: TextStyle(color: MyColor.grey, fontSize: 16),
          )),
      initialRoute: this.initialRoute,
      routes: {
        Routes.login: (context) => LoginPage(),
        Routes.home: (context) => HomePage(),
        Routes.addWord: (context) => AddWordPage(),
        Routes.setting: (context) => SettingPage(),
      },
    );
  }
}
