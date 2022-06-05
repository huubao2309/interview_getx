import 'package:get/get.dart';
import 'package:interview_getx/modules/detail_todo/view/detail_todo_screen.dart';
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
    page: SplashScreen.new,
    binding: SplashBinding(),
  ),
  GetPage(
    name: Routes.AUTH,
    page: AuthScreen.new,
    binding: AuthBinding(),
    children: [
      GetPage(name: Routes.REGISTER, page: RegisterScreen.new),
      GetPage(name: Routes.LOGIN, page: LoginScreen.new),
    ],
  ),
  GetPage(
    name: Routes.HOME,
    page: HomeScreen.new,
    binding: HomeBinding(),
    children: [
      GetPage(name: Routes.DETAIL_TODO, page: DetailTodoScreen.new),
    ],
  ),
];
