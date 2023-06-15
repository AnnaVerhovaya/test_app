import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../global_widgets/index.dart';
import '../../repositories/index.dart';
import '../../services/index.dart';
import 'index.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    List<Categories> _categories = [];
    final categoryBloc = CategoryBloc(DishesRepository(
        apiService: ApiService(
            Dio(BaseOptions(contentType: "application/json")),
            baseUrl: 'https://run.mocky.io/v3/')));
    return BlocProvider(
      create: (BuildContext context) => categoryBloc,
      child: Scaffold(
        appBar: MyAppBar(),
        body: SafeArea(
          child: BlocConsumer<CategoryBloc, CategoryState>(
            listener: (context, state) {
              if (state is CategoriesLoadedState) {
                _categories = state.allCategories;
              }
            },
            builder: (context, state) {
              return _buildAllCategoriesList(context, _categories);
            },
          ),
        ),
        bottomNavigationBar: bottomNavigationBar(),
      ),
    );
  }

  Widget _buildAllCategoriesList(
      BuildContext context, List<Categories> categories) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView.builder(
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            final category = categories[index];
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('dishes');
              },
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight * 0.25,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 4, top: 4),
                        child: Image.network(
                          category.image_url,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 32,
                    top: 12,
                    child: Text(
                      category.name,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
