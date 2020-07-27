import 'package:json_annotation/json_annotation.dart';

part 'busTT.g.dart';

@JsonSerializable()
class BusTT {
  String time;
  String toFrom;

  BusTT({this.time, this.toFrom});

  factory BusTT.fromJson(Map<String, dynamic> json) => _$BusTTFromJson(json);

  Map<String, dynamic> toJson() => _$BusTTToJson(this);
}
