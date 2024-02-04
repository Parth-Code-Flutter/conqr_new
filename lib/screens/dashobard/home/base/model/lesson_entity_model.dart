class LessonEntityModel {
  List<LessonResultEntity> results;

  LessonEntityModel({required this.results});
}

class LessonResultEntity {
  String title, content;

  LessonResultEntity({required this.title, required this.content});
}
