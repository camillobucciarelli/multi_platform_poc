// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherEvent _$WeatherEventFromJson(Map<String, dynamic> json) => WeatherEvent(
      Weather.fromJson(json['weather'] as Map<String, dynamic>),
      DateTime.parse(json['date'] as String),
    );
