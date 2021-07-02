import 'package:get/get.dart';
import 'package:interview_getx/shared/network/controllers/network_controller.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkController>(() => NetworkController());
  }
}
