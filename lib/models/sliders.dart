import 'dart:convert';

Sliders sliderFromJson(String str) => Sliders.fromJson(json.decode(str));

String sliderToJson(Sliders data) => json.encode(data.toJson());

class Sliders {
  String title;
  String description;
  String imgUrl;
  int count;

  Sliders({
    this.title,
    this.description,
    this.imgUrl
  });

  factory Sliders.fromJson(Map<String, dynamic> json) => Sliders(
        title: json["title"],
        description: json["description"],
        imgUrl: json["imgUrl"]
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "imgUrl": imgUrl
      };
}
