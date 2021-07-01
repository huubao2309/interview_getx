import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'base/app_binding.dart';
import 'lang/translation_service.dart';
import 'routes/app_pages.dart';
import 'shared/constants/colors.dart';
import 'shared/constants/common.dart';
import 'shared/dialog_manager/managers/dialog_manager.dart';
import 'shared/theme/theme_data.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: Routes.SPLASH,
      defaultTransition: Transition.fade,
      getPages: routePages,
      initialBinding: AppBinding(),
      smartManagement: SmartManagement.keepFactory,
      title: APP_NAME,
      theme: ThemeConfig.lightTheme,
      darkTheme: ThemeConfig.darkTheme,
      themeMode: ThemeMode.light,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      builder: EasyLoading.init(builder: (context, widget) {
        return Navigator(
          onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(
              child: widget!,
            ),
          ),
        );
      }),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = !Get.isDarkMode ? AppColor.accentColorLight : AppColor.accentColorDark
    ..backgroundColor = !Get.isDarkMode ? AppColor.primaryBackgroundColorLight : AppColor.primaryBackgroundColorDark
    ..indicatorColor = !Get.isDarkMode ? AppColor.primaryColorLight : AppColor.primaryColorDark
    ..textColor = !Get.isDarkMode ? AppColor.primaryColorLight : AppColor.primaryColorDark
    ..maskColor = !Get.isDarkMode ? AppColor.errorColorLight : AppColor.errorColorDark
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}
