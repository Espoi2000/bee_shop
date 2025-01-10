import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategorieService {
  final Dio http;
  CategorieService({
    required this.http,
  });

  Future<List<String>> getAllCategorie() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("accessToken");
    final response = await http.get("/products/category-list",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ));
    print(response.data);
    return List<String>.from(response.data);
  }
}
