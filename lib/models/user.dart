// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_bonapp/models/location.dart';
import 'package:flutter_bonapp/models/nationality.dart';
import 'package:flutter_bonapp/models/profession.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String name;
  String avatar;
  String email;
  String password;
  Profile profile;
  List<Messages> messages;
  List<Order> orders;
  List<Voucher> vouchers;

  User({
    this.id,
    this.name,
    this.avatar,
    this.email,
    this.password,
    this.profile,
    this.messages,
    this.orders,
    this.vouchers,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: int.parse(json["id"]),
        name: json["name"],
        avatar: json["avatar"],
        email: json["email"],
        password: json["password"],
        profile: Profile.fromJson(json["profile"]),
        messages: json["messages"],
        orders: json["orders"],
        vouchers: json["vouchers"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatar": avatar,
        "email": email,
        "password": password,
        "profile": profile.toJson(),
        "messages": messages.toList(),
        "orders": orders.toList(),
        "vouchers": vouchers.toList(),
      };
}

class Profile {
  int title;
  String firstname;
  String lastname;
  DateTime dob;
  Professions profession;
  Locations location;
  Nationality nationality;
  int points;
  int foodStamp;
  int drinkStamp;
  String phoneNumber;
  String mobileNumber;
  String mobileToken;
  Alert alerts;

  Profile({
    this.title,
    this.firstname,
    this.lastname,
    this.dob,
    this.profession,
    this.location,
    this.nationality,
    this.points,
    this.drinkStamp,
    this.foodStamp,
    this.phoneNumber,
    this.mobileNumber,
    this.mobileToken,
    this.alerts,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        title: int.parse(json["title"]),
        firstname: json["firstname"],
        lastname: json["lastname"],
        dob: DateTime.parse(json["dob"]),
        profession: json["profession"],
        location: json["site"],
        nationality: json["nationality"],
        points: int.parse(json["points"]),
        foodStamp: int.parse(json["food_stamp"]),
        drinkStamp: int.parse(json["drink_stamp"]),
        phoneNumber: json["phone_number"],
        mobileNumber: json["mobile_number"],
        mobileToken: json["mobile_token"],
        alerts: Alert.fromJson(json["alerts"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "firstname": firstname,
        "lastname": lastname,
        "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "location": location,
        "profession": profession,
        "nationality": nationality,
        "points": points,
        "food_stamp": foodStamp,
        "drink_stamp": drinkStamp,
        "phone_number": phoneNumber,
        "mobile_number": mobileNumber,
        "mobile_token": mobileToken,
        "alerts": alerts.toJson(),
      };
}

class Alert {
  bool email;
  bool notification;
  bool text;

  Alert({this.email, this.notification, this.text});

  factory Alert.fromJson(Map<String, dynamic> json) => Alert(
        email: json["email"],
        notification: json["notification"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "notification": notification,
        "text": text,
      };
}

class Messages {
  int id;
  String title;
  String body;
  String read;
  DateTime createdAt;

  Messages({
    this.id,
    this.title,
    this.body,
    this.read,
    this.createdAt,
  });

  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
        id: int.parse(json["id"]),
        title: json["title"],
        body: json["body"],
        read: json["read"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "read": read,
        "created_at": createdAt.toIso8601String(),
      };
}

class Order {
  Order({
    this.id,
    this.status,
    this.billingSubtotal,
    this.billingTax,
    this.billingTotal,
    this.paymentMethod,
    this.paymentStatus,
    this.items,
    this.createdAt,
  });

  String id;
  String status;
  double billingSubtotal;
  double billingTax;
  double billingTotal;
  String paymentMethod;
  String paymentStatus;
  List<OrderItems> items;
  DateTime createdAt;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        status: json["status"],
        billingSubtotal: json["billing_subtotal"].toDouble(),
        billingTax: json["billing_tax"].toDouble(),
        billingTotal: json["billing_total"].toDouble(),
        paymentMethod: json["payment_method"],
        paymentStatus: json["payment_status"],
        items: List<OrderItems>.from(json["items"].map((x) => OrderItems.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "billing_subtotal": billingSubtotal,
        "billing_tax": billingTax,
        "billing_total": billingTotal,
        "payment_method": paymentMethod,
        "payment_status": paymentStatus,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "created_at": createdAt,
      };
}

class OrderItems {
  int id;
  String name;
  String subtitle;
  String description;
  double price;
  String image;
  Pivot pivot;

  OrderItems({
    this.id,
    this.name,
    this.subtitle,
    this.description,
    this.price,
    this.image,
    this.pivot,
  });

  factory OrderItems.fromJson(Map<String, dynamic> json) => OrderItems(
        id: json["id"],
        name: json["name"],
        subtitle: json["subtitle"],
        description: json["description"],
        price: json["price"].toDouble(),
        image: json["imgUrl"],
        pivot: Pivot.fromJson(json["pivot"]),
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

class Pivot {
  Pivot({
    this.quantity,
    this.price,
    this.totalPrice,
  });

  int quantity;
  double price;
  double totalPrice;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        quantity: json["quantity"],
        price: json["price"] != null ? json["price"].toDouble() : null,
        totalPrice: json["total_price"] != null ? json["total_price"].toDouble() : null,
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "price": price,
        "total_price": totalPrice,
      };
}

class Voucher {
  Voucher({
    this.id,
    this.name,
    this.subTitle,
    this.code,
  });

  String id;
  String name;
  String subTitle;
  String code;

  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
        id: json["id"],
        name: json["name"],
        subTitle: json["sub_title"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sub_title": subTitle,
        "code": code,
      };
}
