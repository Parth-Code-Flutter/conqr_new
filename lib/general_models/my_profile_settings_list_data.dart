import 'package:conqr_new/constants/localization.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';

class MyProfileSettingsListData {
  String? name;
  String? icon;
  String? navigateTo;

  MyProfileSettingsListData({this.name, this.icon, this.navigateTo});

  static List<MyProfileSettingsListData> myProfileSettingsDataList = [
    MyProfileSettingsListData(name: AppLocal.kPrivacyPolicy.getString(Get.context!)),
    MyProfileSettingsListData(name: AppLocal.kTermsConditions.getString(Get.context!)),
  ];
}
