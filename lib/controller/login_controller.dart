import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:relay/config/config.dart';
import 'package:relay/config/routes.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/provider/info_provider.dart';
import 'package:relay/provider/preference_provider.dart';
import 'package:relay/provider/request_provider.dart';

class LoginController extends GetxController {
  final isLogged = false.obs;
  final PreferenceProvider prefProvider = PreferenceProvider();

  @override
  onInit() {
    ever(isLogged, fireRoute);
    super.onInit();
  }

  Future<bool> hasValidSession() async {
    if (!prefProvider.hasToken()) return false;
    String accessToken = prefProvider.accessToken;
    String refreshToken = prefProvider.refreshToken;

    if (!JwtDecoder.isExpired(accessToken)) return true;
    if (JwtDecoder.isExpired(refreshToken)) return false;

    if (JwtDecoder.getRemainingTime(refreshToken) < AppConfig.refreshDeadline) {
      await renewRefreshToken();
      return true;
    }

    await renewAccessToken();
    return true;
  }

  fireRoute(isLogged) async {
    if (!isLogged) return Get.offNamed(Routes.login);

    final groupController = Get.find<GroupController>();
    await groupController.getGroups();
    Get.offNamed(Routes.home);
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
    await prefProvider.saveToken(
        responseJson['accessToken'], responseJson['refreshToken']);
    isLogged(true);
  }

  logout() async {
    await prefProvider.deleteToken();
    isLogged(false);
  }

  renewAccessToken() async {
    final refreshToken = prefProvider.refreshToken;
    Uri uri = Uri.parse('${RequestProvider.baseUrl}/auth/renew');

    final response = await http.post(
      uri,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: jsonEncode({'refreshToken': refreshToken}),
    );
    final responseJson = RequestProvider.returnResponse(response);
    final accessToken = responseJson['accessToken'];
    await prefProvider.saveToken(accessToken, refreshToken);
  }

  renewRefreshToken() async {
    //TODO
  }
}
