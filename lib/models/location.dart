import 'dart:convert';

Locations locationFromJson(String str) => Locations.fromJson(json.decode(str));

String locationToJson(Locations data) => json.encode(data.toJson());

class Locations {
  String id;
  String name;
  List<Branch> branches;

  Locations({
    this.id,
    this.name,
    this.branches,
  });

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
        id: json["id"],
        name: json["name"],
        branches: json["branches"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "branches": branches.toList(),
      };
}

class Branch {
  int id;
  String name;
  List<Delivery> deliveries;

  Branch({
    this.id,
    this.name,
    this.deliveries,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: int.parse(json["id"]),
        name: json["name"],
        deliveries: json["deliveries"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "deliveries": deliveries.toList(),
      };
}

class Delivery {
  int id;
  String delivery_time;

  Delivery({
    this.id,
    this.delivery_time,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        id: json["id"],
        delivery_time: json["delivery_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "delivery_time": delivery_time,
      };
}
