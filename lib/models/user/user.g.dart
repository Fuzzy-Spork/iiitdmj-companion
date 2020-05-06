// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    name: json['name'] as String,
    branch: _$enumDecodeNullable(_$BranchEnumMap, json['branch']),
    year: _$enumDecodeNullable(_$YearEnumMap, json['year']),
    group: _$enumDecodeNullable(_$GroupEnumMap, json['group']),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'branch': _$BranchEnumMap[instance.branch],
      'year': _$YearEnumMap[instance.year],
      'group': _$GroupEnumMap[instance.group],
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

const _$BranchEnumMap = {
  Branch.CSE: 'CSE',
  Branch.ECE: 'ECE',
  Branch.ME: 'ME',
  Branch.Design: 'Design',
};

const _$YearEnumMap = {
  Year.first: 'First',
  Year.second: 'Second',
  Year.third: 'Third',
  Year.fourth: 'Fourth',
};

const _$GroupEnumMap = {
  Group.A: 'A',
  Group.B: 'B',
};
