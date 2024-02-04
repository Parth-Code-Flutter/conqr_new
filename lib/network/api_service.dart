import 'package:conqr_new/constants/api_constants.dart';
import 'package:conqr_new/network/dio_interceptor.dart';
import 'package:conqr_new/utils/aler_message_utils.dart';
import 'package:conqr_new/utils/debug_print.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  late Dio _dio;

  factory ApiService() {
    return _instance;
  }

  ApiService._internal() {
    // Create Dio instance with base URL and any default configurations
    _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

    // Add the custom interceptor
    _dio.interceptors.add(MyInterceptor());
  }

  // Method for making GET requests
  Future<Response> get(String path,
      {required Map<String, dynamic> queryParameters,
      bool isShowLoader = true}) async {
    if (isShowLoader) {
      AlertMessageUtils().showProgressDialog();
    }
    try {
      debugPrintMethod(str: 'get method', data: path);
      final response = await _dio.get(ApiConstants.baseUrl + path,
          queryParameters: queryParameters);
      return response;
    } catch (error) {
      rethrow;
    } finally {
      if (isShowLoader) {
        AlertMessageUtils().hideProgressDialog();
      }
    }
  }

  // Method for making POST requests
  Future<Response> post(String path,
      {required Map<String, dynamic> data, bool isShowLoader = true}) async {
    if (isShowLoader) {
      AlertMessageUtils().showProgressDialog();
    }
    try {
      final response = await _dio.post(ApiConstants.baseUrl + path, data: data);
      return response;
    } catch (error) {
      rethrow;
    } finally {
      if (isShowLoader) {
        AlertMessageUtils().hideProgressDialog();
      }
    }
  }

  // Add more methods for other HTTP request types as needed

  // For example, a method for making PUT requests
  Future<Response> put(String path,
      {required Map<String, dynamic> data, bool isShowLoader = true}) async {
    if (isShowLoader) {
      AlertMessageUtils().showProgressDialog();
    }
    try {
      final response = await _dio.put(path, data: data);
      return response;
    } catch (error) {
      rethrow;
    } finally {
      if (isShowLoader) {
        AlertMessageUtils().hideProgressDialog();
      }
    }
  }
}
