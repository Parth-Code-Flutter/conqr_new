part of 'app_pages.dart';
abstract class Routes {
  Routes._();

  static const splashScreen = _Paths.splashScreen;
  static const bottomNav = _Paths.bottomNav;
}

abstract class _Paths {
  _Paths._();

  static const splashScreen = '/splashScreen';
  static const bottomNav = '/bottomNav';
}
