import 'dart:convert';

Setting settingFromJson(String str) => Setting.fromJson(json.decode(str));

String settingToJson(Setting data) => json.encode(data.toJson());

class Setting {
  String brightness;
  int primary;
  int accent;
  int background;
  int introSlider;
  int introFull;

  Setting({
    this.brightness,
    this.primary,
    this.accent,
    this.background,
    this.introSlider,
    this.introFull,
  });

  factory Setting.fromJson(Map<String, dynamic> json) => Setting(
        brightness: json["brightness"],
        primary: json["primary"],
        accent: json["accent"],
        background: json["background"],
        introSlider: json["intro_slider"],
        introFull: json["intro_full"],
      );

  Map<String, dynamic> toJson() => {
        "brightness": brightness,
        "primary": primary,
        "accent": accent,
        "background": background,
        "intro_slider": introSlider,
        "intro_full": introFull,
      };
}
