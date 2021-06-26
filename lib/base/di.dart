import 'package:get/get.dart';
import 'package:interview_getx/shared/services/config_service.dart';
import '../shared/services/locator_service.dart';
import '../shared/services/storage_service.dart';

class DependencyInjection {
  static Future<void> init(String environment) async {
    await Get.putAsync(() => ConfigService().init(environment));
    await Get.putAsync(() => StorageService().init());
    await Get.putAsync(() => LocateService().init());
  }
}
