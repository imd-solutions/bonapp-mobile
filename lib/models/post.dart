import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  String title;
  String siteLink;
  String excerpt;
  String body;
  String image;
  String status;

  Post({
    this.title,
    this.siteLink,
    this.excerpt,
    this.body,
    this.image,
    this.status,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        title: json["title"],
        siteLink: json["site_link"],
        excerpt: json["excerpt"],
        body: json["body"],
        image: json["image"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "site_link": siteLink,
        "excerpt": excerpt,
        "body": body,
        "image": image,
        "status": status,
      };
}
