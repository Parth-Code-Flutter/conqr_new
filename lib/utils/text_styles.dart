import 'package:conqr_new/constants/color_constants.dart';
import 'package:flutter/material.dart';

class Font {
  static const gilroy = "gilroy";
  static const gilroyExtraBold = "gilroyExtraBold";
  static const gilroyBold = "gilroyBold";
  static const gilroySemiBold = "gilroySemiBold";
  static const gilroyMedium = "gilroyMedium";
  static const gilroyRegular = "gilroyRegular";

  static const inter = "Inter";
  static const interExtraBold = "InterExtraBold";
  static const interBold = "InterBold";
  static const interSemiBold = "InterSemiBold";
  static const interMedium = "InterMedium";
  static const interRegular = "InterRegular";
}

class TextStyles {
  static const double k6FontSize = 6;
  static const double k8FontSize = 8;
  static const double k10FontSize = 10;
  static const double k12FontSize = 12;
  static const double k14FontSize = 14;
  static const double k16FontSize = 16;
  static const double k18FontSize = 18;
  static const double k20FontSize = 20;
  static const double k22FontSize = 22;
  static const double k21FontSize = 21;
  static const double k24FontSize = 24;
  static const double k28FontSize = 20;
  static const double k34FontSize = 34;

  static TextStyle kPrimaryRegularGilroy({double fontSize = k14FontSize, Color colors = kColorPrimary}) {
    return TextStyle(
      fontSize: fontSize,
      color: colors,
      fontWeight: FontWeight.w400,
      fontFamily: Font.gilroyRegular,
    );
  }

  static TextStyle kPrimarySemiBoldGilroy({double fontSize = k14FontSize, Color colors = kColorPrimary}) {
    return TextStyle(
      fontSize: fontSize,
      color: colors,
      fontWeight: FontWeight.w600,
      fontFamily: Font.gilroySemiBold,
    );
  }

  static TextStyle kPrimaryBoldGilroy({double fontSize = k14FontSize, Color colors = kColorPrimary}) {
    return TextStyle(
      fontSize: fontSize,
      color: colors,
      fontWeight: FontWeight.w700,
      fontFamily: Font.gilroyBold,
    );
  }
}
