// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => Restaurant(
      restaurantId: json['restaurant_id'] as String,
      restaurantName: json['restaurant_name'] as String,
      restaurantImage: json['restaurant_image'] as String,
      tableId: json['table_id'] as String,
      tableName: json['table_name'] as String,
      branchName: json['branch_name'] as String,
      nextUrl: json['nexturl'] as String,
      tableMenuList: (json['table_menu_list'] as List<dynamic>)
          .map((e) => MenuCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'restaurant_id': instance.restaurantId,
      'restaurant_name': instance.restaurantName,
      'restaurant_image': instance.restaurantImage,
      'table_id': instance.tableId,
      'table_name': instance.tableName,
      'branch_name': instance.branchName,
      'nexturl': instance.nextUrl,
      'table_menu_list': instance.tableMenuList.map((e) => e.toJson()).toList(),
    };

MenuCategory _$MenuCategoryFromJson(Map<String, dynamic> json) => MenuCategory(
      menuCategory: json['menu_category'] as String,
      menuCategoryId: json['menu_category_id'] as String,
      menuCategoryImage: json['menu_category_image'] as String,
      nextUrl: json['nexturl'] as String,
      categoryDishes: (json['category_dishes'] as List<dynamic>)
          .map((e) => Dish.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuCategoryToJson(MenuCategory instance) =>
    <String, dynamic>{
      'menu_category': instance.menuCategory,
      'menu_category_id': instance.menuCategoryId,
      'menu_category_image': instance.menuCategoryImage,
      'nexturl': instance.nextUrl,
      'category_dishes':
          instance.categoryDishes.map((e) => e.toJson()).toList(),
    };

Dish _$DishFromJson(Map<String, dynamic> json) => Dish(
      dishId: json['dish_id'] as String,
      dishName: json['dish_name'] as String,
      dishPrice: (json['dish_price'] as num).toDouble(),
      dishImage: json['dish_image'] as String,
      dishCurrency: json['dish_currency'] as String,
      dishCalories: (json['dish_calories'] as num).toDouble(),
      dishDescription: json['dish_description'] as String,
      dishAvailability: json['dish_Availability'] as bool,
      dishType: json['dish_Type'] as int,
      nextUrl: json['nexturl'] as String,
      addonCategories: (json['addonCat'] as List<dynamic>)
          .map((e) => AddonCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DishToJson(Dish instance) => <String, dynamic>{
      'dish_id': instance.dishId,
      'dish_name': instance.dishName,
      'dish_price': instance.dishPrice,
      'dish_image': instance.dishImage,
      'dish_currency': instance.dishCurrency,
      'dish_calories': instance.dishCalories,
      'dish_description': instance.dishDescription,
      'dish_Availability': instance.dishAvailability,
      'dish_Type': instance.dishType,
      'nexturl': instance.nextUrl,
      'addonCat': instance.addonCategories.map((e) => e.toJson()).toList(),
    };

AddonCategory _$AddonCategoryFromJson(Map<String, dynamic> json) =>
    AddonCategory(
      addonCategory: json['addon_category'] as String,
      addonCategoryId: json['addon_category_id'] as String,
      addonSelection: json['addon_selection'] as int,
      nextUrl: json['nexturl'] as String,
      addons: (json['addons'] as List<dynamic>)
          .map((e) => Addon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddonCategoryToJson(AddonCategory instance) =>
    <String, dynamic>{
      'addon_category': instance.addonCategory,
      'addon_category_id': instance.addonCategoryId,
      'addon_selection': instance.addonSelection,
      'nexturl': instance.nextUrl,
      'addons': instance.addons.map((e) => e.toJson()).toList(),
    };

Addon _$AddonFromJson(Map<String, dynamic> json) => Addon(
      dishId: json['dish_id'] as String,
      dishName: json['dish_name'] as String,
      dishPrice: (json['dish_price'] as num).toDouble(),
      dishImage: json['dish_image'] as String,
      dishCurrency: json['dish_currency'] as String,
      dishCalories: (json['dish_calories'] as num).toDouble(),
      dishDescription: json['dish_description'] as String,
      dishAvailability: json['dish_Availability'] as bool,
      dishType: json['dish_Type'] as int,
    );

Map<String, dynamic> _$AddonToJson(Addon instance) => <String, dynamic>{
      'dish_id': instance.dishId,
      'dish_name': instance.dishName,
      'dish_price': instance.dishPrice,
      'dish_image': instance.dishImage,
      'dish_currency': instance.dishCurrency,
      'dish_calories': instance.dishCalories,
      'dish_description': instance.dishDescription,
      'dish_Availability': instance.dishAvailability,
      'dish_Type': instance.dishType,
    };
