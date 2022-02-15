import 'package:data_application_layer/data/entities/meal_category_entity.dart';

class MealCategoryModel {
  final String name;
  final String thumbnail;
  final String description;

  MealCategoryModel({
    required this.name,
    required this.thumbnail,
    required this.description,
  });

  factory MealCategoryModel.fromEntity(MealCategoryEntity entity) {
    return MealCategoryModel(
      name: entity.name,
      thumbnail: entity.thumbnail,
      description: entity.description,
    );
  }
}
