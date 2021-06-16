import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
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
    PreferenceProvider().loadToken();
    ever(isLogged, fireRoute);
    Future.delayed(Duration(milliseconds: AppConfig.SplashDuration),
        () => checkLoggedIn());
    super.onInit();
  }

  fireRoute(logged) {
    print('session $logged');

    if (logged) {
      Get.offNamed(Routes.home);
    } else {
      Get.offAllNamed(Routes.login);
    }
  }

  login(id, code) async {
    Uri uri = Uri.parse('${RequestProvider.baseUrl}/auth/login');

    final response = await http.post(uri,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $code'},
        body: {'id': '$id', 'deviceId': DeviceProvider.deviceId});

    final responseJson = jsonDecode(response.body);
    return responseJson;
  }

  logout() async {
    await PreferenceProvider().deleteToken();
    isLogged.value = false;
  }

  checkLoggedIn() {
    isLogged.value = PreferenceProvider().hasToken();
  }

  renewAccessToken() async {
    final refreshToken = PreferenceProvider().getRefreshToken();
    Uri uri = Uri.parse('${RequestProvider.baseUrl}/auth/renew');
    final response = await http.post(uri, body: {'refreshToken': refreshToken});
    final responseJson = RequestProvider.returnResponse(response);
    final accessToken = responseJson['accessToken'];
    await PreferenceProvider().saveToken(accessToken, refreshToken);
  }
}
