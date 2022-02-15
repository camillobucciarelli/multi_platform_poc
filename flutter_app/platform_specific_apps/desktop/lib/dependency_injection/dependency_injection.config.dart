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
import '../domain/use_cases/get_weather_use_case.dart' as _i7;
import '../domain/use_cases/send_weather_stream_use_case.dart' as _i9;
import '../domain/use_cases/send_weather_use_case.dart' as _i10;
import '../presentation/bloc/meal_categories_cubit.dart' as _i8;
import '../presentation/bloc/weather_cubit.dart' as _i11;
import '../presentation/bloc/weather_stream_cubit.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

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
    gh.lazySingleton<_i7.GetWeatherUseCase>(
        () => _i7.GetWeatherUseCase(get<_i6.WeatherRepository>()));
    gh.factory<_i8.MealCategoriesCubit>(
        () => _i8.MealCategoriesCubit(get<_i3.GetMealCategoriesUseCase>()));
    gh.lazySingleton<_i9.SendWeatherStreamUseCase>(
        () => _i9.SendWeatherStreamUseCase(get<_i6.WeatherRepository>()));
    gh.lazySingleton<_i10.SendWeatherUseCase>(
        () => _i10.SendWeatherUseCase(get<_i6.WeatherRepository>()));
    gh.factory<_i11.WeatherCubit>(() => _i11.WeatherCubit(
        get<_i7.GetWeatherUseCase>(), get<_i10.SendWeatherUseCase>()));
    gh.factory<_i12.WeatherStreamCubit>(() => _i12.WeatherStreamCubit(
        get<_i5.GetWeatherStreamUseCase>(),
        get<_i9.SendWeatherStreamUseCase>()));
    return this;
  }
}
