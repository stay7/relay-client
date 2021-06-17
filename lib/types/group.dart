import 'package:relay/types/word.dart';

class Group {
  int id;
  String name;
  String createdAt;
  String updatedAt;
  List<Word> words = List<Word>.empty(growable: true);

  Group(this.id, this.name, this.words, this.createdAt, this.updatedAt);

  Group.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        words = json['words'].map<Word>((word) => Word.fromJson(word)).toList(),
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'];
}
