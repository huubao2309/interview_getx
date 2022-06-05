import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/request/common_dialog_request.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/response/common_dialog_response.dart';
import 'package:interview_getx/shared/dialog_manager/services/dialog_service.dart';

class DialogHandler {
  DialogHandler({
    required this.dialogService,
  });

  final DialogService dialogService;

  Future<bool> doShowDialog(CommonDialogRequest dialogRequest) async {
    final locator = Get.find<DialogService>();
    final dialogResult = await locator.showDialog(dialogRequest);

    if (dialogResult.confirmed) {
      debugPrint('User press confirm');
      return true;
    } else {
      debugPrint('User press cancel!');
      return false;
    }
  }

  Future<CommonDialogResponse> doShowTwoButtonDialog(CommonDialogRequest dialogRequest) async {
    final locator = Get.find<DialogService>();
    final result = await locator.showDialog(dialogRequest);

    return result;
  }

// Future<CustomDialogResponse> showCustomDialog({required CustomDialogRequest request}) async {
//   final locator = Get.find<DialogService>();
//   final result = await locator.showCustomDialog(request: request);
//
//   return result;
// }
}
