import 'package:get/get.dart';
import 'package:interview_getx/shared/network/constants/constants.dart';
import 'package:interview_getx/shared/network/controllers/network_controller.dart';

abstract class NetworkManager {
  /// Note: add bindings to Controller: Get.lazyPut<NetworkController>(() => NetworkController());
  final NetworkController _networkController = Get.find<NetworkController>();

  Future<bool> hasConnectNetwork() async {
    if (_networkController.connectionStatus.value != WIFI_NETWORK &&
        _networkController.connectionStatus.value != MOBILE_NETWORK) {
      print('Value of connect network: ${_networkController.connectionStatus.value}');
      return false;
    } else {
      print('Has connect with network');
      return true;
    }
  }
}
