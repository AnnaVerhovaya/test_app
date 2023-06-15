part of 'category_bloc.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class DishesLoadedState extends CategoryState {
  List<Dishes> alldishes;
  DishesLoadedState({
    required this.alldishes,
  });
}

class CategoriesLoadedState extends CategoryState {
  List<Categories> allCategories;
  CategoriesLoadedState({
    required this.allCategories,
  });
}

class DishesSortState extends CategoryState {
  List<Dishes> sortDishes;
  DishesSortState({
    required this.sortDishes,
  });
}

class CategoryErrorState extends CategoryState {
  String error;
  CategoryErrorState({
    required this.error,
  });
}
