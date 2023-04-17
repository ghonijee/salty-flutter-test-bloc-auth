import 'package:dio/dio.dart';

class DioClient {
  static init() {
    late Dio client;
    var options = BaseOptions(baseUrl: "https://reqres.in/api", contentType: "application/json");

    client = Dio(options);

    return client;
  }
}
