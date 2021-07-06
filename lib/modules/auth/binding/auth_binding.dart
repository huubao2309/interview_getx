import 'package:get/get.dart';
import 'package:interview_getx/data/base/base_binding.dart';

import '../controller/auth_controller.dart';

class AuthBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<AuthController>(() => AuthController(apiRepository: Get.find()));
  }
}
