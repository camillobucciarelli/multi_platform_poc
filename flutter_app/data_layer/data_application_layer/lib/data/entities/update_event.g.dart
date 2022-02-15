// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateEvent _$UpdateEventFromJson(Map<String, dynamic> json) => UpdateEvent(
      json['percentage'] as int,
      Weather.fromJson(json['weather'] as Map<String, dynamic>),
      DateTime.parse(json['date'] as String),
    );
