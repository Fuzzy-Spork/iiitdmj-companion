// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'busTT.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusTT _$BusTTFromJson(Map<String, dynamic> json) {
  return BusTT(
    time: json['time'] as String,
    toFrom: json['toFrom'] as String,
    day: _$enumDecodeNullable(_$DayEnumMap, json['day']),
  );
}

Map<String, dynamic> _$BusTTToJson(BusTT instance) => <String, dynamic>{
      'time': instance.time,
      'toFrom': instance.toFrom,
      'day': _$DayEnumMap[instance.day],
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
