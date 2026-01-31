import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/views/categories.dart';
import 'package:meals/views/filters.dart';
import 'package:meals/views/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/filters_provider.dart';

const Map<Filter, bool> kInitialFilters = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  // final List<Meal> _favoriteMeals = [];
  // Map<Filter, bool> _selectedFilters = {
  //   Filter.glutenFree: false,
  //   Filter.lactoseFree: false,
  //   Filter.vegetarian: false,
  //   Filter.vegan: false,
  // };

  // void _showInfoMessage(String message) {
    
  // }

  // void _toggleMealFavoriteStatus(Meal meal) {
  //   final isExisting = _favoriteMeals.contains(meal);

  //   if (isExisting) {
  //     setState(() {
  //       _favoriteMeals.remove(meal);
  //       _showInfoMessage('${meal.title} was removed from your favorites');
  //     });
  //   } else {
  //     setState(() {
  //       _favoriteMeals.add(meal);
  //       _showInfoMessage('${meal.title} was added to your favorites');
  //     });
  //   }
  // }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setDrawerScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      // Square brackets after the push method contain generics.
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (context) => const FiltersScreen()),
      );

    
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Your favorites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      endDrawer: MainDrawer(onSelectScreen: _setDrawerScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectPage(index);
        },
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
