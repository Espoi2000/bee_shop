import 'package:beep_shop/features/auth/data/model/auth_model.dart';
import 'package:beep_shop/shared/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio dio;
  AuthService({required this.dio});

  Future<Map<String, dynamic>> loginAuthService(
      {required AuthLoginModel authLoginModel}) async {
    Response response = await dio.post(
      "/auth/login",
      data: authLoginModel.toJson(),
    );

    return response.data;
  }
}
