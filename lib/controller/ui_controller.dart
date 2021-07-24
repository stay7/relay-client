import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/provider/preference_provider.dart';
import 'package:relay/types/group.dart';
import 'package:relay/types/word.dart';

class UiController extends GetxController with StateMixin<Group> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  Rx<Group>? currentGroup;
  Rx<String> groupName = '그룹 선택'.obs;
  RxList<Word> openWords = List<Word>.empty(growable: true).obs;
  RxList<Word> doneWords = List<Word>.empty(growable: true).obs;

  setGroupWords() {
    openWords(currentGroup!.value.openWords);
    doneWords(currentGroup!.value.doneWords);
    openWords.refresh();
    doneWords.refresh();
  }

  refreshCurrentGroup() {
    final _groupController = Get.find<GroupController>();
    final group = _groupController.groups
        .singleWhere((group) => group.id == currentGroup!.value.id);
    currentGroup!(group);
    currentGroup!.refresh();
  }

  select(Group group) {
    change(group, status: RxStatus.success());
    currentGroup = group.obs;
    groupName(group.name);
    currentGroup!.value.classifyWords();
    setGroupWords();
    PreferenceProvider().saveSelectedGroupId(group.id);
  }

  clearGroup() {
    change(null, status: RxStatus.empty());
    currentGroup = null;
  }

  setGroupWordDone(Group group, Word word) {
    currentGroup!.value.moveWordToDone(word);
    setGroupWords();
  }

  setGroupWordOpen(Group group, Word word) {
    currentGroup!.value.moveWordToOpen(word);
    setGroupWords();
  }

  deleteWords(List<Word> words) {
    currentGroup!.value.deleteWords(words);
    setGroupWords();
  }

  selectLastSelectedGroup() {
    final _groupController = Get.find<GroupController>();
    int lastSelectedGroupId = PreferenceProvider().loadSelectedGroupId();

    try {
      final lastSelectedGroup = _groupController.groups
          .singleWhere((group) => group.id == lastSelectedGroupId);
      select(lastSelectedGroup);
    } on StateError {
      change(null, status: RxStatus.empty());
    }
  }

  openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }
}
