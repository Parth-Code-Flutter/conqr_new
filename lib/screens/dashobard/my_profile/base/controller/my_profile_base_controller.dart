import 'package:conqr_new/general_models/my_profile_settings_list_data.dart';
import 'package:get/get.dart';

class MyProfileBaseController extends GetxController {
  RxList<MyProfileSettingsListData> myProfileSettingsDataList = List<MyProfileSettingsListData>.empty(growable: true).obs;

  @override
  void onInit() {
    myProfileSettingsDataList.addAll(MyProfileSettingsListData.myProfileSettingsDataList);
    super.onInit();
  }
}
