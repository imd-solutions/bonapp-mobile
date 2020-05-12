import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  int status;
  String title;
  String message;
  int colour;
  dynamic data;

  Message({this.status, this.title, this.message, this.data, this.colour});

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        status: json["status"],
        title: json["title"],
        message: json["message"],
        colour: json["colour"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
        "message": message,
        "colour": colour,
        "data": data,
      };
}
