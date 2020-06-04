// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

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

  User({
    this.id,
    this.name,
    this.avatar,
    this.email,
    this.password,
    this.profile,
    this.messages,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: int.parse(json["id"]),
        name: json["name"],
        avatar: json["avatar"],
        email: json["email"],
        password: json["password"],
        profile: Profile.fromJson(json["profile"]),
        messages: json["messages"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatar": avatar,
        "email": email,
        "password": password,
        "profile": profile.toJson(),
        "messages": messages.toList()
      };
}

class Profile {
  int title;
  String firstname;
  String lastname;
  DateTime dob;
  int profession;
  int location;
  int points;
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
    this.points,
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
        profession: int.parse(json["profession"]),
        location: int.parse(json["location"]),
        points: int.parse(json["points"]),
        phoneNumber: json["phone_number"],
        mobileNumber: json["mobile_number"],
        mobileToken: json["mobile_token"],
        alerts: Alert.fromJson(json["alerts"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "firstname": firstname,
        "lastname": lastname,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "location": location,
        "profession": profession,
        "points": points,
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
        id: json["id"],
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
