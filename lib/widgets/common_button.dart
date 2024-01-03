import 'package:conqr_new/constants/color_constants.dart';
import 'package:conqr_new/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

commonButton({
  required VoidCallback onPressed,
  String? buttonText,
  Color? textColor,
  Color? buttonColor,
  Color? buttonBorderColor,
  double? buttonHeight,
  Widget? buttonIcon,
  double? buttonWidth,
  TextStyle? textStyle,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      height: buttonHeight ?? 45,
      width: buttonWidth ?? Get.width,
      decoration: BoxDecoration(
        color: buttonColor ?? kColorPrimary,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: buttonBorderColor ?? kColorPrimary),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(buttonText ?? "", style: textStyle ?? TextStyles.kPrimaryRegularRobotoSlab(colors: textColor ?? kColorWhite)),
          buttonIcon != null ? const SizedBox(width: 10) : Container(),
          buttonIcon ?? const SizedBox()
        ],
      ),
      // child: ElevatedButton(
      //   onPressed: onPressed,
      //   style: ElevatedButton.styleFrom(
      //       backgroundColor:buttonColor??kColorPrimary
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(buttonText ?? "", style: TextStyles.kPrimaryRegularInter(
      //           colors: textColor ?? kButtonTextColor)),
      //       const SizedBox(width: 10),
      //       buttonIcon??const SizedBox()
      //     ],
      //   ),
      // ),
    ),
  );
}
