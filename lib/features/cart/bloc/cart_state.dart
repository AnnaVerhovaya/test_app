part of 'cart_bloc.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartAddState extends CartState {
  final List<Dishes> cartDishes;
  CartAddState({
    required this.cartDishes,
  });
}
