import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/models/meal_model.dart';

class MealView extends StatelessWidget {
  const MealView({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    List<MealModel> meals =
        mealList.where((element) => element.categoryId == category.id).toList();

    Widget widget = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => Text(meals[index].name));

    if (meals.isEmpty) {
      widget = const Center(
        child: Text("Bu kategoride hiç tarif bulunamadı.."),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: widget,
    );
  }
}
