// To parse this JSON data, do
//
//     final menu = menuFromJson(jsonString);

import 'dart:convert';

Menu menuFromJson(String str) => Menu.fromJson(json.decode(str));

String menuToJson(Menu data) => json.encode(data.toJson());

class Menu {
  String name;
  String description;
  String imgIcon;
  String image;
  List<Items> items;

  Menu({
    this.name,
    this.description,
    this.imgIcon,
    this.image,
    this.items,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        name: json["name"],
        description: json["description"],
        imgIcon: json["imgIcon"],
        image: json["imgUrl"],
        items: List<Items>.from(json["items"].map((x) => Items.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "imgIcon": imgIcon,
        "image": image,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Items {
  String name;
  String subtitle;
  String description;
  double price;
  String image;

  Items({
    this.name,
    this.subtitle,
    this.description,
    this.price,
    this.image,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        name: json["name"],
        subtitle: json["subtitle"],
        description: json["description"],
        price: json["price"].toDouble(),
        image: json["imgUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "subtitle": subtitle,
        "description": description,
        "price": price,
        "image": image,
      };
}
