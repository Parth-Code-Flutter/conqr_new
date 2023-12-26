import 'package:conqr_new/constants/color_constants.dart';
import 'package:conqr_new/constants/image_constants.dart';
import 'package:conqr_new/constants/localization.dart';
import 'package:conqr_new/screens/dashobard/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:conqr_new/screens/dashobard/collections/base/view/collections_base_screen.dart';
import 'package:conqr_new/screens/dashobard/home/base/view/home_base_screen.dart';
import 'package:conqr_new/screens/dashobard/my_profile/base/view/my_profile_base_screen.dart';
import 'package:conqr_new/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomNavScreen extends GetView<BottomNavController> {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      bottomNavigationBar: buildBottomNavigationMenu(context, controller),
      body: Obx(() {
        return IndexedStack(
          index: controller.currentIndex.value,
          children: [
            HomeBaseScreen(),
            CollectionsBaseScreen(),
            MyProfileBaseScreen(),
          ],
        );
      }),
    );
  }

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => SizedBox(
          height: 100,
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              elevation: 0,
              showSelectedLabels: true,
              onTap: landingPageController.changeTabIndex,
              currentIndex: controller.currentIndex.value,
              backgroundColor: kColorBackground,
              unselectedItemColor: kColorGrey,
              selectedItemColor: kColorBlack,
              unselectedLabelStyle: TextStyles.kPrimaryRegularGilroy(fontSize: TextStyles.k12FontSize),
              selectedLabelStyle: TextStyles.kPrimaryRegularGilroy(fontSize: TextStyles.k12FontSize),
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: SvgPicture.asset(controller.currentIndex.value == 0 ? kHomeWithBGIcon : kHomeIcon),
                  ),
                  label: AppLocal.kHome.getString(context),
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: SvgPicture.asset(controller.currentIndex.value == 1 ? kCollectionsWithBGIcon : kCollectionsIcon),
                  ),
                  label: AppLocal.kCollections.getString(context),
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: SvgPicture.asset(controller.currentIndex.value == 2 ? kProfileWithBGIcon : kProfileIcon),
                  ),
                  label: AppLocal.kMyProfile.getString(context),
                ),
              ]),
        ));
  }
}
