import 'package:data_application_layer/data/entities/weather_event.dart';
import 'package:data_application_layer/domain/repositories/weather_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetWeatherStreamUseCase {
  final WeatherRepository _repository;

  GetWeatherStreamUseCase(this._repository);

  Either<Exception, Stream<WeatherEvent>> call() => _repository.getWeatherStreamed();
}
