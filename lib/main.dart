import 'package:conqr_new/constants/localization.dart';
import 'package:conqr_new/controller_binding/controller_binding.dart';
import 'package:conqr_new/routes/app_pages.dart';
import 'package:conqr_new/screens/splash_screen/splash_screen.dart';
import 'package:conqr_new/utils/localizations_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  void initState() {
    _localization.init(
      mapLocales: [
        MapLocale(
          LocalizationUtils.languageCodeEnglish,
          AppLocal.EN,
          countryCode: LocalizationUtils.countryCodeEN,
          fontFamily: 'Font EN',
        ),
      ],
      initLanguageCode: LocalizationUtils.languageCodeEnglish,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      title: AppLocal.appName,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: ControllerBinding(),
      // home: SplashScreen(),
    );
  }
}
