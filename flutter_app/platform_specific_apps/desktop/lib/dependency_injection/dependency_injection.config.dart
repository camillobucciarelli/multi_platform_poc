// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:data_application_layer/domain/repositories/meal_category_repository.dart'
    as _i4;
import 'package:data_application_layer/domain/repositories/weather_repository.dart'
    as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/use_cases/get_meal_categories_use_case.dart' as _i3;
import '../domain/use_cases/get_weather_stream_use_case.dart' as _i5;
import '../presentation/bloc/meal_categories_cubit.dart' as _i7;
import '../presentation/bloc/weather_cubit.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  _i1.GetIt loadInjectionModule(
      {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
    final gh = _i2.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i3.GetMealCategoriesUseCase>(
        () => _i3.GetMealCategoriesUseCase(get<_i4.MealCategoryRepository>()));
    gh.lazySingleton<_i5.GetWeatherStreamUseCase>(
        () => _i5.GetWeatherStreamUseCase(get<_i6.WeatherRepository>()));
    gh.factory<_i7.MealCategoriesCubit>(
        () => _i7.MealCategoriesCubit(get<_i3.GetMealCategoriesUseCase>()));
    gh.factory<_i8.WeatherCubit>(
        () => _i8.WeatherCubit(get<_i5.GetWeatherStreamUseCase>()));
    return this;
  }
}
