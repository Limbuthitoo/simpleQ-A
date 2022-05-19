import 'package:get/get.dart';
import 'package:randomquiz/controller/quiz_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(QuizController());
  }
}
