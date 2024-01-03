import 'package:conqr_new/constants/color_constants.dart';
import 'package:conqr_new/constants/image_constants.dart';
import 'package:conqr_new/constants/localization.dart';
import 'package:conqr_new/routes/app_pages.dart';
import 'package:conqr_new/utils/text_styles.dart';
import 'package:conqr_new/widgets/common_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IntroductionScreen(
                globalBackgroundColor: kColorWhite,
                pages: [
                  // PageViewModel(
                  //   title: AppLocal.kWelcomeToConqrApp.getString(context),
                  //   body: AppLocal.kWelcomeToConqrAppText.getString(context),
                  //   image: buildImage(kIntroImg),
                  //   //getPageDecoration, a method to customise the page style
                  //   decoration: getPageDecoration(),
                  // ),
                  // PageViewModel(
                  //   title: AppLocal.kWelcomeToConqrApp.getString(context),
                  //   body: AppLocal.kWelcomeToConqrAppText.getString(context),
                  //   image: buildImage(kIntroImg),
                  //   //getPageDecoration, a method to customise the page style
                  //   decoration: getPageDecoration(),
                  // ),
                  PageViewModel(
                    title: AppLocal.kWelcomeToConqrApp.getString(context),
                    body: AppLocal.kWelcomeToConqrAppText.getString(context),
                    image: buildImage(kIntroImg),
                    //getPageDecoration, a method to customise the page style
                    decoration: getPageDecoration(),
                  ),
                ],
                onDone: () {
                  Get.offAllNamed(Routes.bottomNav);
                  if (kDebugMode) {
                    print("Done clicked");
                  }
                },
                //ClampingScrollPhysics prevent the scroll offset from exceeding the bounds of the content.
                scrollPhysics: const ClampingScrollPhysics(),
                showDoneButton: false,
                showNextButton: false,
                showSkipButton: false,
                skip: const Text("Skip", style: TextStyle(fontWeight: FontWeight.w600)),
                next: const Icon(Icons.forward),
                done: Text("Start Reading", style: TextStyles.kPrimaryRegularPoppins()),
                dotsDecorator: getDotsDecorator()),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30, left: 26, right: 26,top: 14),
            child: commonButton(
              onPressed: () {
                Get.offAllNamed(Routes.bottomNav);
              },
              buttonText: 'Start Reading',
              textStyle: TextStyles.kPrimaryRegularPoppins(colors: kColorWhite),
            ),
          )
        ],
      ),
    );
  }

  //widget to add the image on screen
  Widget buildImage(String imagePath) {
    return Center(
        child: SvgPicture.asset(
      imagePath,
      width: 450,
      height: 200,
    ));
  }

  //method to customise the page style
  PageDecoration getPageDecoration() {
    return PageDecoration(
      imagePadding: EdgeInsets.only(top: 120),
      pageColor: Colors.white,
      titleTextStyle: TextStyles.kPrimaryBoldPoppins(fontSize: TextStyles.k20FontSize),
      bodyPadding: EdgeInsets.only(top: 8, left: 20, right: 20),
      titlePadding: EdgeInsets.only(top: 50),
      bodyTextStyle: TextStyles.kPrimaryRegularPoppins(fontWeight: FontWeight.w500, fontSize: TextStyles.k16FontSize),
    );
  }

  //method to customize the dots style
  DotsDecorator getDotsDecorator() {
    return const DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: 8),
      activeColor: kColorBlack,
      color: kColorDivider,
      activeSize: Size(10, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}
