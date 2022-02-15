import 'package:data_application_layer/domain/repositories/weather_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetWeatherStreamUseCase {
  final WeatherRepository _repository;

  GetWeatherStreamUseCase(this._repository);

  Future<Stream<String>> call() => _repository.getTemperatures();
}
