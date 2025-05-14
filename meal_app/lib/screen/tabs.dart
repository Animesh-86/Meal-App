import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal_app/screen/categories.dart';
import 'package:meal_app/screen/filters.dart';
import 'package:meal_app/screen/meals.dart';
import 'package:meal_app/widgets/main_dawer.dart';
import 'package:meal_app/provider/favorites_provider.dart';
import 'package:meal_app/provider/filters_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  // To select the page and dynamically change the body of the screen
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  // Method to handle screen navigation from the drawer
  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider); // Meals updated dynamically

    // Map for managing page selection and titles
    final pages = [
      {
        'page': CategoriesScreen(availableMeals: availableMeals),
        'title': 'Categories',
      },
      {
        'page': MealsScreen(meals: ref.watch(favoriteMealsProvider)),
        'title': 'Your Favorites',
      },
    ];

    // Set active page and title based on the selected index
    final activePage = pages[_selectedPageIndex]['page'];
    final activePageTitle = pages[_selectedPageIndex]['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle as String? ?? 'Meal App'),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
