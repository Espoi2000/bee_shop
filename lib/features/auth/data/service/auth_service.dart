import 'package:beep_shop/features/auth/data/model/auth_model.dart';
import 'package:beep_shop/shared/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio dio;
  AuthService({required this.dio});

  Future<Map<String, dynamic>> loginAuthService(
      {required AuthLoginModel authLoginModel}) async {
    print("ici");
    print(authLoginModel.toJson());
    Response response = await dio.post(
      "/auth/login",
      data: {
        "username": authLoginModel.username,
        "password": authLoginModel.password
      },
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> getCurrentUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString("accessToken");
    Response response = await dio.get(
      "/user/me",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        },
      ),
    );
    return response.data;
  }
}
