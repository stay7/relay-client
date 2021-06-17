import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:relay/config/color.dart';
import 'package:relay/config/routes.dart';
import 'package:relay/pages/add_word_page.dart';
import 'package:relay/pages/home_page.dart';
import 'package:relay/pages/login_page.dart';
import 'package:relay/pages/setting_page.dart';
import 'package:relay/pages/splash_page.dart';
import 'package:relay/provider/device_provider.dart';
import 'package:relay/provider/preference_provider.dart';

import 'controller/group_controller.dart';
import 'controller/login_controller.dart';
import 'controller/ui_controller.dart';
import 'controller/user_controller.dart';

void main() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };

  const envPath = String.fromEnvironment("ENV", defaultValue: "env/.env_prod");
  await dotenv.load(fileName: envPath);
  await DeviceProvider().loadDeviceInfo();
  await PreferenceProvider().init();
  await Firebase.initializeApp();

  final UiController uiController = Get.put(UiController());
  final LoginController controller = Get.put(LoginController());
  final GroupController groupController = Get.put(GroupController());
  final UserController userController = Get.put(UserController());

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      getPages: [
        GetPage(name: Routes.splash, page: () => SplashPage()),
        GetPage(name: Routes.login, page: () => LoginPage()),
        GetPage(name: Routes.home, page: () => HomePage()),
        GetPage(name: Routes.addWord, page: () => AddWordPage()),
        GetPage(
            name: Routes.setting,
            page: () => SettingPage(),
            transition: Transition.downToUp)
      ],
      builder: (BuildContext context, Widget? widget) {
        Widget error = Text('...rendering error...');
        if (widget is Scaffold || widget is Navigator)
          error = Scaffold(body: Center(child: error));
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) => error;
        return widget!;
      },
    );
  }
}
