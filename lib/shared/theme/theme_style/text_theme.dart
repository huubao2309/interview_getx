import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextThemeApp {
  TextThemeApp({this.baseTextTheme});

  final TextTheme? baseTextTheme;

  /// Body Text 1
  TextStyle get bodyText1 {
    return Get.theme.textTheme.bodyText1!;
  }

  TextStyle setBodyText1({required Color color}) {
    assert(baseTextTheme != null, 'Can use method setBodyText1 when baseTextTheme == null!');
    return baseTextTheme!.bodyText1!.copyWith(
      color: color,
      fontSize: 14,
    );
  }

  TextTheme initTextThemeApp({required Color primaryTextColor, required Color primaryColor}) {
    return TextTheme(
      headline1: baseTextTheme!.headline1!.copyWith(
        color: primaryTextColor,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
      headline2: baseTextTheme!.headline2!.copyWith(
        color: primaryTextColor,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
      headline3: baseTextTheme!.headline3!.copyWith(
        color: primaryTextColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      headline4: baseTextTheme!.headline4!.copyWith(
        color: primaryTextColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      headline5: baseTextTheme!.headline5!.copyWith(
        color: primaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      headline6: baseTextTheme!.headline6!.copyWith(
        color: primaryTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      bodyText1: setBodyText1(color: primaryTextColor),
      bodyText2: baseTextTheme!.bodyText2!.copyWith(
        color: primaryTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      subtitle1: baseTextTheme!.subtitle1!.copyWith(
        color: primaryTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      subtitle2: baseTextTheme!.subtitle2!.copyWith(
        color: primaryTextColor,
        fontSize: 11,
        fontWeight: FontWeight.w500,
      ),
      button: baseTextTheme!.button!.copyWith(
        color: primaryTextColor,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
      caption: baseTextTheme!.caption!.copyWith(
        color: primaryTextColor,
        fontSize: 11,
        fontWeight: FontWeight.w300,
      ),
      overline: baseTextTheme!.overline!.copyWith(
        color: primaryTextColor,
        fontSize: 11,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
