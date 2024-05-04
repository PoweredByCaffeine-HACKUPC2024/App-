import 'dart:ffi';
import "package:dio/dio.dart";

import 'IRestApiController.dart';

class RestApiController implements IRestApiController {

  Dio dio = Dio();

  RestApiController(String baseUrl) {
    dio.options.baseUrl = baseUrl;
  }
  
  @override
  Future<Response> sendGetRequest(String path, Map<String, String>? queryParameters, Map<String, String>? headers) async {
    Response response = await dio.post(path, queryParameters: queryParameters, options: Options(headers: headers));
    return response;
  }
  
  @override
  Future<Response> sendPostRequest(String baseUrl, String path, Map<String, String>? queryParameters, Map<String, String> headers, Map<String, dynamic> body) async {
    Response response = await dio.post(path, queryParameters: queryParameters, options: Options(headers: headers), data: body);
    return response;
  }
  

}