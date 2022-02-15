import 'dart:convert';

import 'package:data_application_layer/client/api_client.dart';
import 'package:data_application_layer/data/data_sources/weather_data_source.dart';
import 'package:data_application_layer/data/entities/update_event.dart';
import 'package:data_application_layer/data/entities/weather_entity.dart';
import 'package:injectable/injectable.dart';

import '../../entities/weather_event.dart';

@LazySingleton(as: WeatherDataSource)
class WeatherRemoteDataSource implements WeatherDataSource {
  final ApiClient _client;

  WeatherRemoteDataSource(this._client);

  @override
  Future<Weather> getWeather() async {
    final response = await _client.get('/weather');
    return Weather.fromJson(jsonDecode(response.body));
  }

  @override
  Stream<WeatherEvent> getWeatherStreamed() {
    return _client.getStreamed('/weather-stream', responseMapper: (response) {
      return WeatherEvent.fromJson(response as Map<String, dynamic>);
    });
  }

  @override
  Future<Weather> sendWeather(Weather weather) async {
    final response = await _client.post('/weather', body: weather.toJson());
    return Weather.fromJson(jsonDecode(response.body));
  }

  @override
  Stream<UpdateEvent> sendWeatherStreamed(Weather weather) {
    return _client.postStreamed(
      '/weather-stream',
      body: weather.toJson(),
      responseMapper: (response) => UpdateEvent.fromJson(response as Map<String, dynamic>),
    );
  }
}
