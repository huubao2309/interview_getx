import 'package:interview_getx/data/interceptors/listen_error_graphql_interceptor.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/request/common_dialog_request.dart';
import 'package:interview_getx/shared/dialog_manager/services/dialog_service.dart';
import 'package:interview_getx/shared/network/constants/constants.dart';
import 'package:interview_getx/shared/network/managers/network_manager.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class BaseController extends GetxController with NetworkManager, ListenErrorGraphQL {
  final _hasNetworkSubject = BehaviorSubject<bool>();

  Stream<bool> get hasNetworkStream => _hasNetworkSubject.stream;

  Sink<bool> get hasNetworkSink => _hasNetworkSubject.sink;

  @override
  Future<void> onInit() async {
    super.onInit();

    // check network
    await checkConnectNetwork();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  Future<void> checkConnectNetwork() async {
    // Check Network
    if (!await hasConnectNetwork()) {
      hasNetworkSink.add(false);
      await callDialogErrorNetwork();
    } else {
      // Has network
      hasNetworkSink.add(true);
    }
  }

  Future<void> callDialogErrorNetwork() async {
    final dialogRequest = CommonDialogRequest(
      title: 'network_error'.tr,
      description: 'network_error_message'.tr,
      defineEvent: NO_CONNECT_NETWORK,
    );
    await _doShowDialog(dialogRequest);
  }

  Future<void> _doShowDialog(CommonDialogRequest dialogRequest) async {
    final locator = Get.find<DialogService>();
    final dialogResult = await locator.showDialog(dialogRequest);

    if (dialogResult.confirmed) {
      print('User press confirm');
      await _handleEventDialog(dialogRequest.defineEvent);
    } else {
      print('User press cancel!');
    }
  }

  Future<void> _handleEventDialog(String? defineEvent) async {
    switch (defineEvent) {
      case NO_CONNECT_NETWORK:
        await checkConnectNetwork();
        break;
      default:
        break;
    }
  }

  CommonDialogRequest handleErrorResponse(Object e) {
    return handleErrorGraphQLResponse(e);
  }

  @override
  void onClose() {
    super.onClose();
    _hasNetworkSubject.close();
  }
}
