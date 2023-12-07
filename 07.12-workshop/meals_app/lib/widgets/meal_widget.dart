import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/views/meal_details_view.dart';

class MealWidget extends StatelessWidget {
  const MealWidget({super.key, required this.meal});
  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => MealDetailsView(meal: meal)));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(meal.name),
        ),
      ),
    );
  }
}
