import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductService {
  final Dio http;
  ProductService({required this.http});

  Future<List<Map<String, dynamic>>> getAllProductByLimit(
      {required int limit}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("accessToken");

    final response = await http.get("/products?limit=$limit",
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }));
    return List<Map<String, dynamic>>.from(response.data["products"]);
  }
}
