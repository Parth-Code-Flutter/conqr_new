class Collections {
  bool? status;
  String? message;
  CollectionsResult? result;

  Collections({this.status, this.message, this.result});

  Collections.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'] != null
        ? CollectionsResult.fromJson(json['result'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class CollectionsResult {
  List<CollectionsResultData>? result;
  int? id;

  // Null? exception;
  int? status;
  bool? isCanceled;
  bool? isCompleted;
  bool? isCompletedSuccessfully;
  int? creationOptions;

  // Null? asyncState;
  bool? isFaulted;

  CollectionsResult(
      {this.result,
      this.id,
      // this.exception,
      this.status,
      this.isCanceled,
      this.isCompleted,
      this.isCompletedSuccessfully,
      this.creationOptions,
      // this.asyncState,
      this.isFaulted});

  CollectionsResult.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <CollectionsResultData>[];
      json['result'].forEach((v) {
        result!.add(CollectionsResultData.fromJson(v));
      });
    }
    id = json['id'];
    // exception = json['exception'];
    status = json['status'];
    isCanceled = json['isCanceled'];
    isCompleted = json['isCompleted'];
    isCompletedSuccessfully = json['isCompletedSuccessfully'];
    creationOptions = json['creationOptions'];
    // asyncState = json['asyncState'];
    isFaulted = json['isFaulted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    // data['exception'] = exception;
    data['status'] = status;
    data['isCanceled'] = isCanceled;
    data['isCompleted'] = isCompleted;
    data['isCompletedSuccessfully'] = isCompletedSuccessfully;
    data['creationOptions'] = creationOptions;
    // data['asyncState'] = asyncState;
    data['isFaulted'] = isFaulted;
    return data;
  }
}

class CollectionsResultData {
  int? id;
  String? description;
  String? referenceUrl;
  int? categoryIconType;
  int? scrollsCount;
  bool? isVisited;

  CollectionsResultData(
      {this.id,
      this.description,
      this.referenceUrl,
      this.categoryIconType,
      this.scrollsCount,
      this.isVisited});

  CollectionsResultData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    referenceUrl = json['referenceUrl'];
    categoryIconType = json['categoryIconType'];
    scrollsCount = json['scrollsCount'];
    isVisited = json['isVisited'] = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['referenceUrl'] = referenceUrl;
    data['categoryIconType'] = categoryIconType;
    data['scrollsCount'] = scrollsCount;
    data['isVisited'] = isVisited;
    return data;
  }
}
