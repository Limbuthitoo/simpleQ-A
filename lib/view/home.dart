import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomquiz/controller/quiz_controller.dart';

class HomeVie extends StatelessWidget {
  const HomeVie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var quizController = Get.find<QuizController>();
    return Scaffold(body: Obx(
      () {
        if (quizController.isLoading.value == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: Get.size.height,
                  alignment: Alignment.center,
                  child: Container(
                    height: 500,
                    padding: EdgeInsets.all(18),
                    width: Get.size.width,
                    // height: 350,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 200,
                              child: Text(
                                quizController.quiz.value.question,
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 100,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      color: Colors.yellow,
                                      height: 80,
                                      child: Text(
                                        quizController.quiz.value.answer,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: Get.size.width,
                              height: 70,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Next Qustion")),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    ));
  }
}
