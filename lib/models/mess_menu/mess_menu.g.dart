// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mess_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessMenu _$MessMenuFromJson(Map<String, dynamic> json) {
  return MessMenu(
    day: _$enumDecodeNullable(_$DayEnumMap, json['day']),
    breakfast: (json['breakfast'] as List)?.map((e) => e as String)?.toList(),
    lunch: (json['lunch'] as List)?.map((e) => e as String)?.toList(),
    dinner: (json['dinner'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$MessMenuToJson(MessMenu instance) => <String, dynamic>{
      'day': _$DayEnumMap[instance.day],
      'breakfast': instance.breakfast,
      'lunch': instance.lunch,
      'dinner': instance.dinner,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$DayEnumMap = {
  Day.Monday: 'Monday',
  Day.Tuesday: 'Tuesday',
  Day.Wednesday: 'Wednesday',
  Day.Thursday: 'Thursday',
  Day.Friday: 'Friday',
  Day.Saturday: 'Saturday',
  Day.Sunday: 'Sunday',
};
