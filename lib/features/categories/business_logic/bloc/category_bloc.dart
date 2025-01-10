import 'package:beep_shop/features/categories/data/repositories/categorie_repository.dart';
import 'package:beep_shop/shared/utils/model/categories_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategorieRepository categorieRepository;
  CategoryBloc({required this.categorieRepository}) : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) async {
      try {
        emit(CategoryIsLoading());
        var response = await categorieRepository.getAllCategories();
        print(response);
        emit(CategoryIsSucces(categories: response));
      } catch (e) {
        print(e.toString());
        emit(CategoryIsFailure(error: e.toString()));
      }
    });
  }
}
