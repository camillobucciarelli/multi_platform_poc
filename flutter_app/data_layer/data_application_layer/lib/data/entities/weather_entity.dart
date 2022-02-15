import 'package:json_annotation/json_annotation.dart';

part 'weather_entity.g.dart';

@JsonSerializable()
class Weather {
  final String temperature;
  final String humidity;
  final String windSpeed;

  Weather(
    this.temperature,
    this.humidity,
    this.windSpeed,
  );

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  String toString() {
    return 'Weather{temperature: $temperature, humidity: $humidity, windSpeed: $windSpeed}';
  }
}
