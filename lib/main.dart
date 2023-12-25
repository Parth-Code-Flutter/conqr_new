import 'package:conqr_new/constants/localization.dart';
import 'package:conqr_new/routes/app_pages.dart';
import 'package:conqr_new/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppLocal.appName,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      home: SplashScreen(),
    );
  }
}
