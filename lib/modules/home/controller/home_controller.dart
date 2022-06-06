import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:interview_getx/data/common/define_field.dart';
import 'package:interview_getx/domain/entities/todos/todo_model.dart';
import 'package:interview_getx/domain/params/get_list_todo_request.dart';
import 'package:interview_getx/domain/usecases/local_storage/get_shared_preferences.dart';
import 'package:interview_getx/domain/usecases/todo_usecase/get_list_todo.dart';
import 'package:interview_getx/modules/auth/controller/auth_controller.dart';
import 'package:interview_getx/modules/home/constants/constant.dart';
import 'package:interview_getx/modules/home/tabs/home_tab.dart';
import 'package:interview_getx/modules/home/tabs/setting_tab.dart';
import 'package:interview_getx/modules/home/tabs/tabs.dart';
import 'package:interview_getx/routes/app_pages.dart';
import 'package:interview_getx/shared/constants/common.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/request/common_dialog_request.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/type_dialog.dart';
import 'package:interview_getx/shared/dialog_manager/services/dialog_service.dart';
import 'package:interview_getx/shared/utils/logger/my_app_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends SuperController {
  HomeController({required this.getListTodo});

  final GetListTodo getListTodo;

  MyAppLogger get logger => const MyAppLogger('HomeController');

  var userApp = Rxn<String>();
  var totalListItems = RxList<TodoItem>();

  final ScrollController scrollController = ScrollController();
  bool isLoadingMore = false;

  late MainTab mainTab;
  late SettingTab settingTab;
  var currentTab = MainTabs.home.obs;

  final int stepLimitItem = 10;
  RxInt offsetItem = 0.obs;
  RxBool isDarkMode = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    mainTab = MainTab();
    settingTab = SettingTab();
    isDarkMode.value = await _checkThemeApp();
    await loadListTodo(offset: 0, limit: 10);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  Future<bool> _checkThemeApp() async {
    final storage = Get.find<GetSharedPreferences>();
    final themeApp = storage.value.getLocalThemeApp();
    if (themeApp == DARK_THEME) {
      return true;
    }

    return false;
  }

  Future<void> loadUsers() async {
    final storage = Get.find<GetSharedPreferences>();
    final user = storage.value.getLocalId();
    if (user.isEmpty) {
      userApp.value = 'no_name'.tr;
      return;
    }

    userApp.value = user;
  }

  Future<void> loadListTodo({required int limit, required int offset}) async {
    try {
      await EasyLoading.show();
      final request = GetListTodoRequest(offset: offset, limit: limit);
      final result = await getListTodo.callAsync(request);
      if (result.hasError) {
        await _dialogError();
        return;
      }

      totalListItems.addAll(result.items!);
    } catch (ex) {
      await _dialogError();
    } finally {
      await EasyLoading.dismiss();
    }
  }

  Future<void> _dialogError() async {
    final dialogRequest = CommonDialogRequest(
      title: 'error'.tr,
      description: 'unknown_error'.tr,
      typeDialog: DIALOG_ONE_BUTTON,
      defineEvent: 'unknown_error',
    );
    await _doShowDialog(dialogRequest);
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
        await Get.offAllNamed(Routes.AUTH);
      }
    } catch (e) {
      await Get.toNamed(Routes.AUTH);
    } finally {
      currentTab.value = MainTabs.home;
    }
  }

  Future<void> _doShowDialog(CommonDialogRequest dialogRequest) async {
    final locator = Get.find<DialogService>();
    final dialogResult = await locator.showDialog(dialogRequest);

    if (dialogResult.confirmed) {
      logger.log(content: 'User press confirm');
      handleEventDialog(dialogRequest.defineEvent);
    } else {
      logger.log(content: 'User press cancel!');
    }
  }

  void handleEventDialog(String? defineEvent) {
    switch (defineEvent) {
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

  Future<void> changeTheme() async {
    final currentTheme = isDarkMode.value;
    isDarkMode.value = !currentTheme;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);

    final getSharedPreferences = Get.find<GetSharedPreferences>();
    await getSharedPreferences.value.setLocalThemeApp(theme: isDarkMode.value ? DARK_THEME : LIGHT_THEME);
  }

  Future<void> changeLanguage() async {
    final storage = Get.find<GetSharedPreferences>();
    final language = storage.value.getLocalLanguageApp();
    final locator = Get.find<DialogService>();
    final dialogResult = await locator.showLanguageDialog(
      languages: const [VIETNAMESE_LANG, ENGLISH_LANG],
      isMustTapButton: true,
    );

    if (language == dialogResult.language) {
      return;
    }

    if (dialogResult.language == VIETNAMESE_LANG) {
      await Get.updateLocale(const Locale('vi', 'VN'));
    }

    if (dialogResult.language == ENGLISH_LANG) {
      await Get.updateLocale(const Locale('en', 'US'));
    }

    await storage.value.setLocalLanguageApp(language: dialogResult.language);
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
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
    isLoadingMore = false;
  }
}
