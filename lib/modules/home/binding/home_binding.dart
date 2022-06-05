import 'package:get/get.dart';
import 'package:interview_getx/modules/home/controller/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(getListTodo: Get.find()));
  }
}
