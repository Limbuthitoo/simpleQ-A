import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomquiz/model/quiz_model_Q&A.dart';
import 'package:randomquiz/service/remote_service.dart';

class QuizController extends GetxController {
  final quiz = QuizModel(
    id: 0,
    answer: "",
    question: "",
  ).obs;
  var isLoading = true.obs;

  Future getQuiz() async {
    try {
      isLoading(true);
      final questionData = await fetchQuiz();
      if (questionData != null) {
        quiz.value = questionData as QuizModel;
      }
    } catch (error) {
      Get.snackbar(
        "error",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.yellow,
      );
    } finally {
      isLoading(false);
    }
  }
}
