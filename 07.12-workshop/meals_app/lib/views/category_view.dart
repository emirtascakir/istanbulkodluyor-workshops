import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/views/favorites_view.dart';
import 'package:meals_app/views/meal_view.dart';
import 'package:meals_app/widgets/category_widget.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  void _changeScreen(CategoryModel category, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealView(
              category: category,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bir kategori seçin.."),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => FavoritesView()));
              },
              icon: const Icon(Icons.favorite))
        ],
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
        ),
        children: [
          for (final c in categoryList)
            CategoryWidget(
                category: c, onCategoryClicked: () => _changeScreen(c, context))
        ],
      ),
    );
  }
}
