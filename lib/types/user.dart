/*
{
  "id": "d03b4c11-6d1a-4b97-87b1-11ff5d80690f",
  "timezone": null,
  "lastLoginAt": "2021-06-13T07:33:58.453Z",
  "createdAt": "2021-06-13T07:33:58.453Z",
  "updatedAt": "2021-06-13T07:33:58.453Z",
  "deletedAt": null,
  "groups": []
}
 */

class User {
  final String id;
  final String timezone;
  final String lastLoginAt;
  final String createdAt;
  final String updatedAt;

  User(
      this.id, this.timezone, this.lastLoginAt, this.createdAt, this.updatedAt);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        timezone = json['timezone'],
        lastLoginAt = json['lastLoginAt'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'];

}
