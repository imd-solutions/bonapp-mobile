import 'dart:convert';

Nationality nationalityFromJson(String str) =>
    Nationality.fromJson(json.decode(str));

String nationalityToJson(Nationality data) => json.encode(data.toJson());

class Nationality {
  String id;
  String name;

  Nationality({
    this.id,
    this.name,
  });

  factory Nationality.fromJson(Map<String, dynamic> json) => Nationality(
        id: json != null ? json["id"] : '0',
        name: json != null ? json["name"] : 'Please complete the form.',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
