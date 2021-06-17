import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:relay/provider/request_provider.dart';
import 'package:relay/types/group.dart';

class GroupController extends GetxController {
  Rx<Group>? selectedGroup;
  RxBool isLoading = false.obs;
  RxList<Group> groups = List<Group>.empty(growable: true).obs;

  @override
  onInit() {
    getGroups();
    super.onInit();
  }

  getGroups() async {
    isLoading(true);
    final RequestProvider request = RequestProvider();
    Uri uri = Uri.parse('${RequestProvider.baseUrl}/groups');
    try {
      final response = await request.get(uri);
      final json = RequestProvider.returnResponse(response) as List;
      final groupList = json.map((group) => Group.fromJson(group)).toList();
      groups(groupList);
      isLoading(false);
    } catch (error) {
      print(error);
      isLoading(false);
    }
  }

  select(Group group) {
    selectedGroup!(group);
  }
}
