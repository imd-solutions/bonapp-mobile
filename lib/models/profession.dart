import 'dart:convert';

Professions professionFromJson(String str) => Professions.fromJson(json.decode(str));

String professionToJson(Professions data) => json.encode(data.toJson());

class Professions {
  String id;
  String name;

  Professions({
    this.id,
    this.name,
  });

  factory Professions.fromJson(Map<String, dynamic> json) => Professions(
        id: json["id"],
        name: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
