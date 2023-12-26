import 'package:conqr_new/constants/localization.dart';

class MyProfileSettingsListData {
  String? name;
  String? icon;
  String? navigateTo;

  MyProfileSettingsListData({this.name, this.icon, this.navigateTo});

  static List<MyProfileSettingsListData> myProfileSettingsDataList = [
    MyProfileSettingsListData(name: AppLocal.kPrivacyPolicy),
    MyProfileSettingsListData(name: AppLocal.kTermsConditions),
  ];
}
