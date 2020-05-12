import 'dart:convert';

Titles titleFromJson(String str) => Titles.fromJson(json.decode(str));

String titleToJson(Titles data) => json.encode(data.toJson());

class Titles {
  String id;
  String name;

  Titles({
    this.id,
    this.name,
  });

  factory Titles.fromJson(Map<String, dynamic> json) => Titles(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}