import 'dart:convert';

import 'package:get/get.dart';
import 'package:relay/provider/request_provider.dart';
import 'package:relay/types/group.dart';
import 'package:relay/types/word.dart';

class WordController extends GetxController {
  final request = RequestProvider();
  RxList<Word> activeWords = List<Word>.empty(growable: true).obs;
  RxList<Word> inActiveWords = List<Word>.empty(growable: true).obs;

  classifyWord(List<Word> groupWords) {
    var actives =
        groupWords.where((word) => word.doneStatus == DoneStatus.OPEN).toList();
    var inActives =
        groupWords.where((word) => word.doneStatus == DoneStatus.DONE).toList();
    // actives.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    activeWords(actives);
    inActiveWords(inActives);
  }

  dismissWord(Word word) {
    word.doneStatus = DoneStatus.DONE;
    this.inActiveWords.add(word);
    this.activeWords.remove(word);
  }

  Future<Word> addWord(
      Group group, String name, String? meaning, String? usage) async {
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

  Future<Word> updateWord(Word word) async {
    Uri url = Uri.parse('${RequestProvider.baseUrl}/words/${word.id}');
    final response = await request.patch(url, body: jsonEncode(word.toJson()));
    final responseJson = RequestProvider.returnResponse(response);
    return Word.fromJson(responseJson);
  }

  deleteWord(Word word) async {
    Uri url = Uri.parse('${RequestProvider.baseUrl}/words/${word.id}');
    final response = await request.delete(url);
    final responseJson = RequestProvider.returnResponse(response);

    //TODO check delete success
    activeWords.remove(word);
    inActiveWords.remove(word);
  }
}
