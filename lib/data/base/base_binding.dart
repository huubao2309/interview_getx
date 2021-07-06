import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:interview_getx/shared/network/controllers/network_controller.dart';

class BaseBinding implements Bindings {
  @override
  @mustCallSuper
  void dependencies() {
    Get.lazyPut<NetworkController>(() => NetworkController());
  }
}
