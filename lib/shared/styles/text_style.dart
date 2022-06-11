import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_getx/shared/theme/theme_style/text_theme.dart';

class TextAppStyle {
  TextAppStyle._();

  static final TextAppStyle _instance = TextAppStyle._();

  static TextAppStyle get instance => _instance;

  final TextThemeApp textThemeApp = TextThemeApp();

  TextStyle titleTextStyle() {
    return Get.theme.textTheme.headline6!;
  }

  TextStyle bodyContentTextStyle() {
    // return Get.theme.textTheme.bodyText1!;
    return textThemeApp.bodyText1;
  }

  TextStyle versionTextStyle() {
    return Get.theme.textTheme.headline3!;
  }

  TextStyle bodyTitleTextStyle() {
    return Get.theme.textTheme.headline5!;
  }

  TextStyle bodyWhiteTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
  }

  TextStyle prefixDesignTextStyle() {
    return TextStyle(
      color: Get.theme.textTheme.headline3!.color,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
  }

  TextStyle suffixDesignTextStyle() {
    return TextStyle(
      color: Get.theme.primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
  }
}
