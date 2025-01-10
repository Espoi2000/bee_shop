part of 'category_bloc.dart';

@immutable
sealed class CategoryState {
  final List<CategoriesModel>? categories;
  const CategoryState({this.categories});
}

final class CategoryInitial extends CategoryState {}

final class CategoryIsLoading extends CategoryState {}

final class CategoryIsSucces extends CategoryState {
  const CategoryIsSucces({super.categories});
}

final class CategoryIsFailure extends CategoryState {
  final String error;
  const CategoryIsFailure({required this.error});
}
