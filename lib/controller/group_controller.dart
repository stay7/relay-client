import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:relay/provider/request_provider.dart';
import 'package:relay/types/group.dart';

class GroupController extends GetxController {
  final RequestProvider request = RequestProvider();
  RxList<Group> groups = List<Group>.empty(growable: true).obs;

  updateGroup(Group group) async {
    Uri uri = Uri.parse('${RequestProvider.baseUrl}/groups');
    try {
      var content = group.toJson();
      final response = await request.patch(uri, body: jsonEncode(content));
      final responseJson = RequestProvider.returnResponse(response);
      final updatedGroup = Group.fromJson(responseJson);
      final groupIndex = groups.indexOf(group);
      groups[groupIndex] = updatedGroup;
    } catch (error) {
      print(error);
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

  deleteGroup(Group group) async {
    Uri uri = Uri.parse('${RequestProvider.baseUrl}/groups/${group.id}');
    final response = await request.delete(uri);
    final responseJson = RequestProvider.returnResponse(response);
    return responseJson['affected'] == 1;
  }
}
