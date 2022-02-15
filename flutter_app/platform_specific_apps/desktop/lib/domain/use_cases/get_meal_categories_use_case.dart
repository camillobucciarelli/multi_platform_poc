import 'package:data_application_layer/domain/repositories/meal_category_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:platform_app/domain/models/meal_category_model.dart';

@lazySingleton
class GetMealCategoriesUseCase {
  final MealCategoryRepository _repository;

  GetMealCategoriesUseCase(this._repository);

  Future<Either<Exception, List<MealCategoryModel>>> call() {
    return _repository.getMealCategories(MealCategoryModel.fromEntity);
  }
}
