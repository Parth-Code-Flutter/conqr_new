import 'dart:ui';

import 'package:conqr_new/screens/dashobard/home/base/model/lesson_collection_req_model.dart';
import 'package:conqr_new/repo/home_repo.dart';
import 'package:conqr_new/screens/dashobard/home/base/model/lesson_entity_model.dart';
import 'package:conqr_new/screens/dashobard/home/base/model/lesson_res_model.dart';
import 'package:conqr_new/utils/debug_print.dart';
import 'package:get/get.dart';

class HomeBaseController extends GetxController {
  Rx<ResultData> lessonData = ResultData().obs;
  RxBool isApiCalling =true.obs;

  @override
  void onInit() {
    Get.lazyPut(() => HomeRepo(), fenix: true);
    super.onInit();
  }

  getLessonDataFromServer() async {
    try {
      isApiCalling.value=true;
      LessonCollectionReqModel reqModel =
          LessonCollectionReqModel(collectionId: 0, isCollection: false,page: 1,pageSize: 10);
      var response =
          await Get.find<HomeRepo>().getLessonDataFromApi(reqModel: reqModel);
      var res = LessonsResData.fromJson(response);

      lessonData.value = res.result ?? ResultData();
      print('lessonsDataList :: ${lessonData.value}');
      isApiCalling.value=false;
    } catch (e) {
      isApiCalling.value =false;
      debugPrintMethod(str: 'getLessonDataFromServer', data: e);
    }
  }
}
