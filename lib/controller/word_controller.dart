import 'dart:collection';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:relay/provider/request_provider.dart';
import 'package:relay/types/group.dart';
import 'package:relay/types/word.dart';

class WordController extends GetxController {
  RxList<Word> activeWords = List<Word>.empty(growable: true).obs;
  RxList<Word> inActiveWords = List<Word>.empty(growable: true).obs;

  classifyWord(List<Word> groupWords) {
    var actives =
        groupWords.where((word) => word.doneStatus == DoneStatus.OPEN).toList();
    var inActives =
        groupWords.where((word) => word.doneStatus == DoneStatus.DONE).toList();
    activeWords(actives);
    inActiveWords(inActives);
  }

  Future<Word> addWord(
      Group group, String name, String? meaning, String? usage) async {
    final request = RequestProvider();
    Uri url = Uri.parse('${RequestProvider.baseUrl}/words');
    final response = await request.post(url,
        body: jsonEncode({
          'groupId': group.id,
          'name': name,
          'meaning': meaning,
          'usage': usage
        }));
    final responseJson = RequestProvider.returnResponse(response);
    return Word.fromJson(responseJson);
  }
}
