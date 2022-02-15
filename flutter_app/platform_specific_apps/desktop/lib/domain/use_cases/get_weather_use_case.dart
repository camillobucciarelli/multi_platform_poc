import 'package:data_application_layer/data/entities/weather_entity.dart';
import 'package:data_application_layer/domain/repositories/weather_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetWeatherUseCase {
  final WeatherRepository _repository;

  GetWeatherUseCase(this._repository);

  Future<Either<Exception, Weather>> call() => _repository.getWeather();
}
