import 'package:dio/dio.dart';
import 'package:salty_flutter_test/model/api_response_model.dart';
import 'package:salty_flutter_test/model/login_auth_model.dart';
import 'package:salty_flutter_test/model/token_model.dart';
import 'package:salty_flutter_test/utils/dio_client.dart';

class AuthService {
  Future<ApiResponseModel> login(LoginAuthModel model) async {
    Dio apiService = DioClient.init();

    var response = await apiService.post("/login", data: model.toJson());
    if (response.statusCode != 200) {
      return ApiResponseModel.failed(response.data["error"]);
    }

    return ApiResponseModel.success(TokenModel(token: response.data["token"]));
  }
}
