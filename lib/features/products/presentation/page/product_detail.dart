import 'package:auto_route/auto_route.dart';
import 'package:beep_shop/shared/utils/model/product_model.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProductDetainRoute extends StatefulWidget {
  const ProductDetainRoute({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductDetainRoute> createState() => _ProductDetainRouteState();
}

class _ProductDetainRouteState extends State<ProductDetainRoute> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.red,
    );
  }
}
