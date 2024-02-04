import 'package:conqr_new/base/base_mapper.dart';
import 'package:conqr_new/screens/dashobard/home/base/model/lesson_entity_model.dart';
import 'package:conqr_new/screens/dashobard/home/base/model/lesson_res_model.dart';

class HomeScreenMapper extends BaseMapper<LessonsResData, LessonEntityModel> {
  @override
  LessonEntityModel map(LessonsResData t) {
    return LessonEntityModel(results: t.result as List<LessonResultEntity>);
  }
}
