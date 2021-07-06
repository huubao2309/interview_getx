import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_getx/routes/app_pages.dart';
import 'package:interview_getx/shared/constants/common.dart';
import 'package:interview_getx/shared/constants/storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  Future<void> onReady() async {
    super.onReady();

    await Future.delayed(const Duration(milliseconds: 2000));
    final storage = Get.find<SharedPreferences>();
    loadLanguage(storage);
    loadTheme(storage);
    try {
      if (storage.getString(StorageConstants.token) != null) {
        print('Token: ${storage.getString(StorageConstants.token)}');
        await Get.offAndToNamed(Routes.HOME);
      } else {
        await Get.offAndToNamed(Routes.AUTH);
      }
    } catch (e) {
      await Get.toNamed(Routes.AUTH);
    }
  }

  void loadLanguage(SharedPreferences storage) {
    final language = storage.getString(StorageConstants.language);
    if (language == null) {
      Get.updateLocale(const Locale('vi', 'VN'));
    }

    if (language == VIETNAMESE_LANG) {
      Get.updateLocale(const Locale('vi', 'VN'));
      return;
    }

    Get.updateLocale(const Locale('en', 'US'));
  }

  void loadTheme(SharedPreferences storage) {
    final theme = storage.getString(StorageConstants.theme);
    if (theme == null || theme == LIGHT_THEME) {
      Get.changeThemeMode(ThemeMode.light);
      storage.setString(StorageConstants.theme, LIGHT_THEME);
      return;
    }

    Get.changeThemeMode(ThemeMode.dark);
    storage.setString(StorageConstants.theme, DARK_THEME);
  }
}
