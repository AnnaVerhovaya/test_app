
import 'package:dio/dio.dart';
import '../services/index.dart';
import 'index.dart';

class DishesRepository {
  final ApiService apiService;
  List<Dishes> _dishes = [];
  List<Dishes> _d = [];
  List<Categories> _categories = [];

  DishesRepository({required this.apiService});
  List<Dishes> get d => _d;
  List<Dishes> get dishes => _dishes;
  List<Categories> get categories => _categories;

  Future<void> getDishes() async {
    final response = await apiService.getDishes();
    final result = response["dishes"];
    _dishes = result!;
  }

  Future<void> getCategories() async {
    final response = await apiService.getCategories();
    final result = response["сategories"];
    _categories = result!;
  }

  Future<void> addDish(Dishes d) async {
    _dishes.add(d);
  }

  Future<void> getApiDishes() async {
    ApiService(Dio(BaseOptions(contentType: "application/json")),
        baseUrl: 'https://run.mocky.io/v3/');
  }
}
