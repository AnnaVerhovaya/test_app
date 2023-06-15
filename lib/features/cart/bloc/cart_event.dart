part of 'cart_bloc.dart';

abstract class CartEvent {}

class AddCartEvent extends CartEvent {
  final Dishes dish;
  AddCartEvent({
    required this.dish,
  });
}

class RemovedCartEvent extends CartEvent {
  final Dishes dish;
  RemovedCartEvent({
    required this.dish,
  });
}
