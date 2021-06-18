import 'dart:convert';

import 'package:get/get.dart';
import 'package:relay/provider/request_provider.dart';
import 'package:relay/types/group.dart';
import 'package:relay/types/word.dart';
import 'package:http/http.dart' as http;

class WordController extends GetxController {
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
