import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/views/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/data/dummy_data.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

// If you had multiple animation controllers, you would rather extend with TickerProviderStateMixin
class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this, // this - being the entire class
      duration: const Duration(milliseconds: 300),
      lowerBound: 0, // You always animate between two values, that's why we need the lowerBound and upperBound properties
      upperBound: 1, // Note, these values are actually the defaults, and could've been ignored.
    );

    _animationController.forward(); // Runs/starts the animation
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  // In case you forget ; the context isn't inherently available on this widget since it (was) stateless. Therefore, we need to pass in the context
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    ); // Can also be written as Navigator.of(context).push(route)
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView( // This gridview is being outsourced to the builder further below
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
              onSelectCategory: () => _selectCategory(context, cat),
            ),
        ],
      ),
      builder: (context, child) => SlideTransition(position: Tween(
        begin: const Offset(0, .3),
        end: const Offset(0, 0)).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutCirc)),
        child: child),
      
    );
  }
}
