// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String name;
  String email;
  String password;
  Profile profile;

  User({
    this.name,
    this.email,
    this.password,
    this.profile,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        profile: Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
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
  String phoneNumber;
  String mobileNumber;
  String mobileToken;

  Profile({
    this.title,
    this.firstname,
    this.lastname,
    this.dob,
    this.phoneNumber,
    this.mobileNumber,
    this.mobileToken,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        title: int.parse(json["title"]),
        firstname: json["firstname"],
        lastname: json["lastname"],
        dob: DateTime.parse(json["dob"]),
        phoneNumber: json["phone_number"],
        mobileNumber: json["mobile_number"],
        mobileToken: json["mobile_token"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "firstname": firstname,
        "lastname": lastname,
        "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "phone_number": phoneNumber,
        "mobile_number": mobileNumber,
        "mobile_token": mobileToken,
      };
}
