import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:interview_getx/domain/usecases/local_storage/get_shared_preferences.dart';
import 'package:interview_getx/routes/app_pages.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/request/common_dialog_request.dart';
import 'package:interview_getx/shared/dialog_manager/services/dialog_service.dart';

class ExpiredTokenHandler {
  ExpiredTokenHandler._();

  static final ExpiredTokenHandler _instance = ExpiredTokenHandler._();

  static ExpiredTokenHandler get instance => _instance;

  Future<void> expiredTokenHandler() async {
    if (EasyLoading.isShow) {
      await EasyLoading.dismiss();
    }
    await _showDialogConfirm();
    await _clearStorage();
    await Get.offAllNamed(Routes.AUTH);
  }

  Future<void> _showDialogConfirm() async {
    final locator = Get.find<DialogService>();
    final request = CommonDialogRequest(
      title: 'error'.tr,
      description: 'expired_token'.tr,
      isMustTapButton: true,
    );
    final dialogResult = await locator.showDialog(request);
    if (dialogResult.confirmed) {
      print('User press confirm expired token');
      return;
    } else {
      print('User press confirm expired token');
      return;
    }
  }

  Future<void> _clearStorage() async {
    final storage = Get.find<GetSharedPreferences>();
    await storage.value.clearLocalStorage();
  }
}
