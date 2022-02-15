import 'package:data_application_layer/data/data_sources/meal_data_source.dart';
import 'package:data_application_layer/data/entities/meal_categories_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../entities/meal_category_entity.dart';

@Named('local')
@LazySingleton(as: MealDataSource)
class MealLocalDataSource implements MealDataSource {
  @override
  Future<MealCategoriesResponseEntity> getCategories() {
    return Future.value(MealCategoriesResponseEntity([
      MealCategoryEntity('0', 'Name 0', 'thumb0', 'Description of element 0'),
      MealCategoryEntity('1', 'Name 1', 'thumb1', 'Description of element 1'),
      MealCategoryEntity('2', 'Name 2', 'thumb2', 'Description of element 2'),
    ]));
  }
}
