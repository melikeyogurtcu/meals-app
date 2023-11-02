import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/filter_model.dart';
import 'package:meals/providers/meals_provider.dart';

class FiltersNotifiers extends StateNotifier<Map<FilterModel, bool>> {
  FiltersNotifiers()
      : super({
          FilterModel(
            filterType: Filter.glutenFree,
            name: 'Gluten-free',
            description: 'Only include gluten-free meals.',
          ): false,
          FilterModel(
            filterType: Filter.lactosefree,
            name: 'Lactose-free',
            description: 'Only include lactose-free meals.',
          ): false,
          FilterModel(
            filterType: Filter.vegetarian,
            name: 'Vegetarian',
            description: 'Only include vegetarian meals.',
          ): false,
          FilterModel(
            filterType: Filter.vegan,
            name: 'Vegan',
            description: 'Only include vegan meals.',
          ): false,
        });

  void setFilters(Map<FilterModel, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(FilterModel filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifiers, Map<FilterModel, bool>>(
        (ref) => FiltersNotifiers());

final filterMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (activeFilters.keys
            .any((element) => element.filterType == Filter.glutenFree) &&
        !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters.keys
            .any((element) => element.filterType == Filter.lactosefree) &&
        !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters.keys
            .any((element) => element.filterType == Filter.vegan) &&
        !meal.isVegan) {
      return false;
    }
    if (activeFilters.keys
            .any((element) => element.filterType == Filter.vegetarian) &&
        !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
