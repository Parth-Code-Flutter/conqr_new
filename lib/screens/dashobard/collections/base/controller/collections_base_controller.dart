import 'package:conqr_new/repo/collections_repo.dart';
import 'package:conqr_new/routes/app_pages.dart';
import 'package:conqr_new/screens/dashobard/collections/base/model/collections_res_model.dart';
import 'package:conqr_new/screens/dashobard/home/base/model/lesson_collection_req_model.dart';
import 'package:conqr_new/utils/debug_print.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionsBaseController extends GetxController {
  Rx<Collections> collections = Collections().obs;
  RxList<CollectionsResultData> searchCollectionList =
      List<CollectionsResultData>.empty(growable: true).obs;

  RxBool isApiCalling = true.obs;
  TextEditingController searchCollectionController = TextEditingController();
  RxString searchStr = ''.obs;

  @override
  void onInit() {
    Get.lazyPut(() => CollectionsRepo(), fenix: true);
    super.onInit();
  }

  Future<void> navigateToCollectionsDetailsScreen(
      int index, CollectionsResultData data) async {
    await Get.toNamed(Routes.collectionsDetailsScreen,
        arguments: [data, collections.value.result?.result, index]);
    int i = collections.value.result?.result
            ?.indexWhere((element) => element.isVisited == true) ??
        -1;
    if (i != -1) {
      collections.value.result?.result?[i].isVisited = false;
    }
    collections.value.result?.result?[index].isVisited = true;
    collections.refresh();
  }

  getCollectionsDataFromServer() async {
    try {
      isApiCalling.value = true;
      LessonCollectionReqModel reqModel =
          LessonCollectionReqModel(page: 1, pageSize: 10);

      var res = await Get.find<CollectionsRepo>()
          .getCollectionsDataFromApi(reqModel: reqModel);
      collections.value = Collections.fromJson(res);
      isApiCalling.value = false;
    } catch (e) {
      isApiCalling.value = false;
      debugPrintMethod(str: 'getCollectionsDataFromServer', data: e);
    }
  }

  void searchCollectionFromList() {
    searchCollectionList.clear();
    if (searchStr.isNotEmpty) {
      collections.value.result?.result?.forEach(
        (element) {
          if ((element.description ?? '')
              .toLowerCase()
              .contains(searchStr.value.trim().toLowerCase())) {
            searchCollectionList.add(element);
          }
        },
      );
    }
  }
}
