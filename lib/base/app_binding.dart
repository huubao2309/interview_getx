import 'package:get/get.dart';
import 'package:interview_getx/api/repository/api_repository.dart';
import 'package:interview_getx/api/service/api_provider.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get..put(ApiProvider(), permanent: true)..put(ApiRepository(apiProvider: Get.find()), permanent: true);
  }
}
