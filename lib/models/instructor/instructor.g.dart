// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instructor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Instructor _$InstructorFromJson(Map<String, dynamic> json) {
  return Instructor(
    name: json['name'] as String,
    building: _$enumDecodeNullable(_$BuildingEnumMap, json['building']),
    designation:
        _$enumDecodeNullable(_$DesignationEnumMap, json['designation']),
    dept: (json['dept'] as List)
        ?.map((e) => _$enumDecodeNullable(_$DepartmentEnumMap, e))
        ?.toList(),
    code: json['code'] as String,
    email: json['email'] as String,
    tilda: json['tilda'] as String,
    phone: json['phone'] as String,
    post: json['post'] as String,
  );
}

Map<String, dynamic> _$InstructorToJson(Instructor instance) =>
    <String, dynamic>{
      'name': instance.name,
      'building': _$BuildingEnumMap[instance.building],
      'designation': _$DesignationEnumMap[instance.designation],
      'dept': instance.dept?.map((e) => _$DepartmentEnumMap[e])?.toList(),
      'code': instance.code,
      'email': instance.email,
      'tilda': instance.tilda,
      'phone': instance.phone,
      'post': instance.post,
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

const _$BuildingEnumMap = {
  Building.CC: 'Computer Center',
  Building.LHTC: 'LHTC',
  Building.CLC: 'Core Lab Complex',
  Building.Acad: 'Academic Block',
  Building.Bank: 'Near Bank',
};

const _$DesignationEnumMap = {
  Designation.Assistant: 'Assistant Professor',
  Designation.Associate: 'Associate Professor',
  Designation.Professor: 'Professor',
};

const _$DepartmentEnumMap = {
  Department.CSE: 'CSE',
  Department.ECE: 'ECE',
  Department.Design: 'Design',
  Department.ME: 'ME',
  Department.NS: 'NS',
};
