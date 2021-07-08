import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:relay/controller/ui_controller.dart';
import 'package:relay/controller/word_controller.dart';
import 'package:relay/provider/preference_provider.dart';
import 'package:relay/provider/request_provider.dart';
import 'package:relay/types/group.dart';

class GroupController extends GetxController {
  final uiController = Get.find<UiController>();
  final wordController = Get.find<WordController>();
  final RequestProvider request = RequestProvider();

  RxInt selectedGroupIndex = 0.obs;
  RxList<Group> groups = List<Group>.empty(growable: true).obs;

  @override
  onInit() {
    ever(selectedGroupIndex, (int index) {
      wordController.classifyWord(groups[index].words);
    });
    super.onInit();
  }

  Group get selectedGroup {
    if (groups.isEmpty) throw FormatException('Group not exist');
    return groups[selectedGroupIndex.value];
  }

  List<Group> get unselectedGroups => groups
      .where((group) => group.id != groups[selectedGroupIndex.value].id)
      .toList();

  select(Group group) {
    final index = groups.indexOf(group);
    selectedGroupIndex(index);
    PreferenceProvider().saveSelectedGroupId(group.id);
  }

  selectLastSelectedGroup() {
    int lastSelectedGroupId = PreferenceProvider().loadSelectedGroupId();

    if (lastSelectedGroupId >= 0) {
      for (var i = 0; i < groups.length; i++) {
        if (groups[i].id == lastSelectedGroupId) selectedGroupIndex(i);
      }
    }
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

      selectLastSelectedGroup();
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
