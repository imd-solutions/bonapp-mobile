import 'dart:convert';

Offer offerFromJson(String str) => Offer.fromJson(json.decode(str));

String offerToJson(Offer data) => json.encode(data.toJson());

class Offer {
  String name;
  String description;
  String image;
  int status;

  Offer({
    this.name,
    this.description,
    this.image,
    this.status,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    name: json["name"],
    description: json["description"],
    image: json["imgUrl"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "imgUrl": image,
    "status": status,
  };
}