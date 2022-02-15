// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../client/api_client.dart' as _i5;
import '../data/data_sources/local/meal_local_data_source.dart' as _i4;
import '../data/data_sources/meal_data_source.dart' as _i3;
import '../data/data_sources/remote/weather_remote_data_source.dart' as _i9;
import '../data/data_sources/weather_data_source.dart' as _i8;
import '../data/repositories/meal_repository_impl.dart' as _i7;
import '../data/repositories/weather_repository_impl.dart' as _i11;
import '../domain/repositories/meal_category_repository.dart' as _i6;
import '../domain/repositories/weather_repository.dart' as _i10;
import 'dependency_injection.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $loadDataApplicationLayerInjectorModule(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.MealDataSource>(() => _i4.MealLocalDataSource(),
      instanceName: 'local');
  gh.lazySingleton<String>(() => registerModule.baseUrl);
  gh.lazySingleton<_i5.ApiClient>(() => _i5.ApiClient(get<String>()));
  gh.lazySingleton<_i6.MealCategoryRepository>(() =>
      _i7.MealRepositoryImpl(get<_i3.MealDataSource>(instanceName: 'local')));
  gh.lazySingleton<_i8.WeatherDataSource>(
      () => _i9.WeatherRemoteDataSource(get<_i5.ApiClient>()));
  gh.lazySingleton<_i10.WeatherRepository>(
      () => _i11.WeatherRepositoryImpl(get<_i8.WeatherDataSource>()));
  return get;
}

class _$RegisterModule extends _i12.RegisterModule {}
