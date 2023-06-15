import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../global_widgets/index.dart';
import '../../repositories/index.dart';
import 'index.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartBloc = CartBloc(CartRepository());
  Dishes? dish;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final _dish = ModalRoute.of(context)?.settings.arguments as Dishes?;
    if (_dish != null && _dish != dish) {
      dish = _dish;
      cartBloc.add(AddCartEvent(dish: dish!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: BlocBuilder<CartBloc, CartState>(
        bloc: cartBloc,
        builder: (context, state) {
          if (state is CartInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartAddState) {
            final _dish = state.cartDishes;
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: _dish.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Row(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                      width: 62,
                                      height: 62,
                                      child: Image.network(
                                          _dish[index].image_url)),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        _dish[index].name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${_dish[index].price} Р',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(width: 8),
                                          Text('${_dish[index].weight} г'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      cartBloc
                                          .add(RemovedCartEvent(dish: dish!));
                                    },
                                    icon: const Icon(Icons.remove),
                                  ),
                                  const Text(
                                    '1',
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      cartBloc.add(AddCartEvent(dish: dish!));
                                    },
                                    icon: const Icon(Icons.add),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue[800]),
                        ),
                        child: Text('Оплатить ${state.cartDishes.first.price}'),),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}
