import 'package:json_annotation/json_annotation.dart';

import 'weather_entity.dart';

part 'update_event.g.dart';

@JsonSerializable(createToJson: false)
class UpdateEvent {
  final int percentage;
  final Weather weather;
  final DateTime date;

  UpdateEvent(this.percentage, this.weather, this.date);

  factory UpdateEvent.fromJson(Map<String, dynamic> json) => _$UpdateEventFromJson(json);

  @override
  String toString() {
    return 'UpdateEvent{percentage: $percentage, weather: $weather, date: $date}';
  }
}
