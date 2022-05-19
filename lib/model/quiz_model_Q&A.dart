// To parse required this JSON data, do
//
//     final quizModel = quizModelFromJson(jsonString);

import 'dart:convert';

List<QuizModel> quizModelFromJson(String str) =>
    List<QuizModel>.from(json.decode(str).map((x) => QuizModel.fromJson(x)));

String quizModelToJson(List<QuizModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizModel {
  QuizModel({
    required this.id,
    required this.answer,
    required this.question,
  });

  int id;
  String answer;
  String question;

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        id: json["id"],
        answer: json["answer"],
        question: json["question"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "answer": answer,
        "question": question,
      };
}
