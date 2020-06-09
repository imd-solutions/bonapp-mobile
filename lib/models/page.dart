import 'dart:convert';

Page pageFromJson(String str) => Page.fromJson(json.decode(str));

String pageToJson(Page data) => json.encode(data.toJson());

class Page {
  Page({
    this.title,
    this.body,
  });

  String title;
  String body;

  factory Page.fromJson(Map<String, dynamic> json) => Page(
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
  };
}
