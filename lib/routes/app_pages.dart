import 'package:interview_getx/modules/auth/auth.dart';
import 'package:interview_getx/modules/home/home.dart';
import 'package:interview_getx/modules/modules.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

const INITIAL = Routes.SPLASH;

final routePages = [
  GetPage(
    name: Routes.SPLASH,
    page: () => SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: Routes.AUTH,
    page: () => AuthScreen(),
    binding: AuthBinding(),
    children: [
      GetPage(name: Routes.REGISTER, page: () => RegisterScreen()),
      GetPage(name: Routes.LOGIN, page: () => LoginScreen()),
    ],
  ),
  GetPage(
    name: Routes.HOME,
    page: () => HomeScreen(),
    binding: HomeBinding(),
    children: const [
      // TODO:
      // GetPage(name: Routes.CARDS, page: () => CardsScreen()),
    ],
  ),
];
