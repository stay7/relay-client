import 'dart:convert';

import 'package:get/get.dart';
import 'package:relay/provider/request_provider.dart';
import 'package:relay/types/group.dart';
import 'package:relay/types/word.dart';

class WordController extends GetxController {
  final request = RequestProvider();

  //TODO: group에 default를 currentGroup으로 하여 구현
  Future<Word> addWord(
      Group group, String name, String? meaning, String? usage) async {
    Uri url = Uri.parse('${RequestProvider.baseUrl}/words');
    final response = await request.post(
      url,
      body: jsonEncode({
        'groupId': group.id,
        'name': name,
        'meaning': meaning,
        'usage': usage
      }),
    );
    final responseJson = RequestProvider.returnResponse(response);
    return Word.fromJson(responseJson);
  }

  openWord(Word word) {
    word.doneStatus = DoneStatus.OPEN;
    updateWord(word);
  }

  doneWord(Word word) {
    word.doneStatus = DoneStatus.DONE;
    updateWord(word);
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
  }
}
