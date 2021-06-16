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
    getGroups();
    super.onInit();
  }

  getGroups() async {
    final RequestProvider request = RequestProvider();
    Uri uri = Uri.parse('${RequestProvider.baseUrl}/groups');
    try {
      final response = await request.get(uri);
      final responseJson = RequestProvider.returnResponse(response) as List;
      print(responseJson);


      final groupList =
      responseJson.map((group) => Group.fromJson(group)).toList();

      groups = groupList.obs;
      if (groups != null) {
        print(groups![0]);
      }
    }
    catch (error) {
      print(error);
    }
  }

  select(Group group) {
    selectedGroup!(group);
  }
}
