// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/data_sources/local/meal_local_data_source.dart' as _i6;
import '../data/data_sources/meal_data_source.dart' as _i4;
import '../data/data_sources/remote/meal_remote_data_source.dart' as _i5;
import '../data/data_sources/remote/weather_remote_data_source.dart' as _i8;
import '../data/data_sources/weather_data_source.dart' as _i7;
import '../data/repositories/meal_repository_impl.dart' as _i12;
import '../data/repositories/weather_repository_impl.dart' as _i10;
import '../domain/repositories/meal_category_repository.dart' as _i11;
import '../domain/repositories/weather_repository.dart' as _i9;
import 'dependency_injection.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $loadDataApplicationLayerInjectorModule(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i4.MealDataSource>(
      () => _i5.MealRemoteDataSource(get<_i3.Dio>()),
      instanceName: 'remote');
  gh.lazySingleton<_i4.MealDataSource>(() => _i6.MealLocalDataSource(),
      instanceName: 'local');
  gh.lazySingleton<_i7.WeatherDataSource>(() => _i8.WeatherRemoteDataSource());
  gh.lazySingleton<_i9.WeatherRepository>(
      () => _i10.WeatherRepositoryImpl(get<_i7.WeatherDataSource>()));
  gh.lazySingleton<_i11.MealCategoryRepository>(() => _i12.MealRepositoryImpl(
      get<_i4.MealDataSource>(instanceName: 'remote'),
      get<_i4.MealDataSource>(instanceName: 'local')));
  return get;
}

class _$RegisterModule extends _i13.RegisterModule {}
