import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:relay/constants/color.dart';
import 'package:relay/pages/addword_page.dart';
import 'package:relay/pages/home_page.dart';
import 'package:relay/pages/setting_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initialRoute = 'login';

  //TODO: Check login
  var isUserLoggedIn = true;

  if (isUserLoggedIn) {
    initialRoute = 'home';
  }

  runApp(MyApp(initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  MyApp(this.initialRoute);

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
        '/home': (context) => HomePage(),
        '/add_word': (context) => AddWordPage(),
        '/setting': (context) => SettingPage(),
      },
    );
  }
}
