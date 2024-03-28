import 'package:conqr_new/repo/home_repo.dart';
import 'package:conqr_new/screens/dashobard/collections/base/model/collections_res_model.dart';
import 'package:conqr_new/screens/dashobard/home/base/model/lesson_collection_req_model.dart';
import 'package:conqr_new/screens/dashobard/home/base/model/lesson_res_model.dart';
import 'package:conqr_new/utils/debug_print.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionsDetailsController extends GetxController {
  Rx<ResultData> lessonData = ResultData().obs;
  RxList<Result> resultsList = List<Result>.empty(growable: true).obs;
  Rx<CollectionsResultData> collectionDetailsData = CollectionsResultData().obs;
  RxList<CollectionsResultData> list =
      List<CollectionsResultData>.empty(growable: true).obs;
  int currentCollectionIndex = 0;

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
    currentCollectionIndex = Get.arguments[2] ;
  }

  getLessonDataFromServer({int? collectionID}) async {
    try {
      LessonCollectionReqModel reqModel = LessonCollectionReqModel(
          collectionId: collectionID ?? collectionDetailsData.value.id ?? 0,
          isCollection: true,
          page: 1,
          pageSize: 10);
      var response =
          await Get.find<HomeRepo>().getLessonDataFromApi(reqModel: reqModel);
      var res = LessonsResData.fromJson(response);

      resultsList.addAll(res.result?.result??[]);
      print('length ::: ${resultsList.length}');
      // lessonData.value = res.result ?? ResultData();
      // print('lessonsDataList :: ${lessonData.value}');
    } catch (e) {
      debugPrintMethod(str: 'getLessonDataFromServer', data: e);
    }
  }

  Future<void> updateCollectionsList() async {
    if ((currentCollectionIndex+1) != list.length) {
      currentCollectionIndex  = currentCollectionIndex+ 1;
      int id = list[currentCollectionIndex].id??0;
      await getLessonDataFromServer(collectionID: id);
      list.refresh();
    }
  }
}
