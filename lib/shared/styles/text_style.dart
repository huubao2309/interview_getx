import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextAppStyle {
  TextStyle titleTextStyle() {
    return Get.theme.textTheme.headline6!;
  }

  TextStyle bodyContentTextStyle() {
    return Get.theme.textTheme.bodyText1!;
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
