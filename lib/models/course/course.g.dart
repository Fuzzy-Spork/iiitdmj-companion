// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) {
  return Course(
    name: json['name'] as String,
    code: json['code'] as String,
    sem: _$enumDecodeNullable(_$SemesterEnumMap, json['sem']),
    instructors:
        (json['instructors'] as List)?.map((e) => e as String)?.toList(),
    year: json['year'] as String,
    group: json['group'] as bool,
    lab: json['lab'] as bool,
    branch: json['branch'] as String,
    credits: json['credits'] as int,
  );
}

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'instructors': instance.instructors,
      'year': instance.year,
      'sem': _$SemesterEnumMap[instance.sem],
      'group': instance.group,
      'lab': instance.lab,
      'branch': instance.branch,
  'credits': instance.credits,
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

const _$SemesterEnumMap = {
  Semester.even: 'Even',
  Semester.odd: 'Odd',
};
