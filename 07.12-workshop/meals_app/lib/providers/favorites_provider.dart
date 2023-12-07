import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal_model.dart';

//Notifier
class FavoriteMealsNotifier extends StateNotifier<List<MealModel>> {
  FavoriteMealsNotifier() : super([]);
  void toggleMealFavorite(MealModel meal) {
    if (state.contains(meal)) {
      state = state.where((element) => element.id != meal.id).toList();
    } else {
      // ... => spread operator
      state = [...state, meal];
    }
  }
}

//Provider
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<MealModel>>((ref) {
  return FavoriteMealsNotifier();
});
