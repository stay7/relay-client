import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:relay/config/config.dart';
import 'package:relay/config/routes.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/provider/info_provider.dart';
import 'package:relay/provider/preference_provider.dart';
import 'package:relay/provider/request_provider.dart';

class LoginController extends GetxController {
  final isLogged = false.obs;

  @override
  onInit() {
    ever(isLogged, fireRoute);
    Future.delayed(Duration(milliseconds: AppConfig.SplashDuration),
        () => isLogged(PreferenceProvider().hasToken()));
    super.onInit();
  }

  fireRoute(logged) async {
    if (logged) {
      final groupController = Get.find<GroupController>();
      await groupController.getGroups();
      Get.snackbar('로그인 되었습니다.', '로그인 성공');
      Get.offNamed(Routes.home);
    } else {
      Get.snackbar('로그인 실패.', '뭐야?');
      Get.offAllNamed(Routes.login);
    }
  }

  login(id, code) async {
    Uri uri = Uri.parse('${RequestProvider.baseUrl}/auth/login');

    final response = await http.post(
      uri,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $code'
      },
      body: jsonEncode({'id': '$id', 'deviceId': InfoProvider.deviceId}),
    );

    final responseJson = jsonDecode(response.body);
    await PreferenceProvider()
        .saveToken(responseJson['accessToken'], responseJson['refreshToken']);
    isLogged(PreferenceProvider().hasToken());
  }

  logout() async {
    await PreferenceProvider().deleteToken();
    isLogged.value = false;
  }

  renewAccessToken() async {
    final refreshToken = PreferenceProvider().getRefreshToken();
    Uri uri = Uri.parse('${RequestProvider.baseUrl}/auth/renew');

    final response = await http.post(
      uri,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: jsonEncode({'refreshToken': refreshToken}),
    );
    final responseJson = RequestProvider.returnResponse(response);
    final accessToken = responseJson['accessToken'];
    await PreferenceProvider().saveToken(accessToken, refreshToken);
  }
}
