import 'package:get/get.dart';

class BottomNavController extends GetxController {
  RxInt currentIndex = 0.obs;

  changeTabIndex(int index) {
    currentIndex.value = index;
    currentIndex.refresh();
  }
}
