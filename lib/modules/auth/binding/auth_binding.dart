import 'package:get/get.dart';
import 'package:interview_getx/shared/network/controllers/network_controller.dart';

import '../controller/auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<AuthController>(() => AuthController(apiRepository: Get.find()))
      ..lazyPut<NetworkController>(() => NetworkController());
  }
}
