import 'package:conqr_new/screens/dashobard/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController(), fenix: true);
  }
}
