import 'package:conqr_new/constants/image_constants.dart';
import 'package:conqr_new/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkUserLoggedInOrNot() {
    try {
      Future.delayed(
        Duration(seconds: 3),
        () {
          Get.offAllNamed(Routes.introductionScreen);
        },
      );
    } catch (e) {
      debugPrint('checkUserLoggedInOrNot : $e');
    }
  }

  @override
  void initState() {
    checkUserLoggedInOrNot();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset(kAppIcon)),
    );
  }
}
