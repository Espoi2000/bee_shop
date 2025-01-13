import 'package:beep_shop/features/products/data/service/product_service.dart';
import 'package:beep_shop/shared/utils/model/product_model.dart';

class ProductRepository {
  final ProductService productService;

  ProductRepository({required this.productService});

  Future<List<ProductModel>> getAllProduct({required int limit}) async {
    var response = await productService.getAllProductByLimit(limit: limit);

    var prod = List.from(response);
    return prod.map((product) => ProductModel.fromJson(product)).toList();
  }
}
