import 'package:fpdart/fpdart.dart';

import '../../data/entities/update_event.dart';
import '../../data/entities/weather_entity.dart';
import '../../data/entities/weather_event.dart';

abstract class WeatherRepository {
  Future<Either<Exception, Weather>> getWeather();

  Either<Exception, Stream<WeatherEvent>> getWeatherStreamed();

  Future<Either<Exception, Weather>> sendWeather(Weather weather);

  Either<Exception, Stream<UpdateEvent>> sendWeatherStreamed(Weather weather);
}
