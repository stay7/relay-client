import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/provider/preference_provider.dart';
import 'package:relay/types/group.dart';
import 'package:relay/types/word.dart';

class UiController extends GetxController with StateMixin<Group> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  Rx<String> groupName = '그룹 선택'.obs;
  RxList<Word> openWords = List<Word>.empty(growable: true).obs;
  RxList<Word> doneWords = List<Word>.empty(growable: true).obs;

  setGroupWords() {
    openWords(state!.openWords);
    doneWords(state!.doneWords);
    openWords.refresh();
    doneWords.refresh();
  }

  reloadGroup() {
    final _groupController = Get.find<GroupController>();
    final group =
        _groupController.groups.singleWhere((group) => group.id == state!.id);
    change(group);
  }

  select(Group group) {
    change(group, status: RxStatus.success());
    groupName(group.name);
    state!.classifyWords();
    setGroupWords();
    PreferenceProvider().saveSelectedGroupId(group.id);
  }

  addWord(Word word) {
    state!.words.add(word);
  }

  moveWordToOpen(Word word) {
    state!.moveWordToOpen(word);
  }

  moveWordToDone(Word word) {
    state!.moveWordToDone(word);
  }

  clearGroup() {
    change(null, status: RxStatus.empty());
  }

  deleteWords(List<Word> words) {
    state!.deleteWords(words);
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
