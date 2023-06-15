import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/cart/index.dart';
import '../repositories/index.dart';


class DishDetails {
  void showDishDetails(BuildContext context, Dishes dish) {
    final cartBloc = CartBloc(CartRepository());
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext cxt) {
        return BlocProvider(
          create: (BuildContext context) => cartBloc,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 160, bottom: 160, left: 16, right: 16),
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    height: 800,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            Container(
                              color: Colors.grey[200],
                              width: 370,
                              height: 232,
                              child: Center(
                                child: SizedBox(
                                  width: 194,
                                  height: 204,
                                  child: Image.network(
                                    dish.image_url,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0.0,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Row(
                                  children: [
                                    const Icon(Icons.favorite_border_outlined,
                                        color: Colors.black),
                                    const SizedBox(width: 8),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Icon(Icons.close,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 8),
                        Text(
                          dish.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          children: [
                            Text(
                              '${dish.price} Р',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 8),
                            Text('${dish.weight} г'),
                          ],
                        ),
                        Expanded(
                          child: Text(
                            dish.description,
                            maxLines: 4,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          height: 48,
                          width: double.infinity,
                          child: TextButton(
                              onPressed: () async {
                                Navigator.of(context).pushNamed(
                                  'cart',
                                  arguments: dish,
                                );
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                foregroundColor: const MaterialStatePropertyAll(
                                    Colors.white),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.blue[800]),
                              ),
                              child: const Text('Добавить в корзину')),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
