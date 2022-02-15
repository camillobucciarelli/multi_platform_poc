part of 'weather_stream_cubit.dart';

@immutable
abstract class WeatherState {
  const WeatherState();
}

class WeatherStreamGetData extends WeatherState {
  final String data;

  const WeatherStreamGetData(this.data);
}

class WeatherStreamSendData extends WeatherState {
  final UpdateEvent data;

  const WeatherStreamSendData(this.data);
}
