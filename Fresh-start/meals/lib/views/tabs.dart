import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/views/categories.dart';
import 'package:meals/views/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _showInfoMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        ),
      );
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting){
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfoMessage('${meal.title} was removed from your favorites');
      });
      
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage('${meal.title} was added to your favorites');
      });
      
    }
  }


  void _selectPage(index){
    setState(() {
      _selectedPageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(mainParentToggleMeal: _toggleMealFavoriteStatus,);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1){
      activePage = MealsScreen(meals: _favoriteMeals, onToggleFavoriteParent: _toggleMealFavoriteStatus,);
      activePageTitle = 'Your favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {_selectPage(index);},
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        ]),
    );
  }
}