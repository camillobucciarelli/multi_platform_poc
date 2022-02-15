part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherGetData extends WeatherState {
  final Weather weather;

  const WeatherGetData(this.weather);
}

class WeatherGetError extends WeatherState {
  final String error;

  const WeatherGetError(this.error);
}

class WeatherSendData extends WeatherState {
  final Weather weather;

  const WeatherSendData(this.weather);
}

class WeatherSendError extends WeatherState {
  final String error;

  const WeatherSendError(this.error);
}
