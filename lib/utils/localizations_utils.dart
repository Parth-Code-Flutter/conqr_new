import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';

class LocalizationUtils {
  static String languageCodeEnglish = 'en';
  static String languageCodeHindi = 'hi';
  static String languageCodeMarathi = 'mr';

  static String countryCodeEN = 'US';
  static String countryCodeHI = 'IN';
  static String countryCodeMR = 'IN';

  static Rx<TextDirection> screenDirection = TextDirection.ltr.obs; /// rtl

  static FlutterLocalization localization = FlutterLocalization.instance;

  // static updateScreenDirection() async {
  //   gc.userData.value = await Get.find<LocalStorage>().getUserDataFromStorage();
  //   print('_localization ::: ${localization.currentLocale.localeIdentifier}');
  //   String selectedLanguage = localization.currentLocale.localeIdentifier;
  //   if (gc.userData.value.language != null) {
  //     if (selectedLanguage == 'tr_TR') {
  //       screenDirection.value = TextDirection.rtl;
  //     } else if (selectedLanguage == 'ar_AR') {
  //       screenDirection.value = TextDirection.rtl;
  //     }
  //     if (selectedLanguage == 'en_EN') {
  //       screenDirection.value = TextDirection.ltr;
  //     }
  //   }
  // }
}
