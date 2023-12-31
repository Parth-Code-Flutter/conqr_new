import 'package:conqr_new/constants/color_constants.dart';
import 'package:flutter/material.dart';

class Font {
  static const gilroy = "gilroy";
  static const gilroyExtraBold = "gilroyExtraBold";
  static const gilroyBold = "gilroyBold";
  static const gilroySemiBold = "gilroySemiBold";
  static const gilroyMedium = "gilroyMedium";
  static const gilroyRegular = "gilroyRegular";

  static const poppins = "Poppins";
  static const poppinsRegular = "PoppinsRegular";
  static const poppinsSemiBold = "PoppinsSemiBold";
  static const poppinsBold = "PoppinsBold";

  static const robotoSlab = "RobotoSlab";
  static const robotoSlabRegular = "RobotoSlabRegular";
  static const robotoSlabSemiBold = "RobotoSlabSemiBold";
  static const robotoSlabBold = "RobotoSlabBold";
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

  static TextStyle kPrimaryRegularPoppins({double fontSize = k14FontSize, Color colors = kColorPrimary, FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
      fontSize: fontSize,
      color: colors,
      fontWeight: fontWeight,
      fontFamily: Font.poppinsRegular,
    );
  }

  static TextStyle kPrimarySemiBoldPoppins({double fontSize = k14FontSize, Color colors = kColorPrimary, FontWeight fontWeight = FontWeight.w600}) {
    return TextStyle(
      fontSize: fontSize,
      color: colors,
      fontWeight: fontWeight,
      fontFamily: Font.poppinsSemiBold,
    );
  }

  static TextStyle kPrimaryBoldPoppins({double fontSize = k14FontSize, Color colors = kColorPrimary, FontWeight fontWeight = FontWeight.w700}) {
    return TextStyle(
      fontSize: fontSize,
      color: colors,
      fontWeight: fontWeight,
      fontFamily: Font.poppinsBold,
    );
  }

  static TextStyle kPrimaryRegularRobotoSlabWithUnderLine({double fontSize = k14FontSize, Color colors = kColorPrimary, FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
      fontSize: fontSize,
      color: colors,
      fontWeight: fontWeight,
      decoration: TextDecoration.underline,
      fontFamily: Font.robotoSlabRegular,
    );
  }

  static TextStyle kPrimaryRegularRobotoSlab({double fontSize = k14FontSize, Color colors = kColorPrimary, FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
      fontSize: fontSize,
      color: colors,
      fontWeight: fontWeight,
      fontFamily: Font.robotoSlabRegular,
    );
  }

  static TextStyle kPrimarySemiBoldRobotoSlab({double fontSize = k14FontSize, Color colors = kColorPrimary, FontWeight fontWeight = FontWeight.w600}) {
    return TextStyle(
      fontSize: fontSize,
      color: colors,
      fontWeight: fontWeight,
      fontFamily: Font.robotoSlabSemiBold,
    );
  }

  static TextStyle kPrimaryBoldRobotoSlab({double fontSize = k14FontSize, Color colors = kColorPrimary, FontWeight fontWeight = FontWeight.w700}) {
    return TextStyle(
      fontSize: fontSize,
      color: colors,
      fontWeight: fontWeight,
      fontFamily: Font.robotoSlabBold,
    );
  }
}
