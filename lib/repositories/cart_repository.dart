
import 'index.dart';

class CartRepository {
  List<Dishes> _dishes = [];

  List<Dishes> get dishes => _dishes;

  void addDish(Dishes dish) {
    _dishes.add(dish);
  }

  void removeDish(Dishes dish) {
    _dishes.remove(dish);
  }
}
