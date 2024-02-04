import 'package:conqr_new/repo/collections_repo.dart';
import 'package:conqr_new/routes/app_pages.dart';
import 'package:conqr_new/screens/dashobard/collections/base/model/collections_res_model.dart';
import 'package:conqr_new/screens/dashobard/home/base/model/lesson_collection_req_model.dart';
import 'package:conqr_new/utils/debug_print.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionsBaseController extends GetxController {
  Rx<Collections> collections = Collections().obs;
  TextEditingController searchCollectionController = TextEditingController();

  @override
  void onInit() {
    Get.lazyPut(() => CollectionsRepo(), fenix: true);
    super.onInit();
  }

  void navigateToCollectionsDetailsScreen() {
    Get.toNamed(Routes.collectionsDetailsScreen);
  }

  getCollectionsDataFromServer() async {
    try {
      LessonCollectionReqModel reqModel =
          LessonCollectionReqModel(page: 1, pageSize: 10);

      var res = await Get.find<CollectionsRepo>()
          .getCollectionsDataFromApi(reqModel: reqModel);
      collections.value = Collections.fromJson(res);
    } catch (e) {
      debugPrintMethod(str: 'getCollectionsDataFromServer', data: e);
    }
  }
}
