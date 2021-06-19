import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:relay/controller/ui_controller.dart';
import 'package:relay/provider/request_provider.dart';
import 'package:relay/types/group.dart';

class GroupController extends GetxController {
  final uiController = Get.find<UiController>();
  final RequestProvider request = RequestProvider();

  RxInt selectedGroupIndex = 0.obs;
  RxList<Group> groups = List<Group>.empty(growable: true).obs;

  select(Group group) {
    final index = groups.indexOf(group);
    selectedGroupIndex(index);
  }

  get selectedGroup => groups[selectedGroupIndex.value];
  get unselectedGroups {
    print('called');
    return groups
        .where((group) => group.id != groups[selectedGroupIndex.value].id)
        .toList();
  }

  getGroups() async {
    Uri uri = Uri.parse('${RequestProvider.baseUrl}/groups');
    try {
      final response = await request.get(uri);
      final json = RequestProvider.returnResponse(response) as List;
      final groupList = json.map((group) => Group.fromJson(group)).toList();

      if (groupList.length == 0) await addGroup('새 그룹');

      groupList.sort((b, a) => a.createdAt.compareTo(b.createdAt));
      groups(groupList);
      //TODO set latest selected group
      // selectedgroupIndex(0);
    } catch (error) {
      print(error);
    }
  }

  addGroup(String name) async {
    Uri url = Uri.parse('${RequestProvider.baseUrl}/groups');
    final response = await request.post(url, body: jsonEncode({'name': name}));
    final responseJson = RequestProvider.returnResponse(response);
    final group = Group.fromJson(responseJson);
    groups.add(group);
    return group;
  }
}
