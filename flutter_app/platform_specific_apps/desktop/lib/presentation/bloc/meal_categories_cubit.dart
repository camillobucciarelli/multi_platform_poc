import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:platform_app/domain/use_cases/get_meal_categories_use_case.dart';

import '../../domain/models/meal_category_model.dart';

part 'meal_categories_state.dart';

@injectable
class MealCategoriesCubit extends Cubit<MealCategoriesState> {
  final GetMealCategoriesUseCase _useCase;

  MealCategoriesCubit(
    this._useCase,
  ) : super(const MealCategoriesLoading()) {
    _init();
  }

  Future<void> _init() async {
    final response = await _useCase();
    response.match(
      (l) => emit(MealCategoriesError(l.toString())),
      (r) => emit(MealCategoriesSuccess(r)),
    );
  }
}
