// To parse this JSON data, do
//
//     final menu = menuFromJson(jsonString);

import 'dart:convert';

Menu menuFromJson(String str) => Menu.fromJson(json.decode(str));

String menuToJson(Menu data) => json.encode(data.toJson());

class Menu {
  int id;
  String name;
  String description;
  String imgIcon;
  String image;
  List<Items> items;

  Menu({
    this.id,
    this.name,
    this.description,
    this.imgIcon,
    this.image,
    this.items,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        imgIcon: json["imgIcon"],
        image: json["imgUrl"],
        items: List<Items>.from(json["items"].map((x) => Items.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "imgIcon": imgIcon,
        "image": image,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Items {
  int id;
  String name;
  String subtitle;
  String description;
  double price;
  String image;
  ItemPivot pivot;

  Items({
    this.id,
    this.name,
    this.subtitle,
    this.description,
    this.price,
    this.image,
    this.pivot,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        id: json["id"],
        name: json["name"],
        subtitle: json["subtitle"],
        description: json["description"],
        price: json["price"] != null ? json["price"].toDouble() : null,
        image: json["imgUrl"],
        pivot: json["pivot"] != null ? ItemPivot.fromJson(json["pivot"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "subtitle": subtitle,
        "description": description,
        "price": price,
        "image": image,
        "pivot": pivot.toJson(),
      };
}

class ItemPivot {
  ItemPivot({
    this.qty,
    this.mainPrice,
  });

  int qty;
  double mainPrice;
  double totalPrice;

  factory ItemPivot.fromJson(Map<String, dynamic> json) => ItemPivot(
        qty: json["qty"],
        mainPrice: json["main_price"] != null ? json["main_price"].toDouble() : null,
      );

  Map<String, dynamic> toJson() => {
        "qty": qty,
        "mainPrice": mainPrice,
      };
}
