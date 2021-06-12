import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:relay/controller/device_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  /*
    Singleton constructor
   */
  static final LoginController _loginController = LoginController._internal();

  factory LoginController() => _loginController;
  LoginController._internal();

  login(id, code) async {
    var deviceInfo = await DeviceController.getDeviceDetails();

    final response = await http.post(
        Uri.parse('http://localhost:3000/auth/login'),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $code'},
        body: {'id': '$id', 'deviceId': deviceInfo[2]});
    final responseJson = jsonDecode(response.body);
    return responseJson;
  }

  saveToken(accessToken, refreshToken) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('accessToken', accessToken);
    await sharedPreferences.setString('refreshToken', refreshToken);
  }

  loadToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString('accessToken');
    final refreshToken = sharedPreferences.getString('refreshToken');
    return [accessToken, refreshToken];
  }
}
