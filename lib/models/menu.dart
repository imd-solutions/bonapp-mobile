// To parse this JSON data, do
//
//     final menu = menuFromJson(jsonString);

import 'dart:convert';

Menu menuFromJson(String str) => Menu.fromJson(json.decode(str));

String menuToJson(Menu data) => json.encode(data.toJson());

class Menu {
  String name;
  String description;
  String imgUrl;
  List<Items> items;

  Menu({
    this.name,
    this.description,
    this.imgUrl,
    this.items,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        name: json["name"],
        description: json["description"],
        imgUrl: json["imgUrl"],
        items: List<Items>.from(json["items"].map((x) => Items.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "imgUrl": imgUrl,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Items {
  String name;
  String description;
  double price;
  String imgUrl;

  Items({
    this.name,
    this.description,
    this.price,
    this.imgUrl,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        name: json["name"],
        description: json["description"],
        price: json["price"].toDouble(),
        imgUrl: json["imgUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "price": price,
        "imgUrl": imgUrl,
      };
}

final items = [
  Items(name: "Burgers", imgUrl: "assets/images/no_image.jpg", description: 'This is for the Burgers'),
  Items(name: "Drinks", imgUrl: "assets/images/no_image.jpg", description: 'This is for the Drinks'),
  Items(name: "Keebabs", imgUrl: "assets/images/no_image.jpg", description: 'This is for the Keebabs'),
  Items(name: "Salads", imgUrl: "assets/images/no_image.jpg", description: 'This is for the Salads'),
  Items(name: "Wraps", imgUrl: "assets/images/no_image.jpg", description: 'This is for the Wraps'),
];
