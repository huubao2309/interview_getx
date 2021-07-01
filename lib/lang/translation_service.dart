import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'translations/en_US.dart';
import 'translations/vi_VN.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('vi', 'VN');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'vi_VN': vi_VN,
      };
}