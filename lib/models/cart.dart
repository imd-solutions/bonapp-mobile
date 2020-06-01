import 'dart:convert';

import 'package:flutter/cupertino.dart';

CartItem cartFromJson(String str) => CartItem.fromJson(json.decode(str));

String cartToJson(CartItem data) => json.encode(data.toJson());

class CartItem {
  int id;
  String name;
  double price;
  int quantity;
  double totalPrice;

  CartItem({
    this.id,
    this.name,
    this.price,
    this.quantity,
    this.totalPrice,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        name: json["name"],
        price: json["price"].toDouble(),
        quantity: json["quantity"],
        totalPrice: json["total_price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "quantity": quantity,
        "total_price": totalPrice,
      };
}
