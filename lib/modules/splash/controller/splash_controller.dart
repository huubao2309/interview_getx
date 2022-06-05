import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_getx/domain/usecases/local_storage/get_shared_preferences.dart';
import 'package:interview_getx/routes/app_pages.dart';
import 'package:interview_getx/shared/constants/common.dart';
import 'package:interview_getx/shared/utils/logger/my_app_logger.dart';

class SplashController extends SuperController {
  MyAppLogger get logger => const MyAppLogger('SplashController');

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    final getSharedPreferences = Get.find<GetSharedPreferences>();
    await _initInfoDevice(getSharedPreferences);
    try {
      final token = getSharedPreferences.value.getLocalToken();
      if (token.isNotEmpty) {
        logger.log(content: 'Token: $token');
        await Get.offAndToNamed(Routes.HOME);
      } else {
        await Get.offAndToNamed(Routes.AUTH);
      }
    } catch (e) {
      await Get.toNamed(Routes.AUTH);
    }
  }

  Future<void> _initInfoDevice(GetSharedPreferences getSharedPreferences) async {
    await Future.wait([
      Future.delayed(const Duration(milliseconds: 500)),
      _loadLanguageApp(getSharedPreferences),
      _loadThemeApp(getSharedPreferences),
    ]);
  }

  Future<void> _loadLanguageApp(GetSharedPreferences getSharedPreferences) async {
    try {
      final language = getSharedPreferences.value.getLocalLanguageApp();
      if (language == VIETNAMESE_LANG) {
        await Get.updateLocale(const Locale('vi', 'VN'));
        return;
      }

      await Get.updateLocale(const Locale('en', 'US'));
    } catch (ex) {
      logger.log(content: 'Cannot load language app');
    }
  }

  Future<void> _loadThemeApp(GetSharedPreferences getSharedPreferences) async {
    try {
      await Future.delayed(const Duration(milliseconds: 1));
      final theme = getSharedPreferences.value.getLocalThemeApp();
      if (theme == LIGHT_THEME) {
        Get.changeThemeMode(ThemeMode.light);
        return;
      }

      Get.changeThemeMode(ThemeMode.dark);
    } catch (ex) {
      logger.log(content: 'Cannot load theme app');
    }
  }

  @override
  void onDetached() {
    logger.log(content: 'onDetached');
  }

  @override
  void onInactive() {
    logger.log(content: 'onInactive');
  }

  @override
  void onPaused() {
    logger.log(content: 'onPaused');
  }

  @override
  void onResumed() {
    logger.log(content: 'onResumed');
  }

  @override
  void onClose() {
    super.onClose();
  }
}
