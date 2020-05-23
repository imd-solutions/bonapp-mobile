import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  String title;
  String excerpt;
  String body;
  String image;
  String status;

  Post({
    this.title,
    this.excerpt,
    this.body,
    this.image,
    this.status,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    title: json["title"],
    excerpt: json["excerpt"],
    body: json["body"],
    image: json["image"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "excerpt": excerpt,
    "body": body,
    "image": image,
    "status": status,
  };
}