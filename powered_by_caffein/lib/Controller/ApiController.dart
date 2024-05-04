import "package:dio/dio.dart";

class ApiController {
  Dio dio = Dio();

  ApiController() {
    dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
  }

  Future<String> getApiData() async {
    try {
      Response response = await dio.get("/posts",);
      return response.data.toString();
    } catch (e) {
      return e.toString();
    }
  }
  
}

final apiController = ApiController();