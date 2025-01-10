import 'package:beep_shop/features/categories/data/service/categorie_service.dart';
import 'package:beep_shop/shared/utils/model/categories_model.dart';

class CategorieRepository {
  final CategorieService categorieService;
  CategorieRepository({required this.categorieService});

  Future<List<CategoriesModel>> getAllCategories() async {
    var res = await categorieService.getAllCategorie();
    return res.map((cat) => CategoriesModel(categories: cat)).toList();
  }
}
