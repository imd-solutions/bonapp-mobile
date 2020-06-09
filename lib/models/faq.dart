import 'dart:convert';

Faq faqFromJson(String str) => Faq.fromJson(json.decode(str));

String faqToJson(Faq data) => json.encode(data.toJson());

class Faq {
  Faq({
    this.question,
    this.answer,
  });

  String question;
  String answer;

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answer": answer,
      };
}
