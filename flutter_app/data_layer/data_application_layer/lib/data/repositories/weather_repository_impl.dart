import 'package:data_application_layer/data/data_sources/weather_data_source.dart';
import 'package:data_application_layer/data/entities/update_event.dart';
import 'package:data_application_layer/data/entities/weather_event.dart';
import 'package:data_application_layer/domain/repositories/weather_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../entities/weather_entity.dart';

@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource _dataSource;

  WeatherRepositoryImpl(this._dataSource);

  @override
  Future<Either<Exception, Weather>> getWeather() async {
    try {
      final response = await _dataSource.getWeather();
      return Right(response);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Either<Exception, Stream<WeatherEvent>> getWeatherStreamed() {
    try {
      return Right(_dataSource.getWeatherStreamed());
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, Weather>> sendWeather(Weather weather) async {
    try {
      final response = await _dataSource.sendWeather(weather);
      return Right(response);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Either<Exception, Stream<UpdateEvent>> sendWeatherStreamed(Weather weather) {
    try {
      return Right(_dataSource.sendWeatherStreamed(weather));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
