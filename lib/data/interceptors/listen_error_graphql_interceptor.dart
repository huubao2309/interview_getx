import 'package:interview_getx/data/common/define_field.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/request/common_dialog_request.dart';
import 'package:get/get.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/type_dialog.dart';
import 'package:interview_getx/shared/network/constants/constants.dart';

abstract class ListenErrorGraphQL {
  CommonDialogRequest handleErrorGraphQLResponse(Object e) {
    var dialogRequest = CommonDialogRequest(description: 'unknown_error'.tr);
    if (e == Unauthorized_Error_Code || e == ErrorExpiredTokenCode || e == ACCESS_DENIED) {
      dialogRequest = CommonDialogRequest(
        title: 'error'.tr,
        description: 'expired_token'.tr,
        typeDialog: DIALOG_ONE_BUTTON,
        defineEvent: ErrorExpiredTokenCode,
      );
    } else if (e == No_Connect_Network) {
      dialogRequest = CommonDialogRequest(
        title: 'network_error'.tr,
        description: 'network_error_message'.tr,
        defineEvent: NO_CONNECT_NETWORK,
      );
    } else {
      dialogRequest = CommonDialogRequest(
        title: 'error'.tr,
        description: 'unknown_error'.tr,
        typeDialog: DIALOG_ONE_BUTTON,
        defineEvent: Unknown_Error,
      );
    }

    return dialogRequest;
  }
}
