import 'dart:convert';

import 'package:relay/provider/request_provider.dart';

class UserController {
  static final UserController _userController = UserController.internal();

  factory UserController() => _userController;
  UserController.internal();

  getUser() async {
    RequestProvider request = RequestProvider();
    Uri uri = Uri.parse('${RequestProvider.baseUrl}/user');
    final response = await request.get(uri);
    final responseJson = jsonDecode(response.body);
    print(responseJson);
  }
}
