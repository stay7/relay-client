import 'package:flutter/cupertino.dart';
import 'package:get/instance_manager.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/controller/login_controller.dart';
import 'package:relay/controller/ui_controller.dart';
import 'package:relay/controller/user_controller.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    loadDependencies();
    super.initState();
  }

  /*
    Controller 생성 순서 중요
    1. UI
    2. Group
    3. Login
    ...
   */
  loadDependencies() {
    Get.put<UiController>(UiController(), permanent: true);
    Get.put<GroupController>(GroupController(), permanent: true);
    Get.put<LoginController>(LoginController(), permanent: true);
    Get.put<UserController>(UserController(), permanent: true);
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/welcome.png");
  }
}
