import 'package:dio/dio.dart';
import 'package:salty_flutter_test/model/user_model.dart';

import '../model/api_response_model.dart';
import '../utils/dio_client.dart';

class UserService {
  Future<List<UserModel>> list(int page) async {
    Dio apiService = DioClient.init();

    var response = await apiService.get("/users?page=$page");

    List<UserModel> data = [];
    if (response.statusCode != 200) {
      return data;
    }

    response.data["data"].forEach((item) {
      data.add(UserModel.fromJson(item));
    });

    return data;
  }

  show(int id) async {
    Dio apiService = DioClient.init();

    var response = await apiService.get("/users/$id");
    if (response.statusCode != 200) {
      return ApiResponseModel.failed("User not found");
    }

    return ApiResponseModel.success(UserModel.fromJson(response.data["data"]));
  }
}
