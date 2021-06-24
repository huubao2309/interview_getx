import 'package:interview_getx/api/api.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get
      ..put(ApiProvider(), permanent: true)
      ..put(ApiRepository(apiProvider: Get.find()), permanent: true);
  }
}
