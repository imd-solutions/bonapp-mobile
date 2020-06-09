import 'dart:convert';

CartItem cartFromJson(String str) => CartItem.fromJson(json.decode(str));

String cartToJson(CartItem data) => json.encode(data.toJson());

class CartItem {
  int id;
  String name;
  String subtitle;
  double price;
  int quantity;
  double totalPrice;

  CartItem({
    this.id,
    this.name,
    this.subtitle,
    this.price,
    this.quantity,
    this.totalPrice,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        name: json["name"],
        subtitle: json["subtitle"],
        price: json["price"].toDouble(),
        quantity: json["quantity"],
        totalPrice: json["total_price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "subtitle": subtitle,
        "price": price,
        "quantity": quantity,
        "total_price": totalPrice,
      };
}
