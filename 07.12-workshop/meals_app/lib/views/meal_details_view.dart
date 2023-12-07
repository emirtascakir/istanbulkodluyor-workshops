import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/providers/favorites_provider.dart';

class MealDetailsView extends ConsumerStatefulWidget {
  const MealDetailsView({super.key, required this.meal});
  final MealModel meal;

  @override
  ConsumerState<MealDetailsView> createState() => _MealDetailsViewState();
}

class _MealDetailsViewState extends ConsumerState<MealDetailsView> {
  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoriteMealsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.name),
        actions: [
          IconButton(
              onPressed: () {
                ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavorite(widget.meal);
              },
              icon: Icon(favorites.contains(widget.meal)
                  ? Icons.favorite
                  : Icons.favorite_border))
        ],
      ),
    );
  }
}
