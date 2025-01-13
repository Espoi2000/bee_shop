part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class GetAllProductLoading extends ProductState {}

final class GetAllProductSucces extends ProductState {
  final List<ProductModel> products;

  GetAllProductSucces({required this.products});
}

final class GetAllProductFailure extends ProductState {}
