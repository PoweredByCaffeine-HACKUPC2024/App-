

import 'package:dio/dio.dart';

abstract class IRestApiController {

  Future<Response> sendGetRequest(String path, Map<String, String>? queryParameters, Map<String, String>? headers);
  Future<Response> sendPostRequest(String baseUrl, String path, Map<String, String>? queryParameters, Map<String, String> headers, Map<String, dynamic> body);
  
}
