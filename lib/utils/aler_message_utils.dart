import 'package:conqr_new/constants/color_constants.dart';
import 'package:conqr_new/utils/debug_print.dart';
import 'package:conqr_new/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AlertMessageUtils {
  /// show success popup snackBar message
  void showSuccessSnackBar(String message) {
    Get.snackbar(
      'Success',
      message,
      titleText: Text('Success',
          style: TextStyles.kPrimaryRegularPoppins(colors: kColorWhite)),
      messageText: Text(
        message,
        style: TextStyles.kPrimaryRegularPoppins(colors: kColorWhite),
      ),
      snackPosition: SnackPosition.BOTTOM,
      // colorText: kColorGreen48A300,
      backgroundColor: kColorPrimary,
      margin: const EdgeInsets.all(12),
    );
  }

  /// show error popup snackBar message
  void showErrorSnackBar(String message) {
    Get.snackbar('Error', message,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 10, left: 8, right: 8));
  }

  /// show circular progress bar
  void showProgressDialog() {
    try {
      showDialog(
          context: Get.overlayContext!,
          builder: (_) => WillPopScope(
                child: const Center(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: LoadingIndicator(
                        indicatorType: Indicator.ballPulse,

                        /// Required, The loading type of the widget
                        colors: [kColorWhite],

                        /// Optional, The color collections
                        strokeWidth: 2,

                        /// Optional, The stroke of the line, only applicable to widget which contains line
                        backgroundColor: Colors.transparent,

                        /// Optional, Background of the widget
                        pathBackgroundColor: Colors.black

                        /// Optional, the stroke backgroundColor
                        ),
                  ),
                  // SizedBox(
                  //   width: 60,
                  //   height: 60,
                  //   child: Lottie.asset('lib/assets/gifs/loader.json'),
                  // ),
                ),
                onWillPop: () async => false,
              ));
    } catch (e) {
      debugPrintMethod(str: 'showProgressDialog', data: e);
    }
  }

  /// hider circular progress bar
  void hideProgressDialog() {
    try {
      Navigator.of(Get.overlayContext!).pop();
    } catch (ex) {
      debugPrintMethod(str: 'hideProgressDialog', data: ex);
    }
  }
}
