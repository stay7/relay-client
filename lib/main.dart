import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:relay/config/color.dart';
import 'package:relay/config/routes.dart';
import 'package:relay/pages/add_word_page.dart';
import 'package:relay/pages/home_page.dart';
import 'package:relay/pages/login_page.dart';
import 'package:relay/pages/setting_page.dart';
import 'package:relay/pages/splash_page.dart';
import 'package:relay/provider/preference_provider.dart';

void main() async {
  const envPath = String.fromEnvironment("ENV", defaultValue: "env/.env_prod");

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PreferenceProvider().init();
  await dotenv.load(fileName: envPath);

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
          backgroundColor: MyColor.lightGrey,
          inputDecorationTheme: InputDecorationTheme(
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: MyColor.grey, width: 1.5)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: MyColor.blue, width: 1.5)),
            contentPadding: EdgeInsets.only(left: 10),
            hintStyle: TextStyle(color: MyColor.grey, fontSize: 16),
          )),
      initialRoute: Routes.splash,
      routes: {
        Routes.splash: (context) => SplashPage(),
        Routes.login: (context) => LoginPage(),
        Routes.home: (context) => HomePage(),
        Routes.addWord: (context) => AddWordPage(),
        Routes.setting: (context) => SettingPage(),
      },
    );
  }
}
