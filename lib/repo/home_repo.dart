import 'package:conqr_new/constants/api_constants.dart';
import 'package:conqr_new/constants/status_codes.dart';
import 'package:conqr_new/network/api_service.dart';
import 'package:conqr_new/screens/dashobard/home/base/model/lesson_collection_req_model.dart';
import 'package:conqr_new/screens/dashobard/home/base/model/lesson_entity_model.dart';
import 'package:conqr_new/utils/debug_print.dart';

class HomeRepo {
  final ApiService _apiService = ApiService();

  Future<Map<String, dynamic>> getLessonDataFromApi(
      {required LessonCollectionReqModel reqModel}) async {
    try {
      var response = await _apiService.post(
        ApiConstants.getScrolls,
        data: reqModel.toJson(),
      );

      if (response.statusCode == successStatusCode) {
        return response.data;
      }
    } catch (e) {
      debugPrintMethod(str: 'getLessonDataFromApi', data: e);
    }
    return {};
  }
}
