import 'package:get/get.dart';
import '../data/repository/api_repository.dart';
import '../data/service/api_provider.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get..put(ApiProvider(), permanent: true)..put(ApiRepository(apiProvider: Get.find()), permanent: true);
  }
}
