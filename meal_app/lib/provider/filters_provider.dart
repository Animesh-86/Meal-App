import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/meals_provider.dart';
import 'package:meal_app/models/meal.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

final filteredMealsProvider = Provider<List<Meal>>((ref) {
  final meals = ref.watch(mealsProvider); // Ensuring mealsProvider always returns a list
  final activeFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree] == true && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree] == true && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian] == true && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan] == true && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
