import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adjust your meal preferences:',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            const SizedBox(height: 20),
            // Gluten-free Switch
            _buildSwitchTile(
              context,
              'Gluten-free',
              'Only include gluten-free meals.',
              Filter.glutenFree,
              activeFilters[Filter.glutenFree]!,
              ref,
            ),
            const SizedBox(height: 15),
            // Lactose-free Switch
            _buildSwitchTile(
              context,
              'Lactose-free',
              'Only include lactose-free meals.',
              Filter.lactoseFree,
              activeFilters[Filter.lactoseFree]!,
              ref,
            ),
            const SizedBox(height: 15),
            // Vegetarian Switch
            _buildSwitchTile(
              context,
              'Vegetarian',
              'Only include vegetarian meals.',
              Filter.vegetarian,
              activeFilters[Filter.vegetarian]!,
              ref,
            ),
            const SizedBox(height: 15),
            // Vegan Switch
            _buildSwitchTile(
              context,
              'Vegan',
              'Only include vegan meals.',
              Filter.vegan,
              activeFilters[Filter.vegan]!,
              ref,
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create the SwitchListTile widgets for filters
  SwitchListTile _buildSwitchTile(
    BuildContext context,
    String title,
    String subtitle,
    Filter filter,
    bool currentValue,
    WidgetRef ref,
  ) {
    return SwitchListTile(
      value: currentValue,
      onChanged: (isChecked) {
        ref.read(filtersProvider.notifier).setFilter(filter, isChecked);
      },
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 20, right: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      tileColor: Theme.of(context).colorScheme.surfaceContainerHighest,
    );
  }
}
