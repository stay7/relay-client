import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:relay/controller/ui_controller.dart';
import 'package:relay/provider/request_provider.dart';
import 'package:relay/types/group.dart';

class GroupController extends GetxController {
  late Rx<Group> selectedGroup;
  RxList<Group> groups = List<Group>.empty(growable: true).obs;
  final uiController = Get.find<UiController>();

  getGroups() async {
    final RequestProvider request = RequestProvider();
    Uri uri = Uri.parse('${RequestProvider.baseUrl}/groups');
    try {
      final response = await request.get(uri);
      final json = RequestProvider.returnResponse(response) as List;
      final groupList = json.map((group) => Group.fromJson(group)).toList();
      groups(groupList);
      //TODO delete
      selectedGroup = groupList[0].obs;
    } catch (error) {
      print(error);
    }
  }

  select(Group group) {
    selectedGroup(group);
    uiController.closeDrawer();
  }
}
