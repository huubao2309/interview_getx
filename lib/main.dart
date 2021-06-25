import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:interview_getx/shared/shared.dart';
import 'package:get/get.dart';

import 'app_binding.dart';
import 'di.dart';
import 'lang/lang.dart';
import 'routes/routes.dart';
import 'shared/dialog_manager/dialog.dart';
import 'shared/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();

  runApp(App());
  configLoading();
}

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
      title: 'Interview Project',
      theme: ThemeConfig.lightTheme,
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
    // ..indicatorSize = 45.0
    ..radius = 10.0
    // ..progressColor = Colors.yellow
    ..backgroundColor = ColorConstants.lightGray
    ..indicatorColor = hexToColor('#4CAF50')
    ..textColor = hexToColor('#4CAF50')
    // ..maskColor = Colors.red
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}
