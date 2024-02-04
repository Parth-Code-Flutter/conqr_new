class LessonsResData {
  bool? status;
  String? message;
  ResultData? result;

  LessonsResData({this.status, this.message, this.result});

  LessonsResData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result =
        json['result'] != null ? new ResultData.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class ResultData {
  List<Result>? result;
  int? id;

  // Null? exception;
  int? status;
  bool? isCanceled;
  bool? isCompleted;
  bool? isCompletedSuccessfully;
  int? creationOptions;

  // Null? asyncState;
  bool? isFaulted;

  ResultData({
    this.result,
    this.id,
    // this.exception,
    this.status,
    this.isCanceled,
    this.isCompleted,
    this.isCompletedSuccessfully,
    this.creationOptions,
    // this.asyncState,
    this.isFaulted,
  });

  ResultData.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add( Result.fromJson(v));
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    // data['exception'] = this.exception;
    data['status'] = this.status;
    data['isCanceled'] = this.isCanceled;
    data['isCompleted'] = this.isCompleted;
    data['isCompletedSuccessfully'] = this.isCompletedSuccessfully;
    data['creationOptions'] = this.creationOptions;
    // data['asyncState'] = this.asyncState;
    data['isFaulted'] = this.isFaulted;
    return data;
  }
}

class Result {
  int? id;
  String? title;
  String? description;
  String? referenceUrl;
  // Null? categoryIconType;
  int? scrollsCount;

  Result(
      {this.id,
      this.title,
      this.description,
      // this.referenceUrl,
      // this.categoryIconType,
      this.scrollsCount});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    referenceUrl = json['referenceUrl'];
    // categoryIconType = json['categoryIconType'];
    scrollsCount = json['scrollsCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['referenceUrl'] = this.referenceUrl;
    // data['categoryIconType'] = this.categoryIconType;
    data['scrollsCount'] = this.scrollsCount;
    return data;
  }
}
