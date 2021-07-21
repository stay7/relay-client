import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relay/controller/group_controller.dart';
import 'package:relay/provider/preference_provider.dart';
import 'package:relay/types/group.dart';
import 'package:relay/types/word.dart';

class UiController extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  late Rx<Group> currentGroup = Group(id: -1, name: 'null', words: []).obs;
  RxList<Word> openWords = List<Word>.empty(growable: true).obs;
  RxList<Word> doneWords = List<Word>.empty(growable: true).obs;

  setGroupWords() {
    openWords(currentGroup.value.openWords);
    doneWords(currentGroup.value.doneWords);
    openWords.refresh();
    doneWords.refresh();
  }

  get groupName => currentGroup.value.name;

  refreshCurrentGroup() {
    final _groupController = Get.find<GroupController>();
    final group = _groupController.groups
        .singleWhere((group) => group.id == currentGroup.value.id);
    currentGroup(group);
    currentGroup.refresh();
  }

  select(Group group) {
    currentGroup(group);
    currentGroup.value.classifyWords();
    setGroupWords();
    PreferenceProvider().saveSelectedGroupId(group.id);
  }

  setGroupWordDone(Group group, Word word) {
    currentGroup.value.moveWordToDone(word);
    setGroupWords();
  }

  setGroupWordOpen(Group group, Word word) {
    currentGroup.value.moveWordToOpen(word);
    setGroupWords();
  }

  deleteWords(List<Word> words) {
    currentGroup.value.deleteWords(words);
    setGroupWords();
  }

  selectLastSelectedGroup() {
    final _groupController = Get.find<GroupController>();
    int lastSelectedGroupId = PreferenceProvider().loadSelectedGroupId();

    final lastSelectedGroup = _groupController.groups
        .singleWhere((group) => group.id == lastSelectedGroupId);

    select(lastSelectedGroup);
  }

  openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }
}
