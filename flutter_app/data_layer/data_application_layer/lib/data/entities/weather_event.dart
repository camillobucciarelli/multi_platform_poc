import 'package:json_annotation/json_annotation.dart';

import 'weather_entity.dart';

part 'weather_event.g.dart';

@JsonSerializable(createToJson: false)
class WeatherEvent {
  final Weather weather;
  final DateTime date;

  WeatherEvent(this.weather, this.date);

  factory WeatherEvent.fromJson(Map<String, dynamic> json) => _$WeatherEventFromJson(json);

  @override
  String toString() {
    return 'WeatherEvent{weather: $weather, date: $date}';
  }
}
