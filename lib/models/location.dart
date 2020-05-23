import 'dart:convert';

Locations locationFromJson(String str) => Locations.fromJson(json.decode(str));

String locationToJson(Locations data) => json.encode(data.toJson());

class Locations {
  String id;
  String name;

  Locations({
    this.id,
    this.name,
  });

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
