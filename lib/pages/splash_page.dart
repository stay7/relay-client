import 'package:flutter/cupertino.dart';
import 'package:get/instance_manager.dart';
import 'package:relay/controller/login_controller.dart';

class SplashPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/welcome.png");
  }
}
