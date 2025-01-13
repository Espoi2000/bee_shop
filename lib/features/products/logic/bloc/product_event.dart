part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

final class GetAllProductsEvent extends ProductEvent {
  final int limit;
  GetAllProductsEvent({required this.limit});
}
