
import 'package:data_application_layer/data/entities/meal_category_entity.dart';
import 'package:data_application_layer/domain/models/model_mapper.dart';
import 'package:data_application_layer/domain/repositories/meal_category_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MealCategoryRepository)
class MealRepositoryImpl implements MealCategoryRepository {
  @override
  Either<Exception, M> getMealCategory<M>(ModelMapper<MealCategoryEntity, M> mapper) {
    final entity = MealCategoryEntity.fromJson({
      "idCategory": "1",
      "strCategory": "Beef",
      "strCategoryThumb": "https://www.themealdb.com/images/category/beef.png",
      "strCategoryDescription": "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]"
    });
    return Right(mapper(entity));
  }

}