import 'package:flutter/material.dart';

class LessonsResData {
  bool? status;
  String? message;
  ResultData? result;

  LessonsResData({this.status, this.message, this.result});

  LessonsResData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result =
        json['result'] != null ? ResultData.fromJson(json['result']) : null;
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
        result!.add(Result.fromJson(v));
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
    // data['exception'] = this.exception;
    data['status'] = status;
    data['isCanceled'] = isCanceled;
    data['isCompleted'] = isCompleted;
    data['isCompletedSuccessfully'] = isCompletedSuccessfully;
    data['creationOptions'] = creationOptions;
    // data['asyncState'] = this.asyncState;
    data['isFaulted'] = isFaulted;
    return data;
  }
}

class Result {
  int? id;
  String? title;
  String? description;
  String? referenceUrl;
  GlobalKey<FormState>? key;

  // Null? categoryIconType;
  int? scrollsCount;
  bool? isQuote;

  Result({
    this.id,
    this.title,
    this.description,
    // this.referenceUrl,
    // this.categoryIconType,
    this.scrollsCount,
    this.isQuote,
    this.key,
  });

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    referenceUrl = json['referenceUrl'];
    // categoryIconType = json['categoryIconType'];
    scrollsCount = json['scrollsCount'];
    isQuote = json['isQuote'];
    key = json['key'] ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['referenceUrl'] = referenceUrl;
    // data['categoryIconType'] = this.categoryIconType;
    data['scrollsCount'] = scrollsCount;
    data['isQuote'] = isQuote;
    data['key'] = key;
    return data;
  }
}
