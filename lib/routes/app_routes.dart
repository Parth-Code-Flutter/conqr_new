part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const splashScreen = _Paths.splashScreen;
  static const introductionScreen = _Paths.introductionScreen;
  static const bottomNav = _Paths.bottomNav;
  static const collectionsDetailsScreen = _Paths.collectionsDetailsScreen;
}

abstract class _Paths {
  _Paths._();

  static const splashScreen = '/splashScreen';
  static const introductionScreen = '/introductionScreen';
  static const bottomNav = '/bottomNav';
  static const collectionsDetailsScreen = '/collectionsDetailsScreen';
}
