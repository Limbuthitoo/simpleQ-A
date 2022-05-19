import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:randomquiz/model/quiz_model_Q&A.dart';
import 'package:randomquiz/view/error.dart';

var client = http.Client();

Future<List<QuizModel>> fetchQuiz() async {
  final response =
      await client.get(Uri.parse("https://jservice.io/api/random"));
  if (response.statusCode == 200) {
    final question = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return question.map<QuizModel>((json) => QuizModel.fromJson(json)).toList();
  } else {
    return throw Exception(
      Get.to(() => const ErrorView()),
    );
  }
}
