import '../entities/update_event.dart';
import '../entities/weather_entity.dart';
import '../entities/weather_event.dart';

abstract class WeatherDataSource {
  Future<Weather> getWeather();

  Stream<WeatherEvent> getWeatherStreamed();

  Future<Weather> sendWeather(Weather weather);

  Stream<UpdateEvent> sendWeatherStreamed(Weather weather);
}
