import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/screen/meals.dart';
import 'package:meal_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selecCategory(BuildContext context) {
    // context is not available in stateless so we have to do
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (ctx) => MealsScreen(
              meals: [], // Pass the appropriate list of meals here
              title: 'Category Title', // Replace with the desired title
            ),
      ),
    ); //it will push the screen on the top like on stack
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick your category!')),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 20,
        ),
        children: [
          //availableCategories.map((Category) =>  CategoryGridItem(category: category);
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selecCategory(context);
              },
            ),
        ],
      ),
    );
  }
}
