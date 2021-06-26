import 'package:get/get.dart';
import 'package:interview_getx/modules/home/view/home_screen.dart';
import '../modules/auth/binding/auth_binding.dart';
import '../modules/auth/view/auth_screen.dart';
import '../modules/auth/view/login_screen.dart';
import '../modules/auth/view/register_screen.dart';
import '../modules/home/binding/home_binding.dart';
import '../modules/splash/binding/splash_binding.dart';
import '../modules/splash/view/splash_screen.dart';

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
