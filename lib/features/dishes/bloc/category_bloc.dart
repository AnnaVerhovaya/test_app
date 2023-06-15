import 'package:bloc/bloc.dart';
import '../../../repositories/index.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(this.repository) : super(CategoryInitial()) {
    _init();
    on<SortDishesEvent>(_sortDishes);
  }
  final DishesRepository repository;

  _sortDishes(SortDishesEvent event, emit) async {
    try {
      await repository.getDishes();
      final allDishes = repository.dishes;
      final viewDishes =
          allDishes.where((dish) => dish.tegs.contains(event.tag)).toList();
      emit(DishesSortState(sortDishes: viewDishes));
    } catch (error) {
      emit(CategoryErrorState(error: error.toString()));
    }
  }

  _init() async {
    try {
      await repository.getCategories();
      await repository.getDishes();
      final categories = repository.categories;
      final dishes = repository.dishes;
      emit(CategoriesLoadedState(allCategories: categories));
      emit(DishesLoadedState(alldishes: dishes));
    } catch (error) {
      emit(CategoryErrorState(error: error.toString()));
    }
  }
}
