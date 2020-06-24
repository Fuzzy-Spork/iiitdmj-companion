// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Class _$ClassFromJson(Map<String, dynamic> json) {
  return Class(
    course: json['course'] as String,
    day: _$enumDecodeNullable(_$DayEnumMap, json['day']),
    timeStart: json['timeStart'] as int,
    timeEnd: json['timeEnd'] as int,
    venue: _$enumDecodeNullable(_$VenueEnumMap, json['venue']),
    group: _$enumDecodeNullable(_$GroupEnumMap, json['group']),
  );
}

Map<String, dynamic> _$ClassToJson(Class instance) => <String, dynamic>{
      'course': instance.course,
      'group': _$GroupEnumMap[instance.group],
      'day': _$DayEnumMap[instance.day],
      'timeStart': instance.timeStart,
      'timeEnd': instance.timeEnd,
      'venue': _$VenueEnumMap[instance.venue],
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

const _$VenueEnumMap = {
  Venue.L102: 'L102',
  Venue.L106: 'L106',
  Venue.L201: 'L201',
  Venue.L202: 'L202',
  Venue.L206: 'L206',
  Venue.L207: 'L207',
  Venue.L107: 'L107',
  Venue.CR101: 'CR101',
  Venue.CR102: 'CR102',
  Venue.CR103: 'CR103',
  Venue.CR104: 'CR104',
  Venue.CR106: 'CR106',
  Venue.CR107: 'CR107',
  Venue.CR108: 'CR108',
  Venue.CR109: 'CR109',
  Venue.CR201: 'CR201',
  Venue.CR202: 'CR202',
  Venue.CR203: 'CR203',
  Venue.CR204: 'CR204',
  Venue.CR205: 'CR205',
  Venue.CR206: 'CR206',
  Venue.CR207: 'CR207',
  Venue.CR208: 'CR208',
  Venue.CR209: 'CR209',
  Venue.UpperCC: 'Upper CC',
  Venue.LowerCC: 'Lower CC',
  Venue.ElectronicsLab: 'Electronics Lab',
  Venue.Workshop: 'Workshop',
  Venue.DesignStudio: 'Design Studio',
};

const _$GroupEnumMap = {
  Group.A: 'A',
  Group.B: 'B',
};
