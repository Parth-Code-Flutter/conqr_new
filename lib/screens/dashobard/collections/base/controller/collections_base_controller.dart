import 'package:conqr_new/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionsBaseController extends GetxController {
  TextEditingController searchCollectionController = TextEditingController();

  void navigateToCollectionsDetailsScreen() {
    Get.toNamed(Routes.collectionsDetailsScreen);
  }
}
