// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String name;
  String email;
  String password;
  Profile profile;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.profile,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        profile: Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
      "profile": profile.toJson(),
  };
}

class Profile {
  int title;
  String firstname;
  String lastname;
  DateTime dob;
  int profession;
  int location;
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
