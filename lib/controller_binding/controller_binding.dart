import 'package:conqr_new/screens/dashobard/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:conqr_new/screens/dashobard/collections/base/controller/collections_base_controller.dart';
import 'package:conqr_new/screens/dashobard/home/base/controller/home_base_controller.dart';
import 'package:conqr_new/screens/dashobard/my_profile/base/controller/my_profile_base_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController(), fenix: true);
    Get.lazyPut<HomeBaseController>(() => HomeBaseController(), fenix: true);
    Get.lazyPut<CollectionsBaseController>(() => CollectionsBaseController(), fenix: true);
    Get.lazyPut<MyProfileBaseController>(() => MyProfileBaseController(), fenix: true);
  }
}
