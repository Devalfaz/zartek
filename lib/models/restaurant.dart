import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant.g.dart';

@JsonSerializable(explicitToJson: true)
class Restaurant extends Equatable {
  const Restaurant({
    required this.restaurantId,
    required this.restaurantName,
    required this.restaurantImage,
    required this.tableId,
    required this.tableName,
    required this.branchName,
    required this.nextUrl,
    required this.tableMenuList,
  });
  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  @override
  List<Object?> get props => [
        restaurantId,
        restaurantName,
        restaurantImage,
        tableId,
        tableName,
        branchName,
        nextUrl,
        tableMenuList,
      ];
  @JsonKey(name: 'restaurant_id')
  final String restaurantId;

  @JsonKey(name: 'restaurant_name')
  final String restaurantName;

  @JsonKey(name: 'restaurant_image')
  final String restaurantImage;

  @JsonKey(name: 'table_id')
  final String tableId;

  @JsonKey(name: 'table_name')
  final String tableName;

  @JsonKey(name: 'branch_name')
  final String branchName;

  @JsonKey(name: 'nexturl')
  final String nextUrl;

  @JsonKey(name: 'table_menu_list')
  final List<MenuCategory> tableMenuList;

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);

  static List<Restaurant> listFromJson(List<dynamic> list) {
    final rows = list
        .map((i) => Restaurant.fromJson(i as Map<String, dynamic>))
        .toList();
    return rows;
  }
}

@JsonSerializable(explicitToJson: true)
class MenuCategory extends Equatable {
  const MenuCategory({
    required this.menuCategory,
    required this.menuCategoryId,
    required this.menuCategoryImage,
    required this.nextUrl,
    required this.categoryDishes,
  });
  factory MenuCategory.fromJson(Map<String, dynamic> json) =>
      _$MenuCategoryFromJson(json);

  @override
  List<Object?> get props => [
        menuCategory,
        menuCategoryId,
        menuCategoryImage,
        nextUrl,
        categoryDishes,
      ];
  @JsonKey(name: 'menu_category')
  final String menuCategory;

  @JsonKey(name: 'menu_category_id')
  final String menuCategoryId;

  @JsonKey(name: 'menu_category_image')
  final String menuCategoryImage;

  @JsonKey(name: 'nexturl')
  final String nextUrl;

  @JsonKey(name: 'category_dishes')
  final List<Dish> categoryDishes;

  Map<String, dynamic> toJson() => _$MenuCategoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Dish extends Equatable {
  const Dish({
    required this.dishId,
    required this.dishName,
    required this.dishPrice,
    required this.dishImage,
    required this.dishCurrency,
    required this.dishCalories,
    required this.dishDescription,
    required this.dishAvailability,
    required this.dishType,
    required this.nextUrl,
    required this.addonCategories,
  });

  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);
  @JsonKey(name: 'dish_id')
  final String dishId;

  @JsonKey(name: 'dish_name')
  final String dishName;

  @JsonKey(name: 'dish_price')
  final double dishPrice;

  @JsonKey(name: 'dish_image')
  final String dishImage;

  @JsonKey(name: 'dish_currency')
  final String dishCurrency;

  @JsonKey(name: 'dish_calories')
  final double dishCalories;

  @JsonKey(name: 'dish_description')
  final String dishDescription;

  @JsonKey(name: 'dish_Availability')
  final bool dishAvailability;

  @JsonKey(name: 'dish_Type')
  final int dishType;

  @JsonKey(name: 'nexturl')
  final String nextUrl;

  @JsonKey(name: 'addonCat')
  final List<AddonCategory> addonCategories;

  Map<String, dynamic> toJson() => _$DishToJson(this);

  @override
  List<Object?> get props => [
        dishId,
        dishName,
        dishPrice,
        dishImage,
        dishCurrency,
        dishCalories,
        dishDescription,
        dishAvailability,
        dishType,
        nextUrl,
        addonCategories,
      ];
}

@JsonSerializable(explicitToJson: true)
class AddonCategory extends Equatable {
  const AddonCategory({
    required this.addonCategory,
    required this.addonCategoryId,
    required this.addonSelection,
    required this.nextUrl,
    required this.addons,
  });
  factory AddonCategory.fromJson(Map<String, dynamic> json) =>
      _$AddonCategoryFromJson(json);

  @override
  List<Object?> get props => [
        addonCategory,
        addonCategoryId,
        addonSelection,
        nextUrl,
        addons,
      ];
  @JsonKey(name: 'addon_category')
  final String addonCategory;

  @JsonKey(name: 'addon_category_id')
  final String addonCategoryId;

  @JsonKey(name: 'addon_selection')
  final int addonSelection;

  @JsonKey(name: 'nexturl')
  final String nextUrl;

  final List<Addon> addons;

  Map<String, dynamic> toJson() => _$AddonCategoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Addon extends Equatable {
  const Addon({
    required this.dishId,
    required this.dishName,
    required this.dishPrice,
    required this.dishImage,
    required this.dishCurrency,
    required this.dishCalories,
    required this.dishDescription,
    required this.dishAvailability,
    required this.dishType,
  });
  factory Addon.fromJson(Map<String, dynamic> json) => _$AddonFromJson(json);

  @override
  List<Object?> get props => [
        dishId,
        dishName,
        dishPrice,
        dishImage,
        dishCurrency,
        dishCalories,
        dishDescription,
        dishAvailability,
        dishType,
      ];
  @JsonKey(name: 'dish_id')
  final String dishId;

  @JsonKey(name: 'dish_name')
  final String dishName;

  @JsonKey(name: 'dish_price')
  final double dishPrice;

  @JsonKey(name: 'dish_image')
  final String dishImage;

  @JsonKey(name: 'dish_currency')
  final String dishCurrency;

  @JsonKey(name: 'dish_calories')
  final double dishCalories;

  @JsonKey(name: 'dish_description')
  final String dishDescription;

  @JsonKey(name: 'dish_Availability')
  final bool dishAvailability;

  @JsonKey(name: 'dish_Type')
  final int dishType;

  Map<String, dynamic> toJson() => _$AddonToJson(this);
}
