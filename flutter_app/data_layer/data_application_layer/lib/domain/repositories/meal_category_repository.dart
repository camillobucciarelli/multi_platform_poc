import 'package:fpdart/fpdart.dart';

import '../../data/entities/meal_category_entity.dart';
import '../models/model_mapper.dart';

abstract class MealCategoryRepository {
  Either<Exception, M> getMealCategory<M>(ModelMapper<MealCategoryEntity, M> mapper);
}
