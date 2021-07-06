import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:interview_getx/data/base/base_controller.dart';
import 'package:interview_getx/data/common/define_field.dart';
import 'package:interview_getx/modules/home/constants/constant.dart';
import 'package:interview_getx/shared/constants/common.dart';
import 'package:interview_getx/shared/dialog_manager/services/dialog_service.dart';
import 'package:interview_getx/shared/network/constants/constants.dart';
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

class HomeController extends BaseController {
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
    mainTab = MainTab();
    settingTab = SettingTab();
    await super.onInit();
  }

  @override
  Future<void> onReady() async {
    await super.onReady();
    await loadUsers();
    hasNetworkStream.listen((value) async {
      print('Value network: $value');
      if (value) {
        await loadListTodo(limit: 10, offset: 0);
        return;
      }
    });
  }

  Future<void> loadUsers() async {
    final storage = Get.find<SharedPreferences>();
    final user = storage.get(StorageConstants.userId) ?? 'no_name'.tr;
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
          await _doShowDialog(dialogRequest);
        }
        await EasyLoading.dismiss();
      },
      onError: (e) async {
        print(e);
        await EasyLoading.dismiss();
        await _doShowDialog(handleErrorResponse(e));
      },
    );
  }

  Future<void> confirmLogout() async {
    // Show dialog
    final dialogRequest = CommonDialogRequest(
      title: 'alert'.tr,
      description: 'has_logout_message'.tr,
      defineEvent: LOGOUT_EVENT,
      typeDialog: DIALOG_TWO_BUTTON,
    );
    await _doShowDialog(dialogRequest);
  }

  Future<void> logOut() async {
    await Get.find<SharedPreferences>().clear();

    try {
      final authController = Get.find<AuthController>();
      if (authController.initialized) {
        authController.loginUserNameController.value = TextEditingValue.empty;
        authController.loginPasswordController.value = TextEditingValue.empty;
        Get.back();
      } else {
        Get.lazyPut(() => AuthController(apiRepository: apiRepository));
        await Get.offAllNamed(Routes.AUTH);
      }
    } catch (e) {
      Get.lazyPut(() => AuthController(apiRepository: apiRepository));
      await Get.toNamed(Routes.AUTH);
    } finally {
      currentTab.value = MainTabs.home;
    }
  }

  Future<void> _doShowDialog(CommonDialogRequest dialogRequest) async {
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
      case NO_CONNECT_NETWORK:
        checkConnectNetwork();
        break;
      case ErrorExpiredTokenCode:
        logOut();
        break;
      case Unknown_Error:
        break;
      case LOGOUT_EVENT:
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
    Get.find<SharedPreferences>().setString(StorageConstants.theme, Get.isDarkMode ? LIGHT_THEME : DARK_THEME);
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }

  Future<void> changeLanguage() async {
    final prefs = Get.find<SharedPreferences>();
    final language = prefs.getString(StorageConstants.language);
    final locator = Get.find<DialogService>();
    final dialogResult = await locator.showLanguageDialog(
      languages: const [VIETNAMESE_LANG, ENGLISH_LANG],
      isMustTapButton: true,
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
