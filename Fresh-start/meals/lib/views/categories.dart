import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/views/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.mainParentToggleMeal});

  final void Function(Meal meal) mainParentToggleMeal;

// In case you forget ; the context isn't inherently available on this widget since it is stateless. Therefore, we need to pass in the context
// as an argument when the method will be called (as done below).
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.push(
      context, 
      MaterialPageRoute(builder: (ctx) => MealsScreen(
        title: category.title, 
        meals: filteredMeals,
        onToggleFavoriteParent: mainParentToggleMeal,
        ),
        ),
      ); // Can also be written as Navigator.of(context).push(route)
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // Remember that curly braces and return keywords aren't used when we apply conditional formatting on widgets.
          // the map method/function could also be used
          for (final cat in availableCategories) 
            CategoryGridItem(
              category: cat, 
              onSelectCategory: ()=> _selectCategory(context, cat),
              ),
        ],
      );
  }
}
