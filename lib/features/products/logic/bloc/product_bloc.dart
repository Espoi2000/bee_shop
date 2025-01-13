import 'package:beep_shop/features/products/data/repositories/product_repository.dart';
import 'package:beep_shop/shared/utils/model/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    on<GetAllProductsEvent>((event, emit) async {
      try {
        emit(GetAllProductLoading());

        var response =
            await productRepository.getAllProduct(limit: event.limit);
        emit(GetAllProductSucces(products: response));
      } catch (e) {
        emit(GetAllProductFailure());
      }
    });
  }
}
