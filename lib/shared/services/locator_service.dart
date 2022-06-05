import 'package:get/get.dart';
import 'package:interview_getx/shared/dialog_manager/services/dialog_service.dart';

class LocateService extends GetxService {
  Future<DialogService> init() async {
    Get.lazyPut<DialogService>(DialogService.new);
    return DialogService();
  }
}
