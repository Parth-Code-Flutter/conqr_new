import 'package:conqr_new/screens/dashobard/bottom_nav/view/botton_nav_screen.dart';
import 'package:conqr_new/screens/dashobard/collections/collections_details/view/collections_details_screen.dart';
import 'package:conqr_new/screens/introduction_screen/intro_screen.dart';
import 'package:conqr_new/screens/splash_screen/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.splashScreen;

  static final routes = [
    GetPage(
      name: _Paths.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _Paths.introductionScreen,
      page: () => const IntroScreen(),
    ),
    GetPage(
      name: _Paths.bottomNav,
      page: () => const BottomNavScreen(),
    ),
    GetPage(
      name: _Paths.collectionsDetailsScreen,
      page: () => const CollectionsDetailsScreen(),
    ),
  ];
}
