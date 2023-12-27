import 'package:conqr_new/constants/image_constants.dart';
import 'package:conqr_new/constants/localization.dart';
import 'package:conqr_new/screens/dashobard/my_profile/base/controller/my_profile_base_controller.dart';
import 'package:conqr_new/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyProfileBaseScreen extends GetView<MyProfileBaseController> {
  const MyProfileBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 14),
          child: Column(
            children: [
              headerWidget(context),
              SizedBox(height: 22),
              settingsListView(),
            ],
          ),
        ),
      ),
    );
  }

  headerWidget(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(kProfileWithGreyBGIcon),
        SizedBox(width: 15),
        Text(AppLocal.kHelloReader.getString(context),style: TextStyles.kPrimaryBoldPoppins(fontSize: TextStyles.k18FontSize)),
      ],
    );
  }

  settingsListView() {
    return Obx(() {
      return ListView.separated(
        itemCount: controller.myProfileSettingsDataList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var data = controller.myProfileSettingsDataList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.name ?? '',
                  style: TextStyles.kPrimaryRegularPoppins(fontWeight: FontWeight.w500),
                ),
                SvgPicture.asset(kForwardArrowIcon),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(thickness: .5,);
        },
      );
    });
  }
}
