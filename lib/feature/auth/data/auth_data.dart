import 'package:dio/dio.dart';
import 'package:el_wekala/core/helper/cash_helper/cash_helper.dart';
import 'package:el_wekala/feature/auth/model/response_model.dart';

class AuthData {
  static final Dio dio = Dio();
  static register({
    required String name,
    required String email,
    required String phone,
    required String nationalId,
    required String gender,
    required String password,
    required String profileImage,
  }) async {
    try {
      var response = await dio.post(
        "https://elwekala.onrender.com/user/register",
        data: {
          "name": name,
          "email": email,
          "phone": phone,
          "nationalId": nationalId,
          "gender": gender,
          "password": password,
          "profileImage": profileImage,
        },
      );
      print(response.data);
      print(response.statusMessage);
      var data = response.data;
      var model = ResponseModel.fromJson(data);
      return model;
    } on DioException catch (e) {
      if (e.response != null) {
        var error = e.response!.data;
        print(error);
        var errorModel = ResponseModel.fromJson(error);
        return errorModel;
      }
    }
  }

  static login({required String email, required String password}) async {
    try {
      var response = await dio.post(
        "https://elwekala.onrender.com/user/login",
        data: {"email": email, "password": password},
      );
      print('login dataaa${response.data}');
      print('status messageeee${response.statusMessage}');
      var data = response.data;
      var model = ResponseModel.fromJson(data);
      CashHelper.saveData(key: "token", value: model.userModel?.token ?? '');
      CashHelper.saveData(key: "email", value: model.userModel?.email ?? '');
      return model;
    } on DioException catch (e) {
      if (e.response != null) {
        var error = e.response!.data;
        var errorModel = ResponseModel.fromJson(error);
        return errorModel;
      }
    }
  }
}
