import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../global_widgets/index.dart';
import '../../repositories/index.dart';
import '../../services/index.dart';
import 'index.dart';

class DishesScreen extends StatefulWidget {
  const DishesScreen({super.key});

  @override
  State<DishesScreen> createState() => _DishesScreenState();
}

class _DishesScreenState extends State<DishesScreen> {
  List<Dishes> _alldishes = [];
  @override
  Widget build(BuildContext context) {
    List<String> yourList = ['Все меню', 'Салаты', 'С рисом', 'С рыбой'];
    final categoryBloc = CategoryBloc(DishesRepository(
        apiService: ApiService(
            Dio(BaseOptions(contentType: "application/json")),
            baseUrl: 'https://run.mocky.io/v3/')));
    return BlocProvider(
      create: (BuildContext context) => categoryBloc,
      child: Scaffold(
        appBar: MyAppBar(),
        body: Column(
          children: [
            SizedBox(
              height: 50.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  final text = yourList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: InkWell(
                      onTap: () => categoryBloc.add(SortDishesEvent(tag: text)),
                      child: Chip(
                        label: Text(text),
                        shape: const StadiumBorder(),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: BlocConsumer<CategoryBloc, CategoryState>(
                listener: (context, state) {
                  if (state is DishesLoadedState) {
                    _alldishes = state.alldishes;
                  }
                },
                bloc: categoryBloc,
                builder: (context, state) {
                  if (state is DishesLoadedState) {
                    return _buildAllDishesList(context, _alldishes);
                  } else if (state is CategoryErrorState) {
                    return Center(
                      child: Text("Error: ${state.error}"),
                    );
                  } else if (state is DishesSortState) {
                    return _buildSortDishesList(context, state.sortDishes);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: bottomNavigationBar(),
      ),
    );
  }

  Widget _buildAllDishesList(BuildContext context, List<Dishes> dishes) {
    return LayoutBuilder(builder: (context, constraints) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
        ),
        itemCount: dishes.length,
        itemBuilder: (context, index) {
          final dish = dishes[index];
          return GestureDetector(
            onTap: () => DishDetails().showDishDetails(context, dish),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 109,
                  width: 109,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[200],
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(dish.image_url),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                Positioned(
                  bottom: 3,
                  child: Text(
                    dish.name,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  Widget _buildSortDishesList(BuildContext context, List<Dishes> dishes) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.8,
      ),
      itemCount: dishes.length,
      itemBuilder: (context, index) {
        final dish = dishes[index];
        return GestureDetector(
          onTap: () => DishDetails().showDishDetails(context, dish),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 109,
                width: 109,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[200],
                ),
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(dish.image_url),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Positioned(
                bottom: 3,
                child: Text(
                  dish.name,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
