// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Class _$ClassFromJson(Map<String, dynamic> json) {
  return Class(
    json['course'] as String,
    json['day'] as String,
    json['timeStart'] == null
        ? null
        : DateTime.parse(json['timeStart'] as String),
    json['timeEnd'] == null ? null : DateTime.parse(json['timeEnd'] as String),
    json['venue'] as String,
  );
}

Map<String, dynamic> _$ClassToJson(Class instance) => <String, dynamic>{
      'course': instance.course,
      'day': instance.day,
      'timeStart': instance.timeStart?.toIso8601String(),
      'timeEnd': instance.timeEnd?.toIso8601String(),
      'venue': instance.venue,
    };
