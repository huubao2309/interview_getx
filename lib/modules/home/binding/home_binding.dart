import 'package:get/get.dart';
import 'package:interview_getx/shared/network/controllers/network_controller.dart';

import '../controller/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<HomeController>(() => HomeController(apiRepository: Get.find()))
      ..lazyPut<NetworkController>(() => NetworkController());
  }
}
