import 'package:conqr_new/screens/dashobard/collections/base/controller/collections_base_controller.dart';
import 'package:conqr_new/screens/dashobard/home/base/controller/home_base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onIndexChanged(currentIndex.value);
    });
    super.onInit();
  }

  changeTabIndex(int index) {
    currentIndex.value = index;
    currentIndex.refresh();
    onIndexChanged(index);
  }

  onIndexChanged(int index) {
    switch (index) {
      case 0:
        Get.find<HomeBaseController>().getLessonDataFromServer();
        break;
      case 1:
        Get.find<CollectionsBaseController>().getCollectionsDataFromServer();
        break;
    }
  }
}
