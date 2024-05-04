import 'dart:collection';

import 'package:powered_by_caffein/Controller/IRestApiController.dart';
import 'package:powered_by_caffein/Controller/RestApiController.dart';

class InfluxDbApiClient {
  IRestApiController restApiController = RestApiController("https://eu-central-1-1.aws.cloud2.influxdata.com/api/v2");
  
  InfluxDbApiClient() {}

  Future<bool> createBucket(String bucketName) async {
    String path = "/buckets";
    Map<String, String> headers = new HashMap<String, String>();
    headers.putIfAbsent("Authorization", () => "Token usTl3DBiSAd75v1F7zp6XHuRSsOPNLVOUkjTkGgnqqq5oinQEyBgfk7Ej2iYEV_v1MfjUc6n8UF5jGY8z5w33A==");
    Map<String, dynamic> body = new HashMap<String, dynamic>();
    body.putIfAbsent("name", () => bucketName);
    body.putIfAbsent("orgId", () => "0ca6ed4e7a7d9571");
    var response = await restApiController.sendPostRequest(path, null, headers, body);
    return response.statusCode == 201;
  }

}