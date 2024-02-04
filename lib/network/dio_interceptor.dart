import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MyInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Do something before the request is sent
    debugPrint('Request Interceptor - Before Request: ${options.method} ${options.path}');

    // You can modify the headers or other request parameters here
    // options.headers["Authorization"] = "Bearer your_token";

    return handler.next(options); // Must call next to continue with the request
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    // Do something with the response data
    debugPrint('Response Interceptor - Response: ${response.statusCode} ${response.statusMessage}');

    return handler.next(response); // Must call next to continue with the response
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) async {
    // Handle errors here
    debugPrint('Error Interceptor - Error: ${err.message}');

    return handler.next(err); // Must call next to propagate the error
  }
}
