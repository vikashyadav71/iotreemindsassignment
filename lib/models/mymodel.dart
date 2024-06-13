
import 'dart:convert';

class MyitemModel {
  final String id;
  final String username;
  final String item;
  final int v;

  MyitemModel({
    required this.id,
    required this.username,
    required this.item,
    required this.v,
  });

  MyitemModel copyWith({
    String? id,
    String? username,
    String? item,
    int? v,
  }) =>
      MyitemModel(
        id: id ?? this.id,
        username: username ?? this.username,
        item: item ?? this.item,
        v: v ?? this.v,
      );

  factory MyitemModel.fromRawJson(String str) => MyitemModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyitemModel.fromJson(Map<String, dynamic> json) => MyitemModel(
    id: json["_id"],
    username: json["username"],
    item: json["item"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "username": username,
    "item": item,
    "__v": v,
  };
}
