import 'package:flutter/cupertino.dart';
import 'package:interview_getx/api/repository/api_repository.dart';
import 'package:interview_getx/modules/auth/controller/auth_controller.dart';
import 'package:interview_getx/modules/home/tabs/home_tab.dart';
import 'package:interview_getx/modules/home/tabs/setting_tab.dart';
import 'package:interview_getx/modules/home/tabs/tabs.dart';
import 'package:interview_getx/routes/app_pages.dart';
import 'package:interview_getx/shared/constants/storage.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/dialog_request.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/type_dialog.dart';
import 'package:get/get.dart';
import 'package:interview_getx/shared/dialog_manager/services/dialog_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  HomeController({required this.apiRepository});

  final ApiRepository apiRepository;

  var currentTab = MainTabs.home.obs;
  var userApp = Rxn<String>();
  RxBool result = false.obs;

  late MainTab mainTab;
  late SettingTab settingTab;

  @override
  Future<void> onInit() async {
    super.onInit();

    mainTab = MainTab();
    await loadUsers();

    settingTab = SettingTab();
  }

  Future<void> loadUsers() async {
    final prefs = Get.find<SharedPreferences>();
    final user = prefs.get(StorageConstants.userId) ?? 'no_name'.tr;
    userApp.value = user.toString();
  }

  Future<void> doShowDialog(DialogRequest dialogRequest) async {
    final locator = Get.find<DialogService>();
    final dialogResult = await locator.showDialog(
      title: dialogRequest.title ?? 'info'.tr,
      description: dialogRequest.description,
      typeDialog: dialogRequest.typeDialog ?? DIALOG_TWO_BUTTON,
    );

    if (dialogResult.confirmed) {
      print('User Logout');
      logOut();
    } else {
      print('User do not logout!');
    }
  }

  void logOut() {
    Get.find<SharedPreferences>().clear();

    try {
      final authController = Get.find<AuthController>();
      if (authController.initialized) {
        authController.loginUserNameController.value = TextEditingValue.empty;
        authController.loginPasswordController.value = TextEditingValue.empty;
        Get.back();
      } else {
        Get
          ..lazyPut(() => AuthController(apiRepository: apiRepository))
          ..offAllNamed(Routes.AUTH);
      }
    } catch (e) {
      Get
        ..lazyPut(() => AuthController(apiRepository: apiRepository))
        ..toNamed(Routes.AUTH);
    } finally {
      currentTab.value = MainTabs.home;
    }
  }

  void switchTab(index) {
    final tab = _getCurrentTab(index);
    currentTab.value = tab;
  }

  int getCurrentIndex(MainTabs tab) {
    switch (tab) {
      case MainTabs.home:
        return 0;
      case MainTabs.setting:
        return 1;
      default:
        return 0;
    }
  }

  MainTabs _getCurrentTab(int index) {
    switch (index) {
      case 0:
        return MainTabs.home;
      case 1:
        return MainTabs.setting;
      default:
        return MainTabs.home;
    }
  }
}
