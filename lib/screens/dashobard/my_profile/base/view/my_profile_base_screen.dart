import 'package:conqr_new/constants/image_constants.dart';
import 'package:conqr_new/screens/dashobard/my_profile/base/controller/my_profile_base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyProfileBaseScreen extends GetView<MyProfileBaseController> {
  const MyProfileBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            headerWidget(),
          ],
        ),
      ),
    );
  }

  headerWidget() {
    return Row(
      children: [
        SvgPicture.asset(kProfileWithGreyBGIcon),
      ],
    );
  }
}
