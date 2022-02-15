part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {
  const WeatherState();
}

class WeatherData extends WeatherState {
  final dynamic data;

  const WeatherData(this.data);
}
