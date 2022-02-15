part of 'meal_categories_cubit.dart';

@immutable
abstract class MealCategoriesState {
  const MealCategoriesState();
}

class MealCategoriesLoading extends MealCategoriesState {
  const MealCategoriesLoading();
}

class MealCategoriesError extends MealCategoriesState {
  final String error;

  const MealCategoriesError(this.error);
}

class MealCategoriesSuccess extends MealCategoriesState {
  final List<MealCategoryModel> models;

  const MealCategoriesSuccess(this.models);
}
