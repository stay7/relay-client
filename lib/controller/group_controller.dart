import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:relay/types/group.dart';

class GroupController extends GetxController {
  var selectedGroup = Group(title: "test group").obs;

  change(Group group) {
    print(group.title);
    selectedGroup.update((val) {
      val!.title = group.title;
      val.count = group.count;
    });
  }
}
