import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:relay/provider/request_provider.dart';
import 'package:relay/types/group.dart';

class GroupController extends GetxController {
  Rx<Group>? selectedGroup;
  RxList<Group>? groups;

  @override
  onInit() {
    super.onInit();
  }

  getGroups() async {
    final RequestProvider request = RequestProvider();
    Uri uri = Uri.parse('${RequestProvider.baseUrl}/group');
    final response = await request.get(uri);
    final responseJson = jsonDecode(response.body);
    print(responseJson);
    // this.groups = responseJson.gGroup.fromJson();
  }

  select(Group group) {
    selectedGroup!(group);
  }
}
