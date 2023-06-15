import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_my_app/routers/routers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/cart/index.dart';
import 'features/dishes/index.dart';
import 'repositories/index.dart';
import 'services/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(
            CartRepository(),
          ),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc((DishesRepository(
              apiService: ApiService(
                  Dio(BaseOptions(contentType: "application/json")),
                  baseUrl: 'https://run.mocky.io/v3/')))),
        ),
      ],
      child: MaterialApp(
        routes: routes,
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
      ),
    );
  }
}
