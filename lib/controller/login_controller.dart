import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:relay/config/config.dart';
import 'package:relay/config/routes.dart';
import 'package:relay/provider/device_provider.dart';
import 'package:relay/provider/preference_provider.dart';
import 'package:relay/provider/request_provider.dart';

class LoginController extends GetxController {
  static final LoginController _loginController = LoginController._internal();
  final isLogged = false.obs;

  factory LoginController() => _loginController;
  LoginController._internal();

  @override
  onInit() {
    print('loggin controller onInit()');
    PreferenceProvider().loadToken();
    ever(isLogged, fireRoute);
    Future.delayed(Duration(milliseconds: AppConfig.SplashDuration), () {
      isLogged.value = PreferenceProvider().hasToken();
    });
    super.onInit();
  }

  fireRoute(logged) {
    print('fireRoute');
    if (logged) {
      Get.offNamed(Routes.home);
    } else
      Get.offAllNamed(Routes.login);
  }

  login(id, code) async {
    RequestProvider request = RequestProvider();
    Uri uri = Uri.parse('${RequestProvider.baseUrl}/auth/login');

    final response = await request.post(uri,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $code'},
        body: {'id': '$id', 'deviceId': DeviceProvider.deviceId});
    final responseJson = jsonDecode(response.body);
    return responseJson;
  }

  checkLoggedIn(accessToken, refreshToken) async {
    RequestProvider request = RequestProvider();
    Uri uri = Uri.parse('${RequestProvider.baseUrl}/auth/');

    final response = await request.post(uri, body: {});
    final responseJson = jsonDecode(response.body);
    return responseJson;
  }
}
