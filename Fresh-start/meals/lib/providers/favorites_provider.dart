import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:meals/models/meal.dart';



final favoriteMealsProvider =
    NotifierProvider<FavoriteMealsNotifier, List<Meal>>(
      FavoriteMealsNotifier.new,
    );

class FavoriteMealsNotifier extends Notifier<List<Meal>> {
  

  @override
  List<Meal> build() {
    return [];
    
  }
  bool toggleMealFavoriteStatus(Meal meal) {
      final mealIsFavorite = state.contains(meal);

      if (mealIsFavorite) {
        state = state.where((m) => m.id != meal.id).toList();
        return false;
      } else {
        state = [...state, meal];
        return true;
      }
    }
  
}
