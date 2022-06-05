import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_getx/shared/constants/colors.dart';

import 'theme_style/text_theme.dart';

class ThemeConfig {
  ThemeConfig();

  ThemeData get lightTheme => createTheme(
        brightness: Brightness.light,
        primaryColor: AppColor.primaryColorDark,
        primaryBackgroundColor: AppColor.primaryBackgroundColorLight,
        primaryTextColor: AppColor.primaryTextColorLight,
        secondTextColor: AppColor.secondTextColorLight,
        hintText: AppColor.primaryHintColorLight,
        accentColor: AppColor.accentColorLight,
        divider: AppColor.dividerColorLight,
        disabled: AppColor.disabledColorLight,
        shadowColor: AppColor.shadowColorLight,
        primaryBorderColor: AppColor.primaryBorderColorLight,
        error: AppColor.errorColorLight,
      );

  ThemeData get darkTheme => createTheme(
        brightness: Brightness.dark,
        primaryColor: AppColor.primaryColorDark,
        primaryBackgroundColor: AppColor.primaryBackgroundColorDark,
        primaryTextColor: AppColor.primaryTextColorDark,
        secondTextColor: AppColor.secondTextColorDark,
        hintText: AppColor.primaryHintColorDark,
        accentColor: AppColor.accentColorDark,
        divider: AppColor.dividerColorDark,
        disabled: AppColor.disabledColorDark,
        shadowColor: AppColor.shadowColorDark,
        primaryBorderColor: AppColor.primaryBorderColorDark,
        error: AppColor.errorColorDark,
      );

  ThemeData createTheme({
    required Brightness brightness,
    required Color primaryColor,
    required Color accentColor,
    required Color primaryTextColor,
    required Color secondTextColor,
    required Color primaryBackgroundColor,
    required Color error,
    Color? hintText,
    Color? divider,
    Color? disabled,
    Color? shadowColor,
    Color? primaryBorderColor,
  }) {
    final baseTextTheme = brightness == Brightness.dark ? Typography.blackMountainView : Typography.whiteMountainView;

    final textThemeApp = TextThemeApp(baseTextTheme: baseTextTheme);

    return ThemeData(
      // brightness: brightness,
      canvasColor: primaryBackgroundColor,
      cardColor: primaryBackgroundColor,
      dividerColor: divider,
      dividerTheme: DividerThemeData(
        color: divider,
        space: 1,
        thickness: 1,
      ),
      cardTheme: CardTheme(
        color: primaryBackgroundColor,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 4,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: primaryBorderColor!, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        shadowColor: shadowColor,
      ),
      backgroundColor: primaryBackgroundColor,
      primaryColor: primaryColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: accentColor,
        selectionColor: accentColor,
        selectionHandleColor: accentColor,
      ),
      toggleableActiveColor: accentColor,
      appBarTheme: AppBarTheme(
        color: primaryColor,
        iconTheme: IconThemeData(
          color: secondTextColor,
        ), toolbarTextStyle: TextTheme(
          bodyText1: baseTextTheme.bodyText1!.copyWith(
            color: secondTextColor,
            fontSize: 18,
          ),
        ).bodyText2, titleTextStyle: TextTheme(
          bodyText1: baseTextTheme.bodyText1!.copyWith(
            color: secondTextColor,
            fontSize: 18,
          ),
        ).headline6,
      ),
      iconTheme: IconThemeData(
        color: secondTextColor,
        size: 16,
      ),
      errorColor: error,
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        colorScheme: ColorScheme(
          brightness: brightness,
          primary: primaryColor,
          secondary: accentColor,
          surface: primaryBackgroundColor,
          background: primaryColor,
          error: error,
          onPrimary: primaryTextColor,
          onSecondary: primaryTextColor,
          onSurface: primaryTextColor,
          onBackground: primaryTextColor,
          onError: primaryTextColor,
        ),
        padding: const EdgeInsets.all(16),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: brightness,
        primaryColor: primaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: TextStyle(color: error),
        labelStyle: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: primaryTextColor.withOpacity(0.5),
        ),
        hintStyle: TextStyle(
          color: primaryTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
      ),
      fontFamily: 'Rubik',
      unselectedWidgetColor: Colors.grey,
      // textTheme: TextTheme(
      //   headline1: baseTextTheme.headline1!.copyWith(
      //     color: primaryTextColor,
      //     fontSize: 34,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   headline2: baseTextTheme.headline2!.copyWith(
      //     color: primaryTextColor,
      //     fontSize: 34,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   headline3: baseTextTheme.headline3!.copyWith(
      //     color: primaryTextColor,
      //     fontSize: 20,
      //     fontWeight: FontWeight.w600,
      //   ),
      //   headline4: baseTextTheme.headline4!.copyWith(
      //     color: primaryTextColor,
      //     fontSize: 20,
      //     fontWeight: FontWeight.w600,
      //   ),
      //   headline5: baseTextTheme.headline5!.copyWith(
      //     color: primaryColor,
      //     fontSize: 14,
      //     fontWeight: FontWeight.w700,
      //   ),
      //   headline6: baseTextTheme.headline6!.copyWith(
      //     color: primaryTextColor,
      //     fontSize: 14,
      //     fontWeight: FontWeight.w700,
      //   ),
      //   bodyText1: baseTextTheme.bodyText1!.copyWith(
      //     color: primaryTextColor,
      //     fontSize: 14,
      //   ),
      //   bodyText2: baseTextTheme.bodyText2!.copyWith(
      //     color: primaryTextColor,
      //     fontSize: 14,
      //     fontWeight: FontWeight.w400,
      //   ),
      //   subtitle1: baseTextTheme.subtitle1!.copyWith(
      //     color: primaryTextColor,
      //     fontSize: 16,
      //     fontWeight: FontWeight.w700,
      //   ),
      //   subtitle2: baseTextTheme.subtitle2!.copyWith(
      //     color: primaryTextColor,
      //     fontSize: 11,
      //     fontWeight: FontWeight.w500,
      //   ),
      //   button: baseTextTheme.button!.copyWith(
      //     color: primaryTextColor,
      //     fontSize: 12,
      //     fontWeight: FontWeight.w700,
      //   ),
      //   caption: baseTextTheme.caption!.copyWith(
      //     color: primaryTextColor,
      //     fontSize: 11,
      //     fontWeight: FontWeight.w300,
      //   ),
      //   overline: baseTextTheme.overline!.copyWith(
      //     color: primaryTextColor,
      //     fontSize: 11,
      //     fontWeight: FontWeight.w500,
      //   ),
      // ),
      textTheme: textThemeApp.initTextThemeApp(
        primaryTextColor: primaryTextColor,
        primaryColor: primaryColor,
      ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
    );
  }
}
