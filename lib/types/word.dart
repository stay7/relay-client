class DoneStatus {
  static final String OPEN = "OPEN";
  static final String DONE = "DONE";
}

class Word {
  int id;
  String name;
  String meaning = '';
  String usage = '';
  String doneStatus;
  DateTime createdAt;
  DateTime updatedAt;

  Word.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        meaning = json['meaning'],
        usage = json['usage'],
        doneStatus = json['doneStatus'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'];

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'name': name,
        'meaning': meaning,
        'usage': usage,
        'doneStatus': doneStatus,
      };
}
