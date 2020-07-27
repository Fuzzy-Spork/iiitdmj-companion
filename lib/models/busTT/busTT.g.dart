// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'busTT.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusTT _$BusTTFromJson(Map<String, dynamic> json) {
  return BusTT(
    time: json['time'] as String,
    toFrom: json['toFrom'] as String,
  );
}

Map<String, dynamic> _$BusTTToJson(BusTT instance) => <String, dynamic>{
      'time': instance.time,
      'toFrom': instance.toFrom,
    };
