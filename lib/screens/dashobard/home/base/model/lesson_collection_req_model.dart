class LessonCollectionReqModel {
  int? collectionId;
  bool? isCollection;
  int? page;
  int? pageSize;

  LessonCollectionReqModel(
      {this.collectionId, this.isCollection, this.page, this.pageSize});

  LessonCollectionReqModel.fromJson(Map<String, dynamic> json) {
    collectionId = json['collectionid'];
    isCollection = json['iscollection'];
    page = json['page'];
    pageSize = json['pagesize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['collectionid'] = collectionId;
    data['iscollection'] = isCollection;
    data['page'] = page;
    data['pagesize'] = pageSize;
    return data;
  }
}
