import 'package:salty_flutter_test/model/token_model.dart';

class ApiResponseModel<T> {
  late String? message;
  late dynamic data;
  late bool? status;

  ApiResponseModel({this.data, this.message, this.status});

  factory ApiResponseModel.failed(String message) {
    return ApiResponseModel(message: message, status: false, data: null);
  }

  factory ApiResponseModel.success(data) {
    return ApiResponseModel(message: "success", status: true, data: data);
  }
}
