import 'package:beep_shop/features/auth/data/model/auth_model.dart';
import 'package:beep_shop/features/auth/data/service/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository({required this.authService});

  Future<AuthModel> loginRepository(
      {required AuthLoginModel authLoginModel}) async {
    var response =
        await authService.loginAuthService(authLoginModel: authLoginModel);

    // set data into shared preferences
    print(response);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("accessToken", response["accessToken"]);
    prefs.setString("refreshToken", response["refreshToken"]);
    prefs.setInt("id", response["id"]);
    //
    return AuthModel.fromMap(response);
  }


  Future<AuthModel> getCurrentUser() async {
    var response = await authService.getCurrentUser();
    return AuthModel.fromMap(response);
  }
}
