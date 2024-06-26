import 'package:relay/types/word.dart';

class Group {
  int id;
  String name;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
  List<Word> words = List<Word>.empty(growable: true);
  List<Word> openWords = List<Word>.empty(growable: true);
  List<Word> doneWords = List<Word>.empty(growable: true);

  Group({required this.id, required this.name, required this.words});

  Group.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        words = json['words'] != null
            ? json['words'].map<Word>((word) => Word.fromJson(word)).toList()
            : [],
        createdAt = DateTime.parse(json['createdAt']),
        updatedAt = DateTime.parse(json['updatedAt']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  classifyWords() {
    openWords.clear();
    doneWords.clear();

    for (var word in words) {
      if (word.doneStatus == DoneStatus.OPEN)
        openWords.add(word);
      else
        doneWords.add(word);
    }
  }

  deleteWords(List<Word> words) {
    this.words.removeWhere((word) => words.contains(word));
    classifyWords();
  }

  moveWordToOpen(Word word) {
    if (word.doneStatus == DoneStatus.OPEN && doneWords.contains(word)) {
      openWords.add(word);
      doneWords.remove(word);
    }
  }

  moveWordToDone(Word word) {
    if (word.doneStatus == DoneStatus.DONE && openWords.contains(word)) {
      openWords.remove(word);
      doneWords.insert(0, word);
    }
  }
}
