// ignore_for_file: no_leading_underscores_for_local_identifiers

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
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false;


  ///get activeFiltersState
  activeFilters.forEach((key, value) {
    if(key.filterType == Filter.glutenFree) {
      _isGlutenFree = value;
    }
    if(key.filterType == Filter.lactosefree) {
      _isLactoseFree = value;
    }
    if(key.filterType == Filter.vegan) {
      _isVegan = value;
    }
    if(key.filterType == Filter.vegetarian) {
      _isVegetarian = value;
    }
  });

  return meals.where((meal) {
    if (_isGlutenFree && !meal.isGlutenFree) {
      return false;
    } 
    if (_isLactoseFree && !meal.isLactoseFree) {
      return false;
    }
    if (_isVegan && !meal.isVegan) {
      return false;
    }
    if (_isVegetarian && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();

});
