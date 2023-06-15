part of 'category_bloc.dart';

abstract class CategoryEvent {}

class LoadCategoryEvent extends CategoryEvent {}

class SortDishesEvent extends CategoryEvent {
  final String tag;
  SortDishesEvent({
    required this.tag,
  });
}
