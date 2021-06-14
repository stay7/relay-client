import 'dart:convert';
import 'dart:io';

import 'package:relay/provider/device_provider.dart';
import 'package:relay/provider/request_provider.dart';

class LoginController {
  /*
    Singleton constructor
   */
  static final LoginController _loginController = LoginController._internal();

  factory LoginController() => _loginController;
  LoginController._internal();

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
