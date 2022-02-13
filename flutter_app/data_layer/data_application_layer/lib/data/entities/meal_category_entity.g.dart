// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_category_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealCategoryEntity _$MealCategoryEntityFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MealCategoryEntity',
      json,
      ($checkedConvert) {
        final val = MealCategoryEntity(
          $checkedConvert('idCategory', (v) => v as String),
          $checkedConvert('strCategory', (v) => v as String),
          $checkedConvert('strCategoryThumb', (v) => v as String),
          $checkedConvert('strCategoryDescription', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'idCategory',
        'name': 'strCategory',
        'thumbnail': 'strCategoryThumb',
        'description': 'strCategoryDescription'
      },
    );

Map<String, dynamic> _$MealCategoryEntityToJson(MealCategoryEntity instance) =>
    <String, dynamic>{
      'idCategory': instance.id,
      'strCategory': instance.name,
      'strCategoryThumb': instance.thumbnail,
      'strCategoryDescription': instance.description,
    };
