import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:relay/provider/device_provider.dart';

class LoginController {
  /*
    Singleton constructor
   */
  static final LoginController _loginController = LoginController._internal();

  factory LoginController() => _loginController;
  LoginController._internal();

  checkLoggedIn(accessToken, refreshToken) async {}

  login(id, code) async {
    var deviceInfo = await DeviceProvider.getDeviceDetails();

    final response = await http.post(
        Uri.parse('http://localhost:3000/auth/login'),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $code'},
        body: {'id': '$id', 'deviceId': deviceInfo[2]});
    final responseJson = jsonDecode(response.body);
    return responseJson;
  }
}
