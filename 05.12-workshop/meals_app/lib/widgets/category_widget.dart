import 'package:flutter/material.dart';
import 'package:meals_app/models/category_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {super.key, required this.category, required this.onCategoryClicked});
  final CategoryModel category;
  final void Function() onCategoryClicked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: category.color,
      onTap: () => onCategoryClicked,
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(category.name),
      ),
    );
  }
}
