part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {
  const WeatherState();
}

class WeatherData extends WeatherState {
  final String data;

  const WeatherData(this.data);
}
