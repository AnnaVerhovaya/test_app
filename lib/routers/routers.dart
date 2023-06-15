import 'package:flutter_application_test_my_app/features/cart/cart_screen.dart';
import 'package:flutter_application_test_my_app/features/dishes/category_screen.dart';
import 'package:flutter_application_test_my_app/features/dishes/dishes_screen.dart';

final routes = {
  '/': (context) => const CategoryScreen(),
  'dishes': (context) => const DishesScreen(),
  'cart': (context) => const CartScreen(),
};
