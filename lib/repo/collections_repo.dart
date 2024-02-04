import 'package:conqr_new/constants/api_constants.dart';
import 'package:conqr_new/constants/status_codes.dart';
import 'package:conqr_new/network/api_service.dart';
import 'package:conqr_new/screens/dashobard/home/base/model/lesson_collection_req_model.dart';
import 'package:conqr_new/utils/debug_print.dart';

class CollectionsRepo {
  Future<Map<String, dynamic>> getCollectionsDataFromApi(
      {required LessonCollectionReqModel reqModel}) async {
    try {
      var res = await ApiService()
          .post(ApiConstants.getCollections, data: reqModel.toJson());
      if (res.statusCode == successStatusCode) {
        return res.data;
      }
    } catch (e) {
      debugPrintMethod(str: 'getCollectionsDataFromApi', data: e);
    }
    return {};
  }
}
