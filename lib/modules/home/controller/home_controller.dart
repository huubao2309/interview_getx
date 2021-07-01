import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:interview_getx/data/common/define_field.dart';
import 'package:interview_getx/shared/constants/common.dart';
import 'package:interview_getx/shared/dialog_manager/services/dialog_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/graphql/query/demo_query_graphql.dart';
import '../../../data/repository/api_repository.dart';
import '../../../modules/auth/controller/auth_controller.dart';
import '../../../modules/home/tabs/home_tab.dart';
import '../../../modules/home/tabs/setting_tab.dart';
import '../../../modules/home/tabs/tabs.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/storage.dart';
import '../../../shared/dialog_manager/data_models/request/common_dialog_request.dart';
import '../../../shared/dialog_manager/data_models/type_dialog.dart';

class HomeController extends GetxController {
  HomeController({required this.apiRepository});

  final ApiRepository apiRepository;

  var currentTab = MainTabs.home.obs;
  var userApp = Rxn<String>();
  var totalListItems = RxList<GetActiveTodos$Query$TodosSelectColumn>();

  final ScrollController scrollController = ScrollController();
  bool isLoadingMore = false;

  late MainTab mainTab;
  late SettingTab settingTab;

  final int stepLimitItem = 10;
  RxInt offsetItem = 0.obs;

  RxBool isChangeTheme = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    mainTab = MainTab();
    await loadUsers();
    await loadListTodo(limit: 10, offset: 0);

    settingTab = SettingTab();
  }

  Future<void> loadUsers() async {
    final prefs = Get.find<SharedPreferences>();
    final user = prefs.get(StorageConstants.userId) ?? 'no_name'.tr;
    userApp.value = user.toString();
  }

  Future<void> loadListTodo({required int limit, required int offset}) async {
    await EasyLoading.show();
    await apiRepository.getList(limit: limit, offset: offset).then(
      (result) async {
        if (result.isNotEmpty) {
          if (totalListItems.isNotEmpty && totalListItems.length >= offsetItem.value + stepLimitItem) {
            totalListItems.addAll(result);
            offsetItem.value = offsetItem.toInt() + stepLimitItem;
          } else {
            totalListItems.value = result;
          }
        } else {
          final dialogRequest = CommonDialogRequest(
            title: 'error'.tr,
            description: 'unknown_error'.tr,
            typeDialog: DIALOG_ONE_BUTTON,
            defineEvent: 'unknown_error',
          );
          await doShowDialog(dialogRequest);
        }
        await EasyLoading.dismiss();
      },
      onError: (e) async {
        print(e);
        await EasyLoading.dismiss();
        if (e == Unauthorized_Error_Code || e == ErrorExpiredTokenCode || e == ACCESS_DENIED) {
          final dialogRequest = CommonDialogRequest(
            title: 'error'.tr,
            description: 'expired_token'.tr,
            typeDialog: DIALOG_ONE_BUTTON,
            defineEvent: ErrorExpiredTokenCode,
          );
          await doShowDialog(dialogRequest);
        } else {
          final dialogRequest = CommonDialogRequest(
            title: 'error'.tr,
            description: 'unknown_error'.tr,
            typeDialog: DIALOG_ONE_BUTTON,
            defineEvent: Unknown_Error,
          );
          await doShowDialog(dialogRequest);
        }
      },
    );
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

  Future<void> doShowDialog(CommonDialogRequest dialogRequest) async {
    final locator = Get.find<DialogService>();
    final dialogResult = await locator.showDialog(dialogRequest);

    if (dialogResult.confirmed) {
      print('User press confirm');
      handleEventDialog(dialogRequest.defineEvent);
    } else {
      print('User press cancel!');
    }
  }

  void handleEventDialog(String? defineEvent) {
    switch (defineEvent) {
      case ErrorExpiredTokenCode:
        logOut();
        break;
      case Unknown_Error:
        break;
      case 'logout':
        logOut();
        break;
      default:
        break;
    }
  }

  void switchTab(index) {
    final tab = _getCurrentTab(index);
    currentTab.value = tab;
  }

  void changeTheme() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }

  Future<void> changeLanguage() async {
    final prefs = Get.find<SharedPreferences>();
    final language = prefs.getString(StorageConstants.language);
    final locator = Get.find<DialogService>();
    final dialogResult = await locator.showLanguageDialog(
      languages: const [VIETNAMESE_LANG, ENGLISH_LANG],
    );

    if (language != null && language == dialogResult.language) {
      return;
    }

    if (dialogResult.language == VIETNAMESE_LANG) {
      Get.updateLocale(const Locale('vi', 'VN'));
    }

    if (dialogResult.language == ENGLISH_LANG) {
      Get.updateLocale(const Locale('en', 'US'));
    }

    await prefs.setString(StorageConstants.language, dialogResult.language);
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

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
    isLoadingMore = false;
  }
}
