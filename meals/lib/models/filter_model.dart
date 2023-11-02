enum Filter { glutenFree, lactosefree, vegetarian, vegan }

class FilterModel {
  Filter? filterType;
  String? name;
  String? description;
  FilterModel({
    this.filterType,
    this.name,
    this.description,
  });

  FilterModel copyWith({
    Filter? filterType,
    String? name,
    String? description,
  }) {
    return FilterModel(
      filterType: filterType ?? this.filterType,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  String toString() =>
      'FilterModel(filterType: $filterType, name: $name, description: $description)';

  @override
  bool operator ==(covariant FilterModel other) {
    if (identical(this, other)) return true;

    return other.filterType == filterType &&
        other.name == name &&
        other.description == description;
  }

  @override
  int get hashCode =>
      filterType.hashCode ^ name.hashCode ^ description.hashCode;
}
