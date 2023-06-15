
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/index.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(
    this.cartRepository,
  ) : super(CartInitial()) {
    on<AddCartEvent>(_addDishes);
    on<RemovedCartEvent>(_removeDishes);
  }

  final CartRepository cartRepository;

  _addDishes(
    AddCartEvent event,
    emit,
  ) async {
    cartRepository.addDish(event.dish);
    List<Dishes> t = cartRepository.dishes;
    emit(CartAddState(cartDishes: t));
  }

  _removeDishes(
    RemovedCartEvent event,
    emit,
  ) async {
    cartRepository.removeDish(event.dish);
    List<Dishes> t = cartRepository.dishes;
    emit(CartAddState(cartDishes: t));
  }
}
