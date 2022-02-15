// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_categories_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealCategoriesResponseEntity _$MealCategoriesResponseEntityFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'MealCategoriesResponseEntity',
      json,
      ($checkedConvert) {
        final val = MealCategoriesResponseEntity(
          $checkedConvert(
              'categories',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      MealCategoryEntity.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );
