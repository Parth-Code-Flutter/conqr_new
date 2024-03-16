import 'package:conqr_new/repo/home_repo.dart';
import 'package:conqr_new/screens/dashobard/collections/base/model/collections_res_model.dart';
import 'package:conqr_new/screens/dashobard/home/base/model/lesson_collection_req_model.dart';
import 'package:conqr_new/screens/dashobard/home/base/model/lesson_res_model.dart';
import 'package:conqr_new/utils/debug_print.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionsDetailsController extends GetxController {
  Rx<ResultData> lessonData = ResultData().obs;
  Rx<CollectionsResultData> collectionDetailsData = CollectionsResultData().obs;
  RxList<CollectionsResultData> list =
      List<CollectionsResultData>.empty(growable: true).obs;

  @override
  void onInit() {
    Get.lazyPut(() => HomeRepo(), fenix: true);
    getIntentData();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getLessonDataFromServer();
    });
    super.onInit();
  }

  void getIntentData() {
    collectionDetailsData.value = Get.arguments[0];
    list.value = Get.arguments[1];
  }

  getLessonDataFromServer() async {
    try {
      LessonCollectionReqModel reqModel = LessonCollectionReqModel(
          collectionId: collectionDetailsData.value.id ?? 0,
          isCollection: true,
          page: 1,
          pageSize: 10);
      var response =
          await Get.find<HomeRepo>().getLessonDataFromApi(reqModel: reqModel);
      var res = LessonsResData.fromJson(response);

      lessonData.value = res.result ?? ResultData();
      print('lessonsDataList :: ${lessonData.value}');
    } catch (e) {
      debugPrintMethod(str: 'getLessonDataFromServer', data: e);
    }
  }
}
