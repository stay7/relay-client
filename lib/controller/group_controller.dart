import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:relay/provider/preference_provider.dart';
import 'package:relay/provider/request_provider.dart';
import 'package:relay/types/group.dart';
import 'package:relay/types/word.dart';

class GroupController extends GetxController {
  final RequestProvider request = RequestProvider();

  RxList<Group> groups = List<Group>.empty(growable: true).obs;
  late Rx<Group> currentGroup = Group(id: -1, name: 'null', words: []).obs;
  RxList<Word> openWords = List<Word>.empty(growable: true).obs;
  RxList<Word> doneWords = List<Word>.empty(growable: true).obs;

  select(Group group) {
    currentGroup(group);
    currentGroup.value.classifyWords();
    openWords(currentGroup.value.openWords);
    doneWords(currentGroup.value.doneWords);
    PreferenceProvider().saveSelectedGroupId(group.id);
  }

  moveToDone(Word word) {
    currentGroup.value.moveToDone(word);
    openWords(currentGroup.value.openWords);
    doneWords(currentGroup.value.doneWords);
    openWords.refresh();
    doneWords.refresh();
  }

  moveToOpen(Word word) {
    currentGroup.value.moveToOpen(word);
    openWords(currentGroup.value.openWords);
    doneWords(currentGroup.value.doneWords);
    openWords.refresh();
    doneWords.refresh();
  }

  selectLastSelectedGroup() {
    int lastSelectedGroupId = PreferenceProvider().loadSelectedGroupId();

    Group lastGroup =
        groups.singleWhere((group) => group.id == lastSelectedGroupId);
    select(lastGroup);
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
