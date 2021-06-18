import 'dart:convert';

import 'package:get/get.dart';
import 'package:relay/provider/request_provider.dart';
import 'package:relay/types/user.dart';

class UserController extends GetxController {
  Rx<User>? user;

  getUser() async {
    RequestProvider request = RequestProvider();
    Uri uri = Uri.parse('${RequestProvider.baseUrl}/user');
    final response = await request.get(uri);
    final responseJson = jsonDecode(response.body);
    this.user = User.fromJson(responseJson).obs;
    return this.user;
  }
}
