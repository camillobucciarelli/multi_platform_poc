import '../entities/meal_categories_response_entity.dart';

abstract class MealDataSource {
  Future<MealCategoriesResponseEntity> getCategories();
}
