import 'package:get/get.dart';
import 'package:interview_getx/shared/network/bindings/network_binding.dart';
import '../data/repository/api_repository.dart';
import '../data/service/api_provider.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get
      ..put(ApiProvider(), permanent: true)
      ..put(ApiRepository(apiProvider: Get.find()), permanent: true)
      ..put(NetworkBinding(), permanent: true); // keep the class in memory with "permanent:true"
  }
}
