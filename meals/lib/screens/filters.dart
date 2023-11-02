import 'package:flutter/material.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          Column(
            children: activeFilters
                .map(
                  (model, value) {
                    return MapEntry(
                      key,
                      SwitchListTile(
                        value: value,
                        onChanged: (isChecked) {
                          ref
                              .read(filtersProvider.notifier)
                              .setFilter(model, isChecked);
                        },
                        title: Text(
                          model.name!,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                        ),
                        subtitle: Text(
                          model.description!,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                        ),
                        activeColor: Theme.of(context).colorScheme.tertiary,
                        contentPadding:
                            const EdgeInsets.only(left: 34, right: 22),
                      ),
                    );
                  },
                )
                .values
                .toList(),
          ),
        ],
      ),
    );
  }
}
