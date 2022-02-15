import 'package:data_application_layer/data/entities/update_event.dart';
import 'package:data_application_layer/data/entities/weather_entity.dart';
import 'package:data_application_layer/domain/repositories/weather_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SendWeatherStreamUseCase {
  final WeatherRepository _repository;

  SendWeatherStreamUseCase(this._repository);

  Either<Exception, Stream<UpdateEvent>> call(Weather weather) {
    return _repository.sendWeatherStreamed(weather);
  }
}
