import 'package:data_application_layer/data/entities/meal_category_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal_categories_response_entity.g.dart';

@JsonSerializable(checked: true, createToJson: false)
class MealCategoriesResponseEntity {
  final List<MealCategoryEntity> categories;

  MealCategoriesResponseEntity(this.categories);

  factory MealCategoriesResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$MealCategoriesResponseEntityFromJson(json);
}
