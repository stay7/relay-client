import 'package:flutter/cupertino.dart';
import 'package:get/instance_manager.dart';
import 'package:relay/config/config.dart';
import 'package:relay/controller/config_controller.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/controller/login_controller.dart';
import 'package:relay/controller/ui_controller.dart';
import 'package:relay/controller/user_controller.dart';
import 'package:relay/controller/word_controller.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    loadDependencies();
    Future.delayed(Duration(milliseconds: AppConfig.SplashDuration), () async {
      LoginController loginController = Get.find<LoginController>();
      bool isValidSession = await loginController.hasValidSession();
      loginController.isLogged(isValidSession);
    });
    super.initState();
  }

  loadDependencies() {
    /*
    Controller 생성 순서 중요
    1. UI
    2. Word
    3. Group
    4. Login
    ...
   */
    Get.put<UiController>(UiController(), permanent: true);
    Get.put<LoginController>(LoginController(), permanent: true);
    Get.put<WordController>(WordController(), permanent: true);
    Get.put<GroupController>(GroupController(), permanent: true);
    Get.put<UserController>(UserController(), permanent: true);
    Get.put<ConfigController>(ConfigController(), permanent: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash_background.jpg'))),
    );
  }
}
